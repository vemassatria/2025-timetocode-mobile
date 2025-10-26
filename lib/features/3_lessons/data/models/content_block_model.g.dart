// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_block_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContentBlockModel _$ContentBlockModelFromJson(Map<String, dynamic> json) =>
    _ContentBlockModel(
      type: json['type'] as String,
      data: ContentBlockData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentBlockModelToJson(_ContentBlockModel instance) =>
    <String, dynamic>{'type': instance.type, 'data': instance.data};
