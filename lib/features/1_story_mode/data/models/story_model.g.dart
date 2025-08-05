// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoryModel _$StoryModelFromJson(Map<String, dynamic> json) => _StoryModel(
  level: (json['level'] as num).toInt(),
  description: json['description'] as String,
  title: json['title'] as String,
  background: json['background'] as String,
  character1: json['character1'] as String,
  character2: json['character2'] as String,
  character1Images: (json['character1Images'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  character2Images: (json['character2Images'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  ilustrations: (json['ilustrations'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  preDialog: (json['preDialog'] as List<dynamic>?)
      ?.map((e) => PreDialogModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  dialogs: (json['dialogs'] as List<dynamic>)
      .map((e) => DialogModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  questions: (json['questions'] as List<dynamic>)
      .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  dragAndDrop: (json['dragAndDrop'] as List<dynamic>?)
      ?.map((e) => DragAndDropModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  summary: (json['summary'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  start: json['start'] as String,
  typeStart: json['typeStart'] as String,
);

Map<String, dynamic> _$StoryModelToJson(_StoryModel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'description': instance.description,
      'title': instance.title,
      'background': instance.background,
      'character1': instance.character1,
      'character2': instance.character2,
      'character1Images': instance.character1Images,
      'character2Images': instance.character2Images,
      'ilustrations': instance.ilustrations,
      'preDialog': instance.preDialog,
      'dialogs': instance.dialogs,
      'questions': instance.questions,
      'dragAndDrop': instance.dragAndDrop,
      'summary': instance.summary,
      'start': instance.start,
      'typeStart': instance.typeStart,
    };
