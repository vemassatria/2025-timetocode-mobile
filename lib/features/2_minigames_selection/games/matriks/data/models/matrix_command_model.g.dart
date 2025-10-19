// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matrix_command_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatrixCommandModel _$MatrixCommandModelFromJson(Map<String, dynamic> json) =>
    _MatrixCommandModel(
      type: json['type'] as String,
      count: (json['count'] as num?)?.toInt(),
      action: json['action'] as String,
    );

Map<String, dynamic> _$MatrixCommandModelToJson(_MatrixCommandModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'count': instance.count,
      'action': instance.action,
    };
