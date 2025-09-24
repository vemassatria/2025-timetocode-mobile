import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/2_challenge_mode/data/models/challenge_level_model.dart';

part 'challenge_model.freezed.dart';
part 'challenge_model.g.dart';

@freezed
abstract class ChallengeModel with _$ChallengeModel {
  const factory ChallengeModel({
    required int challengeId,
    required String title,
    required List<ChallengeLevelModel> levels,
  }) = _ChallengeModel;

  factory ChallengeModel.fromJson(Map<String, dynamic> json) =>
      _$ChallengeModelFromJson(json);
}
