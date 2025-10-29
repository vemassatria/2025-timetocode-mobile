// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardSlotModel _$CardSlotModelFromJson(Map<String, dynamic> json) =>
    _CardSlotModel(
      id: (json['id'] as num).toInt(),
      placedCard: json['placedCard'] == null
          ? null
          : LogicGateCardModel.fromJson(
              json['placedCard'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CardSlotModelToJson(_CardSlotModel instance) =>
    <String, dynamic>{'id': instance.id, 'placedCard': instance.placedCard};
