import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/controllers/drag_and_drop/dnd_state.dart';
import 'package:timetocode/games/backend/game_engine.dart';
import 'package:timetocode/games/backend/models/choices_model.dart';
import 'package:timetocode/games/backend/providers/visual_novel/daftar_level_provider.dart';
import 'package:timetocode/games/backend/providers/music_service_provider.dart';
import 'package:timetocode/routes/app_route.dart';
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

class StoryController extends AutoDisposeNotifier<StoryState> {
  KeepAliveLink? _keepAliveLink;
  late final GameEngine game;

  @override
  StoryState build() {
    game = GameEngine();

    ref.onDispose(() {
      ref.read(musicServiceProvider.notifier).playMainMenuMusic();
      game.deleteAll();
    });

    return StoryState();
  }

  void initLevel(LevelModel level) async {
    _keepAliveLink ??= ref.keepAlive();

    await Future.wait([
      ref.read(musicServiceProvider.notifier).playLevelMusic(level.level),
      game.preloadCharacters(level.character1Images + level.character2Images),
      game.preloadIlustrations(level.ilustrations),
      game.setBackground(level.background),
    ]);
    state = StoryState(activeLevel: level);
    navigateMode(level.typeStart, level.start);
  }

  void navigateMode(String? modeType, String? modeId) {
    if (modeType == 'preDialog') {
      showPreDialog(modeId!);
    } else if (modeType == 'dialog') {
      if (game.characters != null) game.showCharactersOverlay();
      showDialog(modeId!);
    } else if (modeType == 'soal') {
      showQuestion(modeId!);
    } else if (modeType == 'drag_and_drop') {
      ref
          .read(dndControllerProvider.notifier)
          .initializeDragAndDrop(modeId!, 'story');
      ref.read(routerProvider).push('/dnd');
    } else {
      showEndGame();
    }
  }

  void showPreDialog(String id) {
    state =
        state.activeMode != 'preDialog'
            ? state.copyWith(
              preDialog: state.activeLevel!.preDialog!.firstWhere(
                (preDialog) => preDialog.id == id,
              ),
              activeMode: 'preDialog',
            )
            : state.copyWith(
              preDialog: state.activeLevel!.preDialog!.firstWhere(
                (preDialog) => preDialog.id == id,
              ),
            );
  }

  void nextPreDialog() {
    final preDialog = state.preDialog!;
    final nextType = preDialog.nextType;
    final next = preDialog.next;

    navigateMode(nextType, next);
  }

  Future<void> showDialog(String dialogId) async {
    final level = state.activeLevel!;
    final dialog = level.dialogs.firstWhere((d) => d.id == dialogId);

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
    state = state.copyWith(
      preDialog: null,
      currentQuestion: null,
      currentDialog: dialog,
      indexDialog: 0,
      activeMode: "dialog",
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
    final dialog = state.currentDialog!;
    final nextIdx = state.indexDialog! + 1;
    final length = dialog.getDialogLength();

    if (nextIdx < length) {
      final charIdx = dialog.getCharacterIndex(nextIdx);
      final charReact = dialog.getReactionIndex(nextIdx);
      final ilustrationIndex = dialog.getIlustrationIndex(nextIdx);

      state = state.copyWith(indexDialog: nextIdx);
      if (charIdx == 1) {
        game.showCharacters(
          char1Img: state.activeLevel!.character1Images[charReact],
          c1Reaction: charReact,
          speaker: 1,
          isIllustration: ilustrationIndex != null,
        );
      } else {
        game.showCharacters(
          char2Img: state.activeLevel!.character2Images[charReact],
          c2Reaction: charReact,
          speaker: 2,
          isIllustration: ilustrationIndex != null,
        );
      }

      if (ilustrationIndex != null) {
        game.showIlustration(
          ilustrationPath: state.activeLevel!.ilustrations[ilustrationIndex],
          ilustrationIndex: ilustrationIndex,
        );
      } else {
        if (game.ilustration != null) {
          game.hideIlustration();
        }
      }
    } else {
      navigateMode(dialog.nextType, dialog.next);
    }
  }

  void showQuestion(String questionId) {
    final question = state.activeLevel!.questions.firstWhere(
      (q) => q.id == questionId,
    );
    state = state.copyWith(
      currentQuestion: question,
      activeMode: 'question',
      preDialog: null,
      currentDialog: null,
      indexDialog: null,
    );
  }

  void checkAnswer(ChoicesModel selected) {
    if (selected.isCorrect == true) {
      correctAnswer();
    } else {
      wrongAnswer();
    }

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
    final level = state.activeLevel;
    final dialogs = level!.dialogs;

    DialogModel? dialog = state.currentDialog;
    // If currentDialog is null, start from the beginning
    if (dialog == null && dialogs.isNotEmpty) {
      dialog = dialogs.firstWhere(
        (d) => d.id == level.start,
        orElse: () => level.dialogs.first,
      );
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
              game.hideIlustration();
              showQuestion(choice.next);
              return true;
            } else if (choice.nextType == 'dialog') {
              final nextDialog = dialogs.firstWhere((d) => d.id == choice.next);
              if (findAndShowSoal(nextDialog)) return true;
            } else if (choice.nextType == 'drag_and_drop') {
              game.hideCharacters();
              game.hideIlustration();
              ref
                  .read(dndControllerProvider.notifier)
                  .initializeDragAndDrop(choice.next, 'story');
              ref.read(routerProvider).push('/dnd');
              return true;
            }
          }
          // If none of the choices lead to a soal, return false
          return false;
        }

        // No choices, follow linear next/nextType
        if (dialog.nextType == 'soal') {
          game.hideCharacters();
          game.hideIlustration();
          showQuestion(dialog.next);
          return true;
        } else if (dialog.nextType == 'dialog') {
          dialog = dialogs.firstWhere((d) => d.id == dialog!.next);
        } else if (dialog.nextType == 'drag_and_drop') {
          game.hideCharacters();
          game.hideIlustration();
          ref
              .read(dndControllerProvider.notifier)
              .initializeDragAndDrop(dialog.next, 'story');
          ref.read(routerProvider).push('/dnd');
          return true;
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
    ref.read(routerProvider).go('/pembelajaran/endgame');
    _saveProgress();
    _releaseKeepAlive();
  }

  Future<void> _saveProgress() async {
    final completedLevel = ref.read(completedLevelProvider);
    final currentLevel = state.activeLevel!;
    if (currentLevel.level > completedLevel) {
      await ref
          .read(completedLevelProvider.notifier)
          .setCompletedLevel(currentLevel.level);
    }
  }

  void restartStory() {
    if (state.activeMode == 'dialog') {
      game.hideCharacters();
      game.hideIlustration();
    }
    initLevel(state.activeLevel!);
  }

  void exitStory() {
    _releaseKeepAlive();
    ref.read(routerProvider).pop();
  }

  void correctAnswer() {
    if (state.falsePrevious != true) {
      state = state.copyWith(correctAnswer: (state.correctAnswer ?? 0) + 1);
    } else {
      state = state.copyWith(falsePrevious: false);
    }
  }

  void wrongAnswer() {
    if (state.falsePrevious != true) {
      state = state.copyWith(
        wrongAnswer: (state.wrongAnswer ?? 0) + 1,
        falsePrevious: true,
      );
    }
  }

  void _releaseKeepAlive() {
    _keepAliveLink!.close();
    _keepAliveLink = null;
  }
}

final storyControllerProvider =
    NotifierProvider.autoDispose<StoryController, StoryState>(
      StoryController.new,
    );
