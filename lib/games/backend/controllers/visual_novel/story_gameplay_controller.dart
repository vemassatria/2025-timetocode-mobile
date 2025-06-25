import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/game_engine.dart';
import 'package:timetocode/games/backend/models/choices_model.dart';
import 'package:timetocode/games/backend/providers/current_level_provider.dart';
import 'package:timetocode/games/backend/providers/game_provider.dart';
import 'package:timetocode/games/backend/providers/visual_novel/daftar_level_provider.dart';
import 'package:timetocode/games/backend/providers/music_service_provider.dart';
import 'package:timetocode/games/backend/providers/visual_novel/story_level_provider.dart';
import 'package:timetocode/games/backend/services/visual_novel/predialog_service.dart';
import '../../services/visual_novel/dialog_service.dart';
import '../../services/question_service.dart';
import '../../models/visual_novel/level_model.dart';
import '../../models/visual_novel/predialog_model.dart';
import '../../models/visual_novel/dialog_model.dart';
import '../../models/question_model.dart';

class StoryState {
  final LevelModel? activeLevel;
  final PreDialogModel? preDialog;
  final DialogModel? currentDialog;
  final QuestionModel? currentQuestion;
  int? indexDialog;
  int? correctAnswer;
  int? wrongAnswer;
  bool? falsePrevious;
  String? activeMode;

  StoryState({
    this.activeLevel,
    this.preDialog,
    this.currentDialog,
    this.currentQuestion,
    this.indexDialog,
    this.correctAnswer,
    this.wrongAnswer,
    this.falsePrevious,
    this.activeMode,
  });

  static const _sentinel = Object();

  StoryState copyWith({
    Object? activeLevel = _sentinel,
    Object? preDialog = _sentinel,
    Object? currentDialog = _sentinel,
    Object? currentQuestion = _sentinel,
    Object? indexDialog = _sentinel,
    Object? correctAnswer = _sentinel,
    Object? wrongAnswer = _sentinel,
    Object? falsePrevious = _sentinel,
    Object? activeMode = _sentinel,
  }) {
    return StoryState(
      activeLevel:
          activeLevel == _sentinel
              ? this.activeLevel
              : activeLevel as LevelModel?,
      preDialog:
          preDialog == _sentinel
              ? this.preDialog
              : preDialog as PreDialogModel?,
      currentDialog:
          currentDialog == _sentinel
              ? this.currentDialog
              : currentDialog as DialogModel?,
      currentQuestion:
          currentQuestion == _sentinel
              ? this.currentQuestion
              : currentQuestion as QuestionModel?,
      indexDialog:
          indexDialog == _sentinel ? this.indexDialog : indexDialog as int?,
      correctAnswer:
          correctAnswer == _sentinel
              ? this.correctAnswer
              : correctAnswer as int?,
      wrongAnswer:
          wrongAnswer == _sentinel ? this.wrongAnswer : wrongAnswer as int?,
      falsePrevious:
          falsePrevious == _sentinel
              ? this.falsePrevious
              : falsePrevious as bool?,
      activeMode:
          activeMode == _sentinel ? this.activeMode : activeMode as String?,
    );
  }
}

class StoryController extends AutoDisposeAsyncNotifier<StoryState> {
  final DialogService _dialogService = DialogService();
  final QuestionService _questionService = QuestionService();
  final PredialogService _predialogService = PredialogService();
  late final GameEngine game;

  @override
  FutureOr<StoryState> build() async {
    game = ref.watch(gameEngineProvider);
    final levels = ref.read(storyLevelProvider).value;
    final level = levels![ref.read(currentLevelIndexProvider)!];

    await Future.wait([
      ref.read(musicServiceProvider.notifier).playLevelMusic(level.level),
      game.preloadCharacters(level.character1Images + level.character2Images),
      game.preloadIlustrations(level.ilustrations),
      game.setBackground(level.background),
    ]);

    if (level.typeStart == 'preDialog') {
      final preDialog = _predialogService.getPredialogById(level, level.start);
      return StoryState(
        activeLevel: level,
        preDialog: preDialog,
        activeMode: 'preDialog',
      );
    } else {
      final dialog = _dialogService.getDialogById(level, level.start);

      final firstIdx = dialog.getCharacterIndex(0);
      final firstReact = dialog.getReactionIndex(0);

      final c1Reaction = firstIdx == 1 ? firstReact : 0;
      final c2Reaction = firstIdx == 2 ? firstReact : 0;

      final ilustrationIndex = dialog.getIlustrationIndex(0);

      await game.showCharacters(
        char1Img: level.character1Images[c1Reaction],
        char2Img: level.character2Images[c2Reaction],
        c1Reaction: c1Reaction,
        c2Reaction: c2Reaction,
        speaker: firstIdx == 1 ? 1 : 2,
        isIllustration: ilustrationIndex != null,
      );

      if (ilustrationIndex != null) {
        await game.showIlustration(
          ilustrationPath: level.ilustrations[ilustrationIndex],
          ilustrationIndex: ilustrationIndex,
        );
      } else {
        if (game.ilustration != null) {
          game.hideIlustration();
        }
      }

      return StoryState(
        activeLevel: level,
        currentDialog: dialog,
        indexDialog: 0,
        activeMode: 'dialog',
      );
    }
  }

  void showPreDialog(String preDialogId) {
    final level = state.value!.activeLevel!;
    final preDialog = _predialogService.getPredialogById(level, preDialogId);
    state = AsyncValue.data(
      state.value!.copyWith(preDialog: preDialog, activeMode: 'preDialog'),
    );
  }

  void nextPreDialog() {
    final s = state.value!;
    final preDialog = s.preDialog!;
    final nextType = preDialog.nextType;
    final next = preDialog.next;

    if (nextType == 'dialog') {
      if (game.characters != null) {
        game.showCharactersOverlay();
      }
      showDialog(next);
    } else if (nextType == 'soal') {
      showQuestion(next);
    } else {
      state = AsyncValue.data(
        state.value!.copyWith(
          preDialog: _predialogService.getPredialogById(s.activeLevel!, next),
        ),
      );
    }
  }

  Future<void> showDialog(String dialogId) async {
    final level = state.value!.activeLevel!;
    final dialog = _dialogService.getDialogById(level, dialogId);

    final firstIdx = dialog.getCharacterIndex(0);
    final firstReact = dialog.getReactionIndex(0);

    final c1Reaction = firstIdx == 1 ? firstReact : 0;
    final c2Reaction = firstIdx == 2 ? firstReact : 0;

    final ilustrationIndex = dialog.getIlustrationIndex(0);

    await game.showCharacters(
      char1Img: level.character1Images[c1Reaction],
      char2Img: level.character2Images[c2Reaction],
      c1Reaction: c1Reaction,
      c2Reaction: c2Reaction,
      speaker: firstIdx == 1 ? 1 : 2,
      isIllustration: ilustrationIndex != null,
    );
    state = AsyncValue.data(
      state.value!.copyWith(
        preDialog: null,
        currentQuestion: null,
        currentDialog: dialog,
        indexDialog: 0,
        activeMode: "dialog",
      ),
    );

    if (ilustrationIndex != null) {
      await game.showIlustration(
        ilustrationPath: level.ilustrations[ilustrationIndex],
        ilustrationIndex: ilustrationIndex,
      );
    } else {
      if (game.ilustration != null) {
        game.hideIlustration();
      }
    }
  }

  void nextDialog() {
    final s = state.value!;
    final dialog = s.currentDialog!;
    final nextIdx = s.indexDialog! + 1;
    final length = dialog.getDialogLength();

    if (nextIdx < length) {
      final charIdx = dialog.getCharacterIndex(nextIdx);
      final charReact = dialog.getReactionIndex(nextIdx);
      final ilustrationIndex = dialog.getIlustrationIndex(nextIdx);

      state = AsyncValue.data(s.copyWith(indexDialog: nextIdx));
      if (charIdx == 1) {
        game.showCharacters(
          char1Img: s.activeLevel!.character1Images[charReact],
          c1Reaction: charReact,
          speaker: 1,
          isIllustration: ilustrationIndex != null,
        );
      } else {
        game.showCharacters(
          char2Img: s.activeLevel!.character2Images[charReact],
          c2Reaction: charReact,
          speaker: 2,
          isIllustration: ilustrationIndex != null,
        );
      }

      if (ilustrationIndex != null) {
        game.showIlustration(
          ilustrationPath: s.activeLevel!.ilustrations[ilustrationIndex],
          ilustrationIndex: ilustrationIndex,
        );
      } else {
        if (game.ilustration != null) {
          game.hideIlustration();
        }
      }
    } else {
      if (dialog.nextType == 'soal') {
        game.hideCharacters();
        showQuestion(dialog.next);
      } else if (dialog.nextType == 'dialog') {
        showDialog(dialog.next);
      } else {
        showEndGame();
      }
    }
  }

  void showQuestion(String questionId) {
    final level = state.value!.activeLevel!;
    final question = _questionService.getQuestionById(level, questionId);
    state = AsyncValue.data(
      state.value!.copyWith(
        currentQuestion: question,
        activeMode: 'question',
        preDialog: null,
        currentDialog: null,
        indexDialog: null,
      ),
    );
  }

  void checkAnswer(ChoicesModel selected) {
    final s = state.value!;

    bool? newFalsePrevious = s.falsePrevious;
    int? newCorrect = s.correctAnswer;
    int? newWrong = s.wrongAnswer;

    if (selected.isCorrect == true) {
      if (s.falsePrevious != true) {
        newCorrect = (s.correctAnswer ?? 0) + 1;
      } else {
        newFalsePrevious = false;
      }
    } else {
      if (s.falsePrevious != true) {
        newWrong = (s.wrongAnswer ?? 0) + 1;
        newFalsePrevious = true;
      }
    }

    state = AsyncValue.data(
      s.copyWith(
        correctAnswer: newCorrect,
        wrongAnswer: newWrong,
        falsePrevious: newFalsePrevious,
      ),
    );

    if (selected.nextType == 'dialog') {
      game.showCharactersOverlay();
      showDialog(selected.next!);
    } else if (selected.nextType == 'soal') {
      showQuestion(selected.next!);
    } else {
      showEndGame();
    }
  }

  void skipToNextSoal() {
    final s = state.value!;
    final level = s.activeLevel;
    if (level == null) return;

    DialogModel? dialog = s.currentDialog;
    // If currentDialog is null, start from the beginning
    if (dialog == null && level.dialogs.isNotEmpty) {
      dialog = _dialogService.getDialogById(level, level.start);
    }

    final visited = <String>{};

    // Helper function to recursively find the next soal
    bool findAndShowSoal(DialogModel? dialog) {
      while (dialog != null && !visited.contains(dialog.id)) {
        visited.add(dialog.id);

        // If this dialog has choices, check all branches
        if (dialog.choices != null && dialog.choices!.isNotEmpty) {
          for (final choice in dialog.choices!) {
            if (choice.nextType == 'soal') {
              game.hideCharacters();
              showQuestion(choice.next);
              return true;
            } else if (choice.nextType == 'dialog') {
              final nextDialog = _dialogService.getDialogById(
                level,
                choice.next,
              );
              if (findAndShowSoal(nextDialog)) return true;
            }
          }
          // If none of the choices lead to a soal, return false
          return false;
        }

        // No choices, follow linear next/nextType
        if (dialog.nextType == 'soal') {
          game.hideCharacters();
          showQuestion(dialog.next);
          return true;
        } else if (dialog.nextType == 'dialog') {
          dialog = _dialogService.getDialogById(level, dialog.next);
        } else {
          // No more soal found, end the game
          return false;
        }
      }
      return false;
    }

    if (!findAndShowSoal(dialog)) {
      showEndGame();
    }
  }

  void showEndGame() {
    state = AsyncValue.data(
      state.value!.copyWith(
        activeMode: 'end',
        preDialog: null,
        currentDialog: null,
        currentQuestion: null,
        indexDialog: null,
        falsePrevious: null,
      ),
    );
    game.deleteAll();
  }

  Future<void> endStory() async {
    final completedLevel = ref.read(completedLevelProvider);
    final currentLevel = state.value!.activeLevel;
    if (currentLevel == null) return;

    if (currentLevel.level > completedLevel) {
      await ref
          .read(completedLevelProvider.notifier)
          .setCompletedLevel(currentLevel.level);
    }
  }

  void restartLevel() {
    if (state.value!.activeMode == 'dialog') {
      game.hideCharacters();
      game.hideIlustration();
    }
    state = AsyncValue.data(
      state.value!.copyWith(
        preDialog: null,
        currentDialog: null,
        currentQuestion: null,
        indexDialog: null,
        correctAnswer: null,
        wrongAnswer: null,
        falsePrevious: null,
        activeMode: null,
      ),
    );
    final level = state.value!.activeLevel!;
    if (level.typeStart == 'preDialog') {
      showPreDialog(level.start);
    } else {
      showDialog(level.start);
    }
  }

  void exitLevel() {
    game.deleteAll();
    state = AsyncValue.data(
      state.value!.copyWith(
        preDialog: null,
        currentDialog: null,
        currentQuestion: null,
        indexDialog: null,
        correctAnswer: null,
        wrongAnswer: null,
        falsePrevious: null,
        activeMode: 'exit',
        activeLevel: null,
      ),
    );
  }

  void resetActiveMode() {
    if (state.hasValue) {
      state = AsyncValue.data(state.value!.copyWith(activeMode: null));
    }
  }
}
