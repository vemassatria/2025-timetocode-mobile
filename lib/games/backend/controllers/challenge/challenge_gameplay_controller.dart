import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/models/challenge/challenge_level_model.dart';
import 'package:timetocode/games/backend/models/choices_model.dart';
import 'package:timetocode/games/backend/models/question_model.dart';
import 'package:timetocode/games/backend/providers/challenge/challenge_level_provider.dart';
import 'package:timetocode/games/backend/providers/challenge/daftar_challenge_provider.dart';
import 'package:timetocode/games/backend/providers/current_level_provider.dart';

class ChallengeState {
  final ChallengeLevelModel? currentLevel;
  final String? currentDifficulty;
  final QuestionModel? currentQuestion;

  final int? correctAnswer;
  final int? wrongAnswer;

  final String? activeMode;

  ChallengeState({
    this.currentLevel,
    this.currentDifficulty,
    this.currentQuestion,
    this.correctAnswer,
    this.wrongAnswer,
    this.activeMode,
  });

  static const _sentinel = Object();

  ChallengeState copyWith({
    Object? challenge = _sentinel,
    Object? currentLevel = _sentinel,
    Object? currentDifficulty = _sentinel,
    Object? currentQuestion = _sentinel,
    Object? correctAnswer = _sentinel,
    Object? wrongAnswer = _sentinel,
    Object? activeMode = _sentinel,
  }) {
    return ChallengeState(
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
      activeMode:
          activeMode == _sentinel ? this.activeMode : activeMode as String?,
    );
  }
}

class ChallengeController extends AutoDisposeAsyncNotifier<ChallengeState> {
  @override
  Future<ChallengeState> build() async {
    final challenges = ref.read(challengeLevelProvider).value;

    final currentLevel =
        challenges!.levels[ref.read(currentLevelIndexProvider)!];
    final currentQuestion = currentLevel.questions.mudah.first;
    return ChallengeState(
      currentLevel: currentLevel,
      currentDifficulty: "mudah",
      currentQuestion: currentQuestion,
      correctAnswer: 0,
      wrongAnswer: 0,
      activeMode: 'playing',
    );
  }

  Future<void> checkAnswer(ChoicesModel selected) async {
    final difficulty = selected.nextType;
    final currentState = state.value!;

    if (difficulty == null) {
      if (selected.isCorrect == true) {
        state = AsyncValue.data(
          state.value!.copyWith(
            correctAnswer: (currentState.correctAnswer ?? 0) + 1,
            activeMode: 'end',
          ),
        );
      } else {
        state = AsyncValue.data(
          state.value!.copyWith(
            wrongAnswer: (currentState.wrongAnswer ?? 0) + 1,
            activeMode: 'end',
          ),
        );
      }
      final levelChallengeNotifier = ref.read(
        completedChallengeProvider.notifier,
      );
      levelChallengeNotifier.setCompletedChallenge(
        state.value!.currentLevel!.id,
        state.value!.correctAnswer!,
      );
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

  void endChallengePopup() {
    state = AsyncValue.data(state.value!.copyWith(activeMode: 'exit'));
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
