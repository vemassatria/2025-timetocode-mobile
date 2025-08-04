import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/controllers/drag_and_drop/dnd_state.dart';
import 'package:timetocode/games/backend/models/challenge/challenge_level_model.dart';
import 'package:timetocode/games/backend/models/choices_model.dart';
import 'package:timetocode/games/backend/models/question_model.dart';
import 'package:timetocode/games/backend/providers/challenge/daftar_challenge_provider.dart';
import 'package:timetocode/routes/app_route.dart';

class ChallengeState {
  final ChallengeLevelModel? currentLevel;
  final String? currentDifficulty;
  final QuestionModel? currentQuestion;

  final int? correctAnswer;
  final int? wrongAnswer;

  ChallengeState({
    this.currentLevel,
    this.currentDifficulty,
    this.currentQuestion,
    this.correctAnswer,
    this.wrongAnswer,
  });

  static const _sentinel = Object();

  ChallengeState copyWith({
    Object? currentLevel = _sentinel,
    Object? currentDifficulty = _sentinel,
    Object? currentQuestion = _sentinel,
    Object? correctAnswer = _sentinel,
    Object? wrongAnswer = _sentinel,
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
    );
  }
}

class ChallengeController extends AutoDisposeNotifier<ChallengeState> {
  KeepAliveLink? _keepAliveLink;

  @override
  ChallengeState build() {
    return ChallengeState();
  }

  void initializeChallenge(ChallengeLevelModel challenge) {
    _keepAliveLink ??= ref.keepAlive();

    final currentQuestion = challenge.questions.mudah.first;
    state = ChallengeState(
      currentLevel: challenge,
      currentDifficulty: "mudah",
      currentQuestion: currentQuestion,
      correctAnswer: 0,
      wrongAnswer: 0,
    );
  }

  Future<void> checkAnswer(ChoicesModel selected) async {
    final nextType = selected.nextType;

    if (nextType == "drag_and_drop") {
      ref
          .read(dndControllerProvider.notifier)
          .initializeDragAndDrop(selected.next!, "challenge");
      ref.read(routerProvider).push('/dnd');
      return;
    }

    final difficulty = selected.nextDifficulty;

    if (difficulty == null) {
      if (selected.isCorrect == true) {
        correctAnswer();
      } else {
        wrongAnswer();
      }
      endgameChallenge();
    } else {
      if (selected.isCorrect == true) {
        correctAnswer();
      } else {
        wrongAnswer();
      }
      nextQuestion(difficulty);
    }
  }

  void nextQuestion(String currentDifficulty) {
    late final currentQuestion;
    switch (currentDifficulty) {
      case 'mudah':
        currentQuestion = state.currentLevel!.questions.mudah.first;
        break;
      case 'sedang':
        currentQuestion = state.currentLevel!.questions.sedang.first;
        break;
      case 'susah':
        currentQuestion = state.currentLevel!.questions.sulit.first;
        break;
    }
    state = state.copyWith(
      currentDifficulty: currentDifficulty,
      currentQuestion: currentQuestion as QuestionModel?,
    );
  }

  void restartChallenge() {
    initializeChallenge(state.currentLevel!);
  }

  void exitChallenge() {
    _releaseKeepAlive();
    ref.read(routerProvider).go('/tantangan');
  }

  void correctAnswer() {
    state = state.copyWith(correctAnswer: (state.correctAnswer ?? 0) + 1);
  }

  void wrongAnswer() {
    state = state.copyWith(wrongAnswer: (state.wrongAnswer ?? 0) + 1);
  }

  void endgameChallenge() {
    ref.read(routerProvider).go('/tantangan/endgame');
    ref
        .read(completedChallengeProvider.notifier)
        .setCompletedChallenge(state.currentLevel!.id, state.correctAnswer!);
    _releaseKeepAlive();
  }

  void _releaseKeepAlive() {
    _keepAliveLink!.close();
    _keepAliveLink = null;
  }
}

final challengeControllerProvider =
    NotifierProvider.autoDispose<ChallengeController, ChallengeState>(
      ChallengeController.new,
    );
