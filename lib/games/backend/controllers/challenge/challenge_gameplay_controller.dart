import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/models/challenge/challenge_level_model.dart';
import 'package:timetocode/games/backend/models/choices_model.dart';
import 'package:timetocode/games/backend/models/drag%20_and_drop/drag_and_drop_question_model.dart';
import 'package:timetocode/games/backend/models/drag%20_and_drop/draggable_model.dart';
import 'package:timetocode/games/backend/models/drag%20_and_drop/drop_zone_model.dart';
import 'package:timetocode/games/backend/models/question_model.dart';
import 'package:timetocode/games/backend/providers/challenge/challenge_level_provider.dart';
import 'package:timetocode/games/backend/providers/challenge/daftar_challenge_provider.dart';
import 'package:timetocode/games/backend/providers/current_level_provider.dart';
import 'package:timetocode/routes/app_route.dart';

class ChallengeState {
  final ChallengeLevelModel? currentLevel;
  final String? currentDifficulty;
  final QuestionModel? currentQuestion;

  final int? correctAnswer;
  final int? wrongAnswer;

  final DragAndDropModel? currentDragAndDrop;
  final List<DraggableModel>? availableOptions;
  final List<DropZoneModel>? dropZones;

  ChallengeState({
    this.currentLevel,
    this.currentDifficulty,
    this.currentQuestion,
    this.correctAnswer,
    this.wrongAnswer,
    this.currentDragAndDrop,
    this.availableOptions,
    this.dropZones,
  });

  static const _sentinel = Object();

  ChallengeState copyWith({
    Object? challenge = _sentinel,
    Object? currentLevel = _sentinel,
    Object? currentDifficulty = _sentinel,
    Object? currentQuestion = _sentinel,
    Object? correctAnswer = _sentinel,
    Object? wrongAnswer = _sentinel,
    Object? currentDragAndDrop = _sentinel,
    Object? availableOptions = _sentinel,
    Object? dropZones = _sentinel,
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
      currentDragAndDrop:
          currentDragAndDrop == _sentinel
              ? this.currentDragAndDrop
              : currentDragAndDrop as DragAndDropModel?,
      availableOptions:
          availableOptions == _sentinel
              ? this.availableOptions
              : availableOptions as List<DraggableModel>?,
      dropZones:
          dropZones == _sentinel
              ? this.dropZones
              : dropZones as List<DropZoneModel>?,
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
    );
  }

  Future<void> checkAnswer(ChoicesModel selected) async {
    final difficulty = selected.nextType;
    final currentState = state.value!;

    if (difficulty == null) {
      if (selected.isCorrect == true) {
        state = AsyncValue.data(
          currentState.copyWith(
            correctAnswer: (currentState.correctAnswer ?? 0) + 1,
          ),
        );
        ref.read(routerProvider).go('/tantangan/endgame');
      } else {
        state = AsyncValue.data(
          currentState.copyWith(
            wrongAnswer: (currentState.wrongAnswer ?? 0) + 1,
          ),
        );
        ref
            .read(routerProvider)
            .go(
              '/tantangan/endgame',
              extra: state.value!.copyWith(
                wrongAnswer: (currentState.wrongAnswer ?? 0) + 1,
              ),
            );
      }
      ref
          .read(completedChallengeProvider.notifier)
          .setCompletedChallenge(
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
      } else if (difficulty == 'drag_and_drop') {
        startDragAndDrop(selected.next!);
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
    ref.read(routerProvider).pop();
    ref.invalidateSelf();
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

  /*

  PEMBUATAN DRAG AND DROP
  letsgooooooooooooooooooooooooooooo

  */

  void startDragAndDrop(String id) {
    final dragAndDrop = state.value!.currentLevel!.getDragAndDropById(id);
    state = AsyncValue.data(
      state.value!.copyWith(
        currentDragAndDrop: dragAndDrop,
        availableOptions: dragAndDrop!.draggableOptions,
        dropZones: dragAndDrop.dropZones,
      ),
    );
    ref.read(routerProvider).go('/tantangan/dod');
  }

  void dropItem(String targetZoneId, String droppedOptionId) {
    final currentState = state.value!;
    final zones = List<DropZoneModel>.from(currentState.dropZones!);
    final availableOptions = List<DraggableModel>.from(
      currentState.availableOptions!,
    );
    final allDraggableOptions =
        currentState.currentDragAndDrop!.draggableOptions;

    // Tentukan lokasi asal item yang di-drop
    DropZoneModel? sourceZone;
    final sourceZoneIndex = zones.indexWhere(
      (z) => z.contentId == droppedOptionId,
    );
    if (sourceZoneIndex != -1) {
      sourceZone = zones[sourceZoneIndex];
    }

    if (targetZoneId == 'options_area') {
      // === Mengembalikan item ke area pilihan ===
      if (sourceZone != null) {
        sourceZone.contentId = null;
      }
      if (!availableOptions.any((opt) => opt.id == droppedOptionId)) {
        final optionToAdd = allDraggableOptions.firstWhere(
          (opt) => opt.id == droppedOptionId,
        );
        availableOptions.add(optionToAdd);
      }
    } else {
      // === Menjatuhkan item ke drop zone ===
      final targetZone = zones.firstWhere((z) => z.id == targetZoneId);
      final displacedOptionId = targetZone.contentId;

      if (sourceZone != null) {
        // Kasus 1: Menukar item antar drop zone
        sourceZone.contentId =
            displacedOptionId; // Item yang tergusur pindah ke source
        targetZone.contentId =
            droppedOptionId; // Item yang di-drop pindah ke target
      } else {
        // Kasus 2: Memindahkan item dari area pilihan ke drop zone
        targetZone.contentId = droppedOptionId;
        availableOptions.removeWhere((opt) => opt.id == droppedOptionId);

        if (displacedOptionId != null) {
          // Kembalikan item yang tergusur ke area pilihan
          final optionToReturn = allDraggableOptions.firstWhere(
            (opt) => opt.id == displacedOptionId,
          );
          if (!availableOptions.any((opt) => opt.id == displacedOptionId)) {
            availableOptions.add(optionToReturn);
          }
        }
      }
    }

    // Perbarui state
    state = AsyncValue.data(
      currentState.copyWith(
        dropZones: zones,
        availableOptions: availableOptions,
      ),
    );
  }

  bool validateAnswer() {
    final userSequence = state.value!.dropZones!;
    final correctSequence = state.value!.currentDragAndDrop!.correctSequence;

    // if (userSequence.length != correctSequence.length) return false;

    for (int i = 0; i < userSequence.length; i++) {
      if (userSequence[i] != correctSequence[i]) {
        return false;
      }
    }
    return true;
  }

  void finalizeDragAndDrop(bool isCorrect) {
    final currentState = state.value!;
    if (isCorrect) {
      state = AsyncValue.data(
        currentState.copyWith(
          correctAnswer: (currentState.correctAnswer ?? 0) + 1,
        ),
      );
      ref
          .read(completedChallengeProvider.notifier)
          .setCompletedChallenge(
            state.value!.currentLevel!.id,
            state.value!.correctAnswer!,
          );
      ref.read(routerProvider).go('/tantangan/endgame');
    } else {
      state = AsyncValue.data(
        currentState.copyWith(wrongAnswer: (currentState.wrongAnswer ?? 0) + 1),
      );
      // Popup ditutup oleh UI, pengguna bisa mencoba lagi.
    }
  }

  DraggableModel getOptionById(String id) {
    return state.value!.currentDragAndDrop!.draggableOptions.firstWhere(
      (opt) => opt.id == id,
    );
  }
}
