import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/2_minigames/games/logic_gate/data/models/logic_gate_type.dart';

part 'logic_gate_card_model.freezed.dart';

@freezed
abstract class LogicGateCardModel with _$LogicGateCardModel {
  const factory LogicGateCardModel({
    required int id,
    required LogicGateType type,
  }) = _LogicGateCardModel;
}
