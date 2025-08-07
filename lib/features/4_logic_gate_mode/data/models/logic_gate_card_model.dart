import 'package:freezed_annotation/freezed_annotation.dart';

part 'logic_gate_card_model.freezed.dart';

enum LogicGateType { AND, OR, NAND, NOR, XOR }

@freezed
abstract class LogicGateCardModel with _$LogicGateCardModel {
  const factory LogicGateCardModel({
    required int id,
    required LogicGateType type,
  }) = _LogicGateCardModel;
}
