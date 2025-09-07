import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/models/binary_slot_model.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/models/card_slot_model.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/models/player_model.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/services/ai_service.dart';

part 'logic_gate_state.freezed.dart';

@freezed
abstract class LogicGateState with _$LogicGateState {
  const factory LogicGateState({
    List<BinarySlotModel>? binarySlots,
    List<CardSlotModel>? cardSlots,

    PlayerModel? player,
    PlayerModel? opponent,

    @Default(1) int currentPlayerId,

    int? outputBinary,
    int? lastUpdatedCardSlotId,

    @Default(false) bool vsAI,
    @Default(AiDifficulty.medium) AiDifficulty difficulty,

    bool? isLoading,
  }) = _LogicGateState;
}
