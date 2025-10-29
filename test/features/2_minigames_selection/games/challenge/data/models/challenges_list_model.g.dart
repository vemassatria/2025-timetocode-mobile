// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenges_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChallengesListModel _$ChallengesListModelFromJson(Map<String, dynamic> json) =>
    _ChallengesListModel(
      challenges: (json['challenges'] as List<dynamic>)
          .map((e) => ChallengeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChallengesListModelToJson(
  _ChallengesListModel instance,
) => <String, dynamic>{'challenges': instance.challenges};
