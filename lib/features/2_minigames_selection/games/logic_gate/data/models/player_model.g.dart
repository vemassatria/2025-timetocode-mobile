// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayerModel _$PlayerModelFromJson(Map<String, dynamic> json) => _PlayerModel(
  id: (json['id'] as num).toInt(),
  hand: (json['hand'] as List<dynamic>)
      .map((e) => LogicGateCardModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  targetValue: (json['targetValue'] as num).toInt(),
);

Map<String, dynamic> _$PlayerModelToJson(_PlayerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hand': instance.hand,
      'targetValue': instance.targetValue,
    };
