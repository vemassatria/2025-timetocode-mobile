// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matrix_command_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatrixCommandModel _$MatrixCommandModelFromJson(Map<String, dynamic> json) =>
    _MatrixCommandModel(
      command: json['command'] as String,
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$MatrixCommandModelToJson(_MatrixCommandModel instance) =>
    <String, dynamic>{'command': instance.command, 'value': instance.value};
