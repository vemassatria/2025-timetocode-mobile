// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matrix_level_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatrixLevelModel _$MatrixLevelModelFromJson(Map<String, dynamic> json) =>
    _MatrixLevelModel(
      levelId: (json['levelId'] as num).toInt(),
      code: json['code'] as String,
      initialPointerPosition: (json['initialPointerPosition'] as num).toInt(),
      targetPointerPosition: (json['targetPointerPosition'] as num).toInt(),
      commands: (json['commands'] as List<dynamic>)
          .map((e) => MatrixCommandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatrixLevelModelToJson(_MatrixLevelModel instance) =>
    <String, dynamic>{
      'levelId': instance.levelId,
      'code': instance.code,
      'initialPointerPosition': instance.initialPointerPosition,
      'targetPointerPosition': instance.targetPointerPosition,
      'commands': instance.commands,
    };
