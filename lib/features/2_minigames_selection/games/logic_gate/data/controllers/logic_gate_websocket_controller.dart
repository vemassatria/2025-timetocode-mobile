import 'dart:async';
import 'dart:developer';
import 'dart:math' hide log;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/providers/internet_status.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/states/logic_gate_websocket_state.dart';

final logicGateWebsocketControllerProvider =
    NotifierProvider.autoDispose<
      LogicGateWebsocketController,
      LogicGateWebsocketState
    >(LogicGateWebsocketController.new);

class LogicGateWebsocketController
    extends AutoDisposeNotifier<LogicGateWebsocketState> {
  static const String _serverUrl = 'http://192.168.1.10:3000';
  ProviderSubscription<AsyncValue<InternetConnectionStatus>>? _internetStatus;
  Socket? _socket;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;

  @override
  LogicGateWebsocketState build() {
    _listenToInternetStatus();
    ref.onDispose(() {
      log('Disposing LogicGateWebsocketController');
      _internetStatus?.close();
      _socket?.dispose();
      _socket = null;
    });

    return const LogicGateWebsocketState(
      status: LogicGateWebsocketStatus.initial,
    );
  }

  void _listenToInternetStatus() {
    _internetStatus ??= ref.listen<AsyncValue<InternetConnectionStatus>>(
      internetStatusProvider,
      (previous, next) {
        log('Internet status changed: $next');
      },
      onError: (error, stackTrace) {
        log('Error listening to internet status: $error');
        state = state.copyWith(status: LogicGateWebsocketStatus.error);
      },
    );
  }

  void _initiateConnection() {
    if (state.status == LogicGateWebsocketStatus.connected ||
        state.status == LogicGateWebsocketStatus.connecting) {
      log('Already connected or connecting');
      return;
    }

    if (_internetStatus!.read().value != InternetConnectionStatus.connected) {
      log('No internet connection. Cannot connect to WebSocket.');
      state = state.copyWith(status: LogicGateWebsocketStatus.error);
      return;
    }

    state = state.copyWith(
      status: LogicGateWebsocketStatus.connecting,
      errorMessage: null,
    );
    log('Connecting to WebSocket...: $_serverUrl');

    _socket = io(_serverUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    _socket!.onConnect((_) {
      log('Connected to WebSocket');
      state = state.copyWith(status: LogicGateWebsocketStatus.connected);
    });

    _socket!.onDisconnect((_) {
      log('Disconnected from WebSocket');
      state = state.copyWith(status: LogicGateWebsocketStatus.disconnected);
    });

    _socket!.onError((data) {
      log('WebSocket error: $data');
      state = state.copyWith(
        status: LogicGateWebsocketStatus.error,
        errorMessage: data.toString(),
      );
    });

    _socket!.onConnectError((data) {
      log('WebSocket connection error: $data');
      state = state.copyWith(
        status: LogicGateWebsocketStatus.error,
        errorMessage: data.toString(),
      );
    });
  }

  void _handleGameUpdate(dynamic data) {
    log('Received game update: $data');
    // Process the game update data as needed
  }

  void _handleGameOver(dynamic data) {
    log('Game over: $data');
    // Process the game over data as needed
  }

  void joinGame(String gameId, String playerId) {
    send('join_game', {'gameId': gameId, 'playerId': playerId});
    log('Attempting to join game: $gameId as player: $playerId');
  }

  void sendPlayerMove(String gameId, String playerId, dynamic moveData) {
    send('player_move', {
      'gameId': gameId,
      'playerId': playerId,
      'move': moveData,
    });
  }

  void _scheduleReconnect() {
    // Hindari jadwal reconnect jika sudah ada atau jika koneksi sedang berjalan/berhasil
    if (_reconnectTimer?.isActive ??
        false ||
            state.status == LogicGateWebsocketStatus.connected ||
            state.status == LogicGateWebsocketStatus.connecting)
      return;

    // Jangan reconnect jika internet mati
    if (ref.read(internetStatusProvider).value !=
        InternetConnectionStatus.connected) {
      log('Reconnect scheduled but no internet connection.');
      state = state.copyWith(
        status: LogicGateWebsocketStatus.disconnected,
      ); // Pastikan status disconnected
      return;
    }

    _reconnectAttempts++;
    // Exponential backoff: 2, 4, 8, 16, 32, max 60 detik
    final delaySeconds = min(pow(2, _reconnectAttempts), 60).toInt();

    log(
      'WebSocket connection lost/failed. Scheduling reconnect attempt $_reconnectAttempts in $delaySeconds seconds...',
    );
    // Set status ke disconnected (atau biarkan error jika sebelumnya error)
    // agar UI bisa menampilkan status "mencoba menyambung ulang"
    if (state.status != LogicGateWebsocketStatus.error) {
      state = state.copyWith(status: LogicGateWebsocketStatus.disconnected);
    }

    _reconnectTimer = Timer(Duration(seconds: delaySeconds), () {
      // Cek lagi internet sebelum benar-benar mencoba
      if (ref.read(internetStatusProvider).value ==
          InternetConnectionStatus.connected) {
        log('Attempting reconnect #$_reconnectAttempts...');
        _initiateConnection(); // Coba konek lagi
      } else {
        log(
          'Reconnect attempt #$_reconnectAttempts skipped, internet still disconnected.',
        );
        state = state.copyWith(status: LogicGateWebsocketStatus.disconnected);
        _scheduleReconnect(); // Jadwalkan ulang karena internet belum ada
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
      // Opsional: Tambahkan ke antrian atau tampilkan error ke user
    }
  }
}
