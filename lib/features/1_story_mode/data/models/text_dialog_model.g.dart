// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_dialog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TextDialogModel _$TextDialogModelFromJson(Map<String, dynamic> json) =>
    _TextDialogModel(
      line: json['line'] as String,
      reactionIndex: (json['reactionIndex'] as num).toInt(),
      characterIndex: (json['characterIndex'] as num).toInt(),
      ilustrationIndex: (json['ilustrationIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TextDialogModelToJson(_TextDialogModel instance) =>
    <String, dynamic>{
      'line': instance.line,
      'reactionIndex': instance.reactionIndex,
      'characterIndex': instance.characterIndex,
      'ilustrationIndex': instance.ilustrationIndex,
    };
