import 'package:timetocode/features/0_core/models/question_model.dart';
import 'package:timetocode/features/2_challenge_mode/data/models/challenge_level_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_state.freezed.dart';

@freezed
abstract class ChallengeState with _$ChallengeState {
  const factory ChallengeState({
    ChallengeLevelModel? currentLevel,
    String? currentDifficulty,
    QuestionModel? currentQuestion,
    int? correctAnswer,
    int? wrongAnswer,

    bool? isLoading,
  }) = _ChallengeState;
}
