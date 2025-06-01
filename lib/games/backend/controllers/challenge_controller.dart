import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/game_engine.dart';
import 'package:timetocode/games/backend/models/challenge_level_model.dart';
import 'package:timetocode/games/backend/models/challenge_model.dart';
import 'package:timetocode/games/backend/models/choices_model.dart';
import 'package:timetocode/games/backend/models/question_model.dart';
import 'package:timetocode/games/backend/providers/game_provider.dart';
import 'package:timetocode/games/backend/services/challenge_service.dart';
import 'package:timetocode/games/backend/providers/main_navigation_provider.dart';

class ChallengeState {
  final ChallengeModel challenge;

  final ChallengeLevelModel? currentLevel;
  final String? currentDifficulty;
  final QuestionModel? currentQuestion;

  final int? correctAnswer;
  final int? wrongAnswer;

  ChallengeState({
    required this.challenge,
    this.currentLevel,
    this.currentDifficulty,
    this.currentQuestion,
    this.correctAnswer,
    this.wrongAnswer,
  });

  static const _sentinel = Object();

  ChallengeState copyWith({
    Object? challenge = _sentinel,
    Object? currentLevel = _sentinel,
    Object? currentDifficulty = _sentinel,
    Object? currentQuestion = _sentinel,
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
      currentQuestion:
          currentQuestion == _sentinel
              ? this.currentQuestion
              : currentQuestion as QuestionModel?,
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
  late final GameEngine game;
  @override
  Future<ChallengeState> build() async {
    game = ref.read(gameEngineProvider);
    final challenge = await _challengeService.loadChallenges(
      'assets/stories/challenge.json',
    );
    return ChallengeState(challenge: challenge);
  }

  Future<void> startChallenge(int index) async {
    state = const AsyncValue.loading();
    final challenge = state.value!.challenge;
    final currentLevel = challenge.levels[index];
    final currentQuestion = currentLevel.questions.mudah.first;
    state = AsyncValue.data(
      state.value!.copyWith(
        currentLevel: currentLevel,
        currentDifficulty: "mudah",
        currentQuestion: currentQuestion,
        correctAnswer: 0,
        wrongAnswer: 0,
      ),
    );
    game.overlays.remove('GameUI');
    game.overlays.add('Challenge');
  }

  Future<void> checkAnswer(ChoicesModel selected) async {
    final difficulty = selected.nextType;
    final currentState = state.value!;

    if (difficulty == null) {
      if (selected.isCorrect == true) {
        state = AsyncValue.data(
          state.value!.copyWith(
            correctAnswer: (currentState.correctAnswer ?? 0) + 1,
          ),
        );
      } else {
        state = AsyncValue.data(
          state.value!.copyWith(
            wrongAnswer: (currentState.wrongAnswer ?? 0) + 1,
          ),
        );
      }
      game.overlays.remove('Challenge');
      game.overlays.add('ChallengeEnd');
    } else {
      if (difficulty == 'sedang') {
        if (selected.isCorrect == true) {
          state = AsyncValue.data(
            state.value!.copyWith(
              correctAnswer: (currentState.correctAnswer ?? 0) + 1,
              currentDifficulty: difficulty,
              currentQuestion:
                  currentState.currentLevel!.questions.sedang.first,
            ),
          );
        } else {
          state = AsyncValue.data(
            state.value!.copyWith(
              wrongAnswer: (currentState.wrongAnswer ?? 0) + 1,
              currentDifficulty: difficulty,
              currentQuestion:
                  currentState.currentLevel!.questions.sedang.first,
            ),
          );
        }
      } else {
        if (selected.isCorrect == true) {
          state = AsyncValue.data(
            state.value!.copyWith(
              correctAnswer: (currentState.correctAnswer ?? 0) + 1,
              currentDifficulty: difficulty,
              currentQuestion: currentState.currentLevel!.questions.sulit.first,
            ),
          );
        } else {
          state = AsyncValue.data(
            state.value!.copyWith(
              wrongAnswer: (currentState.wrongAnswer ?? 0) + 1,
              currentDifficulty: difficulty,
              currentQuestion: currentState.currentLevel!.questions.sulit.first,
            ),
          );
        }
      }
    }
  }

  void endChallenge() {
    ref.read(mainTabIndexProvider.notifier).state = 1;
    game.overlays.remove('ChallengeEnd');
    game.overlays.add('GameUI');
    state = AsyncValue.data(
      state.value!.copyWith(
        currentLevel: null,
        currentDifficulty: null,
        currentQuestion: null,
        correctAnswer: null,
        wrongAnswer: null,
      ),
    );
  }

  void resetChallenge() {
    final challenge = state.value!.currentLevel;
    final currentQuestion = challenge!.questions.mudah.first;
    state = AsyncValue.data(
      state.value!.copyWith(
        currentDifficulty: "mudah",
        currentQuestion: currentQuestion,
        correctAnswer: 0,
        wrongAnswer: 0,
      ),
    );
  }
}
