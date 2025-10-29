// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matrix_level_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatrixLevelModel _$MatrixLevelModelFromJson(
  Map<String, dynamic> json,
) => _MatrixLevelModel(
  levelId: (json['levelId'] as num).toInt(),
  questionCode: json['questionCode'] as String,
  initialMatrix: (json['initialMatrix'] as List<dynamic>)
      .map((e) => (e as List<dynamic>).map((e) => (e as num).toInt()).toList())
      .toList(),
  goalMatrix: (json['goalMatrix'] as List<dynamic>)
      .map((e) => (e as List<dynamic>).map((e) => (e as num).toInt()).toList())
      .toList(),
  commands: (json['commands'] as List<dynamic>)
      .map((e) => MatrixCommandModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MatrixLevelModelToJson(_MatrixLevelModel instance) =>
    <String, dynamic>{
      'levelId': instance.levelId,
      'questionCode': instance.questionCode,
      'initialMatrix': instance.initialMatrix,
      'goalMatrix': instance.goalMatrix,
      'commands': instance.commands,
    };
