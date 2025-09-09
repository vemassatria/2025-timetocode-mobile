// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drag_and_drop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DragAndDropModel _$DragAndDropModelFromJson(Map<String, dynamic> json) =>
    _DragAndDropModel(
      id: json['id'] as String,
      instruction: json['instruction'] as String,
      scaffoldCode: json['scaffoldCode'] as String?,
      draggableOptions: (json['draggableOptions'] as List<dynamic>)
          .map((e) => DraggableModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dropZones: (json['dropZones'] as List<dynamic>)
          .map((e) => DropZoneModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctSequence: (json['correctSequence'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      next: json['next'] as String?,
      nextType: json['nextType'] as String?,
      consequences: (json['consequences'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$DragAndDropModelToJson(_DragAndDropModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'instruction': instance.instruction,
      'scaffoldCode': instance.scaffoldCode,
      'draggableOptions': instance.draggableOptions,
      'dropZones': instance.dropZones,
      'correctSequence': instance.correctSequence,
      'next': instance.next,
      'nextType': instance.nextType,
      'consequences': instance.consequences,
    };
