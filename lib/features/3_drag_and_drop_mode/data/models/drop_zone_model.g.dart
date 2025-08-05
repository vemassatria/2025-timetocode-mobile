// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_zone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DropZoneModel _$DropZoneModelFromJson(Map<String, dynamic> json) =>
    _DropZoneModel(
      id: json['id'] as String,
      acceptedIds: (json['acceptedIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      content: json['content'] == null
          ? null
          : ContentComponentModel.fromJson(
              json['content'] as Map<String, dynamic>,
            ),
      contentDraggable: json['contentDraggable'] == null
          ? null
          : DraggableModel.fromJson(
              json['contentDraggable'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$DropZoneModelToJson(_DropZoneModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'acceptedIds': instance.acceptedIds,
      'content': instance.content,
      'contentDraggable': instance.contentDraggable,
    };
