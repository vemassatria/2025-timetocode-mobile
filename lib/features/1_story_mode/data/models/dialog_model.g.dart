// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DialogModel _$DialogModelFromJson(Map<String, dynamic> json) => _DialogModel(
  id: json['id'] as String,
  conditions: (json['conditions'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  backgroundIndex: (json['backgroundIndex'] as num).toInt(),
  dialogs: (json['dialogs'] as List<dynamic>)
      .map((e) => TextDialogModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  next: json['next'] as String?,
  nextType: json['nextType'] as String?,
  branch: json['branch'] == null
      ? null
      : BranchModel.fromJson(json['branch'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DialogModelToJson(_DialogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conditions': instance.conditions,
      'backgroundIndex': instance.backgroundIndex,
      'dialogs': instance.dialogs,
      'next': instance.next,
      'nextType': instance.nextType,
      'branch': instance.branch,
    };
