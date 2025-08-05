// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choices_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChoicesModel _$ChoicesModelFromJson(Map<String, dynamic> json) =>
    _ChoicesModel(
      text: json['text'] as String,
      next: json['next'] as String?,
      nextType: json['nextType'] as String?,
      nextDifficulty: json['nextDifficulty'] as String?,
      isCorrect: json['isCorrect'] as bool?,
    );

Map<String, dynamic> _$ChoicesModelToJson(_ChoicesModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'next': instance.next,
      'nextType': instance.nextType,
      'nextDifficulty': instance.nextDifficulty,
      'isCorrect': instance.isCorrect,
    };
