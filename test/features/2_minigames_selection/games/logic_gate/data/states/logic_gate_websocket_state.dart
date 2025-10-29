import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/states/logic_gate_state.dart';

part 'logic_gate_websocket_state.freezed.dart';

enum LogicGateWebsocketStatus {
  initial,
  connecting,
  connected,
  disconnected,
  error,
  opponentDisconnected,
  opponentReconnecting,
  waitingForOpponent,
}

@freezed
abstract class LogicGateWebsocketState with _$LogicGateWebsocketState {
  const factory LogicGateWebsocketState({
    final String? roomId,
    final int? playerId,
    final LogicGateState? gameState,
    required final LogicGateWebsocketStatus status,
    final String? errorMessage,
  }) = _LogicGateWebsocketState;
}
