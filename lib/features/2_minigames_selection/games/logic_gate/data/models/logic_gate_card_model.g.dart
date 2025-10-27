// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logic_gate_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogicGateCardModel _$LogicGateCardModelFromJson(Map<String, dynamic> json) =>
    _LogicGateCardModel(
      id: (json['id'] as num).toInt(),
      type: $enumDecode(_$LogicGateTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$LogicGateCardModelToJson(_LogicGateCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$LogicGateTypeEnumMap[instance.type]!,
    };

const _$LogicGateTypeEnumMap = {
  LogicGateType.and: 'and',
  LogicGateType.or: 'or',
  LogicGateType.nand: 'nand',
  LogicGateType.nor: 'nor',
  LogicGateType.xor: 'xor',
};
