import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/models/challenge_level_model.dart';
import 'package:timetocode/games/backend/models/challenge_model.dart';
import 'package:timetocode/games/backend/services/challenge_service.dart';

class ChallengeState {
  final ChallengeModel challenge;

  final ChallengeLevelModel? currentLevel;
  final int? correctAnswer;
  final int? wrongAnswer;

  ChallengeState({
    required this.challenge,
    this.currentLevel,
    this.correctAnswer,
    this.wrongAnswer,
  });

  static const _sentinel = Object();

  ChallengeState copyWith({
    Object? challenge = _sentinel,
    Object? currentLevel = _sentinel,
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
      correctAnswer:
          correctAnswer == _sentinel
              ? this.correctAnswer
              : correctAnswer as int?,
      wrongAnswer:
          wrongAnswer == _sentinel ? this.wrongAnswer : wrongAnswer as int?,
    );
  }
}

class ChallengeController extends AsyncNotifier<ChallengeState> {
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
        correctAnswer: 0,
        wrongAnswer: 0,
      ),
    );
  }
}
