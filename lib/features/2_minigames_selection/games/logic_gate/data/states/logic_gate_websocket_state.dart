import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/states/logic_gate_state.dart';

part 'logic_gate_websocket_state.freezed.dart';

enum LogicGateWebsocketStatus {
  initial,
  connecting,
  connected,
  disconnected,
  error,
}

@freezed
abstract class LogicGateWebsocketState with _$LogicGateWebsocketState {
  const factory LogicGateWebsocketState({
    required final LogicGateWebsocketStatus status,
    final String? errorMessage,
    final LogicGateState? gameState,
  }) = _LogicGateWebsocketState;
}
