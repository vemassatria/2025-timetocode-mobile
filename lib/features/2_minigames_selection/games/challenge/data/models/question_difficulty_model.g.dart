// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_difficulty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionDifficultyModel _$QuestionDifficultyModelFromJson(
  Map<String, dynamic> json,
) => _QuestionDifficultyModel(
  mudah: (json['mudah'] as List<dynamic>)
      .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  sedang: (json['sedang'] as List<dynamic>)
      .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  susah: (json['susah'] as List<dynamic>)
      .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$QuestionDifficultyModelToJson(
  _QuestionDifficultyModel instance,
) => <String, dynamic>{
  'mudah': instance.mudah,
  'sedang': instance.sedang,
  'susah': instance.susah,
};
