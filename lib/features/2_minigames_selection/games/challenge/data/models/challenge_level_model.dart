import 'package:freezed_annotation/freezed_annotation.dart';
import 'question_difficulty_model.dart';

part 'challenge_level_model.freezed.dart';
part 'challenge_level_model.g.dart';

@freezed
abstract class ChallengeLevelModel with _$ChallengeLevelModel {
  const factory ChallengeLevelModel({
    required int id,
    required String levelName,
    required QuestionDifficultyModel questions,
  }) = _ChallengeLevelModel;

  factory ChallengeLevelModel.fromJson(Map<String, dynamic> json) =>
      _$ChallengeLevelModelFromJson(json);
}
