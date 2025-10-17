// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChallengeModel _$ChallengeModelFromJson(Map<String, dynamic> json) =>
    _ChallengeModel(
      challengeId: (json['challengeId'] as num).toInt(),
      title: json['title'] as String,
      levels: (json['levels'] as List<dynamic>)
          .map((e) => ChallengeLevelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChallengeModelToJson(_ChallengeModel instance) =>
    <String, dynamic>{
      'challengeId': instance.challengeId,
      'title': instance.title,
      'levels': instance.levels,
    };
