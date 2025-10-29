import 'dart:async';
import 'dart:developer';
import 'dart:math' hide log;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/models/player_model.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/providers/internet_status.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/states/logic_gate_websocket_state.dart';

import '../states/logic_gate_state.dart';

final logicGateWebsocketControllerProvider =
    NotifierProvider.autoDispose<
      LogicGateWebsocketController,
      LogicGateWebsocketState
    >(LogicGateWebsocketController.new);

class LogicGateWebsocketController
    extends AutoDisposeNotifier<LogicGateWebsocketState> {
  static const String _serverUrl = 'http://192.168.1.10:3000';
  KeepAliveLink? _keepAliveLink;
  ProviderSubscription<AsyncValue<InternetConnectionStatus>>? _internetStatus;
  Socket? _socket;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;

  @override
  LogicGateWebsocketState build() {
    _keepAliveLink ??= ref.keepAlive();
    _listenToInternetStatus();
    connect();
    ref.onDispose(() {
      log('Disposing LogicGateWebsocketController');
      leaveRoom();
      _internetStatus?.close();
    });

    return const LogicGateWebsocketState(
      status: LogicGateWebsocketStatus.initial,
    );
  }

  void _listenToInternetStatus() {
    _internetStatus ??= ref.listen<AsyncValue<InternetConnectionStatus>>(
      internetStatusProvider,
      (previous, next) {
        final newStatus = next.valueOrNull;

        if (newStatus == InternetConnectionStatus.connected) {
          if (state.status == LogicGateWebsocketStatus.disconnected ||
              state.status == LogicGateWebsocketStatus.error) {
            log('Internet is back. Attempting to reconnect...');
            _initiateConnection();
          }
        } else if (newStatus == InternetConnectionStatus.disconnected) {
          log('Internet lost. Forcing disconnect...');
          state = state.copyWith(status: LogicGateWebsocketStatus.disconnected);
        }
      },
      onError: (error, stackTrace) {
        log('Error listening to internet status: $error');
        state = state.copyWith(status: LogicGateWebsocketStatus.error);
      },
    );
  }

  void connect() {
    _reconnectAttempts = 0;
    _reconnectTimer?.cancel();
    _initiateConnection();
  }

  void _initiateConnection() {
    if (state.status == LogicGateWebsocketStatus.connected ||
        state.status == LogicGateWebsocketStatus.connecting) {
      log('Already connected or connecting');
      return;
    }

    final hasInternet =
        ref.read(internetStatusProvider).valueOrNull ==
        InternetConnectionStatus.connected;

    if (!hasInternet) {
      log('No internet connection. Cannot connect to WebSocket.');
      state = state.copyWith(status: LogicGateWebsocketStatus.disconnected);
      return;
    }

    state = state.copyWith(
      status: LogicGateWebsocketStatus.connecting,
      errorMessage: null,
    );
    log('Connecting to WebSocket...: $_serverUrl');

    _socket?.dispose();
    _socket = io(_serverUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'reconnection': false,
    });

    _socket!
      ..onConnect((_) {
        log('Connected to WebSocket');
        final currentRoomId = state.roomId;
        final currentPlayerId = state.gameState?.player?.id;

        if (currentRoomId != null && currentPlayerId != null) {
          log('This is a reconnect. Sending playerReconnect event...');
          send('playerReconnect', {
            'roomId': currentRoomId,
            'playerId': currentPlayerId,
          });
        } else {
          log('This is a first-time connection.');
          state = state.copyWith(status: LogicGateWebsocketStatus.connected);
          _resetReconnectAttempts();
        }
      })
      ..onDisconnect((_) {
        log('Disconnected from WebSocket');
        if (state.status != LogicGateWebsocketStatus.initial) {
          state = state.copyWith(status: LogicGateWebsocketStatus.disconnected);
          _scheduleReconnect();
        }
      })
      ..onError((data) {
        log('WebSocket error: $data');
        state = state.copyWith(
          status: LogicGateWebsocketStatus.error,
          errorMessage: data.toString(),
        );
        _scheduleReconnect();
      })
      ..onConnectError((data) {
        log('WebSocket connection error: $data');
        state = state.copyWith(
          status: LogicGateWebsocketStatus.error,
          errorMessage: data.toString(),
        );
        _scheduleReconnect();
      })
      ..on('roomCreated', _handleRoomCreated)
      ..on('roomJoined', _handleRoomJoined)
      ..on('gameStateUpdate', _handleGameStateUpdate)
      ..on('gameOver', _handleGameOver)
      ..on('opponentDisconnected', _handleOpponentDisconnected)
      ..on('opponentReconnecting', _handleOpponentReconnecting)
      ..on('opponentReconnected', _handleOpponentReconnected)
      ..on('error', _handleError);

    _socket!.connect();
  }

  void _handleGameOver(dynamic data) {
    Future.delayed(const Duration(seconds: 3), () {
      leaveRoom();
    });
  }

  void _handleOpponentDisconnected(dynamic data) {
    state = state.copyWith(
      status: LogicGateWebsocketStatus.opponentDisconnected,
      gameState: state.gameState!.copyWith(winnerPlayerId: state.playerId),
      errorMessage: 'Opponent left the game. Game over.',
    );
    _disconnectAndCleanup();
  }

  void _handleOpponentReconnecting(dynamic data) {
    state = state.copyWith(
      status: LogicGateWebsocketStatus.opponentReconnecting,
      errorMessage: 'Opponent is reconnecting...',
    );
  }

  void _handleOpponentReconnected(dynamic data) {
    state = state.copyWith(
      status: LogicGateWebsocketStatus.connected,
      errorMessage: null,
    );
  }

  void _handleRoomJoined(dynamic data) {
    log('Joined room successfully: $data');
    try {
      final String joinedRoomId = data['roomId'] as String;
      final int playerId = data['playerId'] as int;
      state = state.copyWith(roomId: joinedRoomId, playerId: playerId);
    } catch (e) {
      log('Error handling roomJoined: $e', error: e);
      state = state.copyWith(
        status: LogicGateWebsocketStatus.error,
        errorMessage: 'Failed to parse room data.',
      );
    }
  }

  void createRoom() {
    send('createRoom', {});
    state = state.copyWith(status: LogicGateWebsocketStatus.waitingForOpponent);
  }

  void joinRoom(String roomId) {
    send('joinRoom', roomId);
    log('Attempting to join room: $roomId');
  }

  void sendPlayerMove(int cardSlotId, int cardId) {
    send('playerMove', {'cardSlotId': cardSlotId, 'cardId': cardId});
  }

  void leaveRoom() {
    if (state.status == LogicGateWebsocketStatus.initial) {
      return;
    }

    _reconnectAttempts = 0;
    _reconnectTimer?.cancel();

    if (_socket != null) {
      _socket!.emit('leaveRoom', {});
    }

    _disconnectAndCleanup();
    state = const LogicGateWebsocketState(
      status: LogicGateWebsocketStatus.initial,
    );
  }

  void _handleRoomCreated(dynamic data) {
    log('Room created successfully: $data');
    try {
      final String newRoomId = data['roomId'] as String;
      final int playerId = data['playerId'] as int;
      state = state.copyWith(roomId: newRoomId, playerId: playerId);
    } catch (e) {
      log('Error handling roomCreated: $e', error: e);
      state = state.copyWith(
        status: LogicGateWebsocketStatus.error,
        errorMessage: 'Failed to parse room data.',
      );
    }
  }

  void _handleGameStateUpdate(dynamic data) {
    log('Game state update received: $data');
    try {
      final LogicGateState updatedGameState = LogicGateState.fromJson(
        data as Map<String, dynamic>,
      );
      state = state.copyWith(
        gameState: updatedGameState,
        status: LogicGateWebsocketStatus.connected,
        errorMessage: null,
      );
      _resetReconnectAttempts();
    } catch (e) {
      log('Error handling gameUpdate: $e', error: e);
      state = state.copyWith(
        status: LogicGateWebsocketStatus.error,
        errorMessage: 'Failed to parse game update data.',
      );
    }
  }

  void _handleError(dynamic data) {
    log('Error from server: $data');
    state = state.copyWith(
      status: LogicGateWebsocketStatus.error,
      errorMessage: data.toString(),
    );
  }

  void _disconnectAndCleanup() {
    log('Cleaning up connection...');
    _reconnectTimer?.cancel();
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
    _releaseKeepAlive();
  }

  void manualDisconnect() {
    log('Manual disconnect requested.');
    _reconnectAttempts = 0;
    _reconnectTimer?.cancel();
    _disconnectAndCleanup();
    state = const LogicGateWebsocketState(
      status: LogicGateWebsocketStatus.initial,
    );
  }

  void _scheduleReconnect() {
    if (_reconnectTimer?.isActive ??
        false ||
            state.status == LogicGateWebsocketStatus.connected ||
            state.status == LogicGateWebsocketStatus.connecting ||
            state.status == LogicGateWebsocketStatus.initial) {
      log(
        'Reconnect attempt skipped (already active, connected, or connecting).',
      );
      return;
    }

    if (ref.read(internetStatusProvider).value !=
        InternetConnectionStatus.connected) {
      log(
        'Reconnect scheduled but no internet connection. Waiting for internet listener...',
      );
      state = state.copyWith(status: LogicGateWebsocketStatus.disconnected);
      return;
    }

    _reconnectAttempts++;
    final delaySeconds = min(pow(2, _reconnectAttempts), 60).toInt();

    log(
      'WebSocket connection lost/failed. Scheduling reconnect attempt $_reconnectAttempts in $delaySeconds seconds...',
    );

    if (state.status != LogicGateWebsocketStatus.error) {
      state = state.copyWith(status: LogicGateWebsocketStatus.disconnected);
    }

    _reconnectTimer = Timer(Duration(seconds: delaySeconds), () {
      if (ref.read(internetStatusProvider).value ==
          InternetConnectionStatus.connected) {
        log('Attempting reconnect #$_reconnectAttempts...');
        _initiateConnection();
      } else {
        log(
          'Reconnect attempt #$_reconnectAttempts skipped, internet still disconnected.',
        );
        state = state.copyWith(status: LogicGateWebsocketStatus.disconnected);
      }
    });
  }

  void _resetReconnectAttempts() {
    if (_reconnectTimer?.isActive ?? false) {
      _reconnectTimer!.cancel();
      log('Reconnect timer cancelled.');
    }
    _reconnectAttempts = 0;
  }

  void send(String eventName, dynamic data) {
    if (state.status == LogicGateWebsocketStatus.connected && _socket != null) {
      log('Sending $eventName: $data');
      _socket!.emit(eventName, data);
    } else {
      log('Cannot send $eventName, WebSocket not connected.');
      state = state.copyWith(
        status: LogicGateWebsocketStatus.error,
        errorMessage: 'Cannot send data: Not connected.',
      );
      _scheduleReconnect();
    }
  }

  PlayerModel getWinner(int playerId) {
    if (state.gameState == null) {
      throw Exception('Game state is null');
    }
    if (state.gameState!.player != null &&
        state.gameState!.player!.id == playerId) {
      return state.gameState!.player!;
    } else if (state.gameState!.opponent != null &&
        state.gameState!.opponent!.id == playerId) {
      return state.gameState!.opponent!;
    } else {
      throw Exception('Player with id $playerId not found');
    }
  }

  void _releaseKeepAlive() {
    if (_keepAliveLink == null) return;
    _keepAliveLink!.close();
    _keepAliveLink = null;
  }
}
