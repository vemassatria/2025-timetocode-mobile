// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog_choices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DialogChoices _$DialogChoicesFromJson(Map<String, dynamic> json) =>
    _DialogChoices(
      text: json['text'] as String,
      next: json['next'] as String,
      nextType: json['nextType'] as String,
    );

Map<String, dynamic> _$DialogChoicesToJson(_DialogChoices instance) =>
    <String, dynamic>{
      'text': instance.text,
      'next': instance.next,
      'nextType': instance.nextType,
    };
