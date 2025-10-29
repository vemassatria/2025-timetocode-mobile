import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/models/binary_slot_model.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/models/card_slot_model.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/models/player_model.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/services/ai_service.dart';

part 'logic_gate_state.freezed.dart';
part 'logic_gate_state.g.dart';

@freezed
abstract class LogicGateState with _$LogicGateState {
  const factory LogicGateState({
    List<BinarySlotModel>? binarySlots,
    List<CardSlotModel>? cardSlots,
    PlayerModel? player,
    PlayerModel? opponent,
    @Default(1) int currentPlayerId,
    int? lastUpdatedCardSlotId,
    int? winnerPlayerId,

    @Default(false) bool vsAI,
    @Default(false) bool isOnline,
    @Default(AiDifficulty.medium) AiDifficulty difficulty,
    bool? isLoading,
  }) = _LogicGateState;

  factory LogicGateState.fromJson(Map<String, dynamic> json) =>
      _$LogicGateStateFromJson(json);
}
