// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draggable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DraggableModel _$DraggableModelFromJson(Map<String, dynamic> json) =>
    _DraggableModel(
      id: json['id'] as String,
      content: ContentComponentModel.fromJson(
        json['content'] as Map<String, dynamic>,
      ),
      info: json['info'] as String?,
    );

Map<String, dynamic> _$DraggableModelToJson(_DraggableModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'info': instance.info,
    };
