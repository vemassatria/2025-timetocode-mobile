// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matrix_question_bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatrixQuestionBankModel _$MatrixQuestionBankModelFromJson(
  Map<String, dynamic> json,
) => _MatrixQuestionBankModel(
  level1: (json['level1'] as List<dynamic>)
      .map((e) => MatrixLevelModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  level2: (json['level2'] as List<dynamic>)
      .map((e) => MatrixLevelModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  level3: (json['level3'] as List<dynamic>)
      .map((e) => MatrixLevelModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  level4: (json['level4'] as List<dynamic>)
      .map((e) => MatrixLevelModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  level5: (json['level5'] as List<dynamic>)
      .map((e) => MatrixLevelModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MatrixQuestionBankModelToJson(
  _MatrixQuestionBankModel instance,
) => <String, dynamic>{
  'level1': instance.level1,
  'level2': instance.level2,
  'level3': instance.level3,
  'level4': instance.level4,
  'level5': instance.level5,
};
