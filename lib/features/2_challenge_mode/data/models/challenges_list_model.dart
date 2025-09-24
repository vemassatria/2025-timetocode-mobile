import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/2_challenge_mode/data/models/challenge_model.dart';

part 'challenges_list_model.freezed.dart';
part 'challenges_list_model.g.dart';

@freezed
abstract class ChallengesListModel with _$ChallengesListModel {
  const factory ChallengesListModel({
    required List<ChallengeModel> challenges,
  }) = _ChallengesListModel;

  factory ChallengesListModel.fromJson(Map<String, dynamic> json) =>
      _$ChallengesListModelFromJson(json);
}
