// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => _BranchModel(
  timer: (json['timer'] as num?)?.toInt(),
  canon: json['canon'] as String?,
  choices: (json['choices'] as List<dynamic>)
      .map((e) => DialogChoices.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BranchModelToJson(_BranchModel instance) =>
    <String, dynamic>{
      'timer': instance.timer,
      'canon': instance.canon,
      'choices': instance.choices,
    };
