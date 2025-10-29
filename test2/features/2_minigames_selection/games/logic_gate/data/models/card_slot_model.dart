import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/models/logic_gate_card_model.dart';

part 'card_slot_model.freezed.dart';
part 'card_slot_model.g.dart';

@freezed
abstract class CardSlotModel with _$CardSlotModel {
  const factory CardSlotModel({
    required int id,
    LogicGateCardModel? placedCard,
  }) = _CardSlotModel;

  factory CardSlotModel.fromJson(Map<String, dynamic> json) =>
      _$CardSlotModelFromJson(json);
}
