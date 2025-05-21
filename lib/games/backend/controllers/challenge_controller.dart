import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/models/challenge_level_model.dart';
import 'package:timetocode/games/backend/models/challenge_model.dart';
import 'package:timetocode/games/backend/models/choices_model.dart';
import 'package:timetocode/games/backend/services/challenge_service.dart';

class ChallengeState {
  final ChallengeModel challenge;

  final ChallengeLevelModel? currentLevel;
  final String? currentDifficulty;
  final int? correctAnswer;
  final int? wrongAnswer;

  ChallengeState({
    required this.challenge,
    this.currentLevel,
    this.currentDifficulty,
    this.correctAnswer,
    this.wrongAnswer,
  });

  static const _sentinel = Object();

  ChallengeState copyWith({
    Object? challenge = _sentinel,
    Object? currentLevel = _sentinel,
    Object? currentDifficulty = _sentinel,
    Object? correctAnswer = _sentinel,
    Object? wrongAnswer = _sentinel,
  }) {
    return ChallengeState(
      challenge:
          challenge == _sentinel ? this.challenge : challenge as ChallengeModel,
      currentLevel:
          currentLevel == _sentinel
              ? this.currentLevel
              : currentLevel as ChallengeLevelModel?,
      currentDifficulty:
          currentDifficulty == _sentinel
              ? this.currentDifficulty
              : currentDifficulty as String?,
      correctAnswer:
          correctAnswer == _sentinel
              ? this.correctAnswer
              : correctAnswer as int?,
      wrongAnswer:
          wrongAnswer == _sentinel ? this.wrongAnswer : wrongAnswer as int?,
    );
  }
}

class ChallengeController extends AutoDisposeAsyncNotifier<ChallengeState> {
  final ChallengeService _challengeService = ChallengeService();
  @override
  FutureOr<ChallengeState> build() async {
    final challenge = await _challengeService.loadChallenges(
      'assets/stories/challenge.json',
    );
    return ChallengeState(challenge: challenge);
  }

  Future<void> startChallenge(int index) async {
    state = const AsyncValue.loading();
    final challenge = state.value!.challenge;
    final currentLevel = challenge.levels[index];
    state = AsyncValue.data(
      state.value!.copyWith(
        currentLevel: currentLevel,
        currentDifficulty: "mudah",
        correctAnswer: 0,
        wrongAnswer: 0,
      ),
    );
  }

  Future<void> checkAnswer(ChoicesModel selected) async {
    final difficulty = selected.next;

    if (selected.next == null) {
      // TODO: tamnpilkan dialog akhir(endgame)
    } else {
      if (selected.isCorrect == true) {
        state = AsyncValue.data(
          state.value!.copyWith(
            correctAnswer: (state.value!.correctAnswer ?? 0) + 1,
            currentDifficulty: difficulty,
          ),
        );
      } else {
        state = AsyncValue.data(
          state.value!.copyWith(
            wrongAnswer: (state.value!.wrongAnswer ?? 0) + 1,
            currentDifficulty: difficulty,
          ),
        );
      }
    }
  }
}
