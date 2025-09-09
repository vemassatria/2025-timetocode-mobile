// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predialog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PreDialogModel _$PreDialogModelFromJson(Map<String, dynamic> json) =>
    _PreDialogModel(
      id: json['id'] as String,
      text: json['text'] as String,
      next: json['next'] as String,
      nextType: json['nextType'] as String,
      conditions: (json['conditions'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$PreDialogModelToJson(_PreDialogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'next': instance.next,
      'nextType': instance.nextType,
      'conditions': instance.conditions,
    };
