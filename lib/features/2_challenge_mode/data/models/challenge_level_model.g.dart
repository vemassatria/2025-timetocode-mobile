// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_level_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChallengeLevelModel _$ChallengeLevelModelFromJson(Map<String, dynamic> json) =>
    _ChallengeLevelModel(
      id: (json['id'] as num).toInt(),
      levelName: json['levelName'] as String,
      questions: QuestionDifficultyModel.fromJson(
        json['questions'] as Map<String, dynamic>,
      ),
      dragAndDrop: (json['dragAndDrop'] as List<dynamic>?)
          ?.map((e) => DragAndDropModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChallengeLevelModelToJson(
  _ChallengeLevelModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'levelName': instance.levelName,
  'questions': instance.questions,
  'dragAndDrop': instance.dragAndDrop,
};
