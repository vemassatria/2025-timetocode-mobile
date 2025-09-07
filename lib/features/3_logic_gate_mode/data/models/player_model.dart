import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/models/logic_gate_card_model.dart';

part 'player_model.freezed.dart';

@freezed
abstract class PlayerModel with _$PlayerModel {
  const factory PlayerModel({
    required int id,
    required List<LogicGateCardModel> hand,
    required int targetValue,
  }) = _PlayerModel;
}
