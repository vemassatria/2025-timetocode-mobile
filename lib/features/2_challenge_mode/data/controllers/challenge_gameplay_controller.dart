import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/2_challenge_mode/data/controllers/challenge_progress_controller.dart';
import 'package:timetocode/features/2_challenge_mode/data/states/challenge_state.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/controllers/dnd_gameplay_controller.dart';
import 'package:timetocode/features/2_challenge_mode/data/models/challenge_level_model.dart';
import 'package:timetocode/features/0_core/models/choices_model.dart';
import 'package:timetocode/features/0_core/models/question_model.dart';
import 'package:timetocode/app/config/routes/app_route.dart';

final challengeControllerProvider =
    NotifierProvider.autoDispose<ChallengeController, ChallengeState>(
      ChallengeController.new,
    );

class ChallengeController extends AutoDisposeNotifier<ChallengeState> {
  KeepAliveLink? _keepAliveLink;

  @override
  ChallengeState build() {
    return const ChallengeState(isLoading: true);
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
      isLoading: false,
    );
  }

  Future<void> checkAnswer(ChoicesModel selected) async {
    final nextType = selected.nextType;

    if (nextType == "dragAndDrop") {
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
    late final QuestionModel currentQuestion;
    switch (currentDifficulty) {
      case 'mudah':
        currentQuestion = state.currentLevel!.questions.mudah.first;
        break;
      case 'sedang':
        currentQuestion = state.currentLevel!.questions.sedang.first;
        break;
      case 'susah':
        currentQuestion = state.currentLevel!.questions.susah.first;
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
        .read(challengeProgressProvider.notifier)
        .setCompletedChallenge(state.currentLevel!.id, state.correctAnswer!);
  }

  void _releaseKeepAlive() {
    _keepAliveLink!.close();
    _keepAliveLink = null;
  }
}
