// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binary_slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BinarySlotModel _$BinarySlotModelFromJson(Map<String, dynamic> json) =>
    _BinarySlotModel(
      id: (json['id'] as num).toInt(),
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BinarySlotModelToJson(_BinarySlotModel instance) =>
    <String, dynamic>{'id': instance.id, 'value': instance.value};
