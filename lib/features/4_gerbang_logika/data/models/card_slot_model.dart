import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/4_gerbang_logika/data/models/logic_gate_card_model.dart';

part 'card_slot_model.freezed.dart';

@freezed
abstract class CardSlotModel with _$CardSlotModel {
  const factory CardSlotModel({
    required int id,
    LogicGateCardModel? placedCard,
  }) = _CardSlotModel;
}
