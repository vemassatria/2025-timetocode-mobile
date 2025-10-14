// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'materi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MateriModel _$MateriModelFromJson(Map<String, dynamic> json) => _MateriModel(
  level: (json['level'] as num).toInt(),
  title: json['title'] as String,
  content: (json['content'] as List<dynamic>)
      .map((e) => ContentBlockModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MateriModelToJson(_MateriModel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'title': instance.title,
      'content': instance.content,
    };
