// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minigame_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MinigameModel _$MinigameModelFromJson(Map<String, dynamic> json) =>
    _MinigameModel(
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dragAndDrop: (json['dragAndDrop'] as List<dynamic>?)
          ?.map((e) => DragAndDropModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MinigameModelToJson(_MinigameModel instance) =>
    <String, dynamic>{
      'questions': instance.questions,
      'dragAndDrop': instance.dragAndDrop,
    };
