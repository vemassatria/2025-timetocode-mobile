// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaterialModel _$MaterialModelFromJson(Map<String, dynamic> json) => _MaterialModel(
  level: (json['level'] as num).toInt(),
  title: json['title'] as String,
  content: (json['content'] as List<dynamic>)
      .map((e) => ContentBlockModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  videoUrl: json['videoUrl'] as String?,
);

Map<String, dynamic> _$MaterialModelToJson(_MaterialModel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'title': instance.title,
      'content': instance.content,
      'videoUrl': instance.videoUrl,
    };
