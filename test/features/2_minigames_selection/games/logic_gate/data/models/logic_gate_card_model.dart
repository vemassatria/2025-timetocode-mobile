import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/models/logic_gate_type.dart';

part 'logic_gate_card_model.freezed.dart';
part 'logic_gate_card_model.g.dart';

@freezed
abstract class LogicGateCardModel with _$LogicGateCardModel {
  const factory LogicGateCardModel({
    required int id,
    required LogicGateType type,
  }) = _LogicGateCardModel;

  factory LogicGateCardModel.fromJson(Map<String, dynamic> json) =>
      _$LogicGateCardModelFromJson(json);
}
