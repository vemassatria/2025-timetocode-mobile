// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DialogModel _$DialogModelFromJson(Map<String, dynamic> json) => _DialogModel(
  id: json['id'] as String,
  dialogs: (json['dialogs'] as List<dynamic>)
      .map((e) => TextDialogModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  next: json['next'] as String?,
  nextType: json['nextType'] as String?,
  choices: (json['choices'] as List<dynamic>?)
      ?.map((e) => DialogChoices.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DialogModelToJson(_DialogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dialogs': instance.dialogs,
      'next': instance.next,
      'nextType': instance.nextType,
      'choices': instance.choices,
    };
