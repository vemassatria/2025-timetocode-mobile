import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/data/services/music_service.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/features/1_story_mode/data/states/story_state.dart';
import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/data/controllers/dnd_gameplay_controller.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_progress_controller.dart';
import 'package:timetocode/features/1_story_mode/engine/core/game_engine.dart';
import 'package:timetocode/features/0_core/models/choices_model.dart';
import 'package:timetocode/app/config/routes/app_route.dart';
import '../models/story_model.dart';
import '../models/dialog_model.dart';

final storyControllerProvider =
    NotifierProvider.autoDispose<StoryController, StoryState>(
      StoryController.new,
    );

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

    return const StoryState(isLoading: true);
  }

  void initLevel(StoryModel level) async {
    _keepAliveLink ??= ref.keepAlive();

    await Future.wait([
      ref.read(musicServiceProvider.notifier).playLevelMusic(level.level),
      game.preloadCharacters(level.character1Images + level.character2Images),
      game.preloadIlustrations(level.ilustrations),
      game.setBackground(level.background),
    ]);
    state = StoryState(activeLevel: level, isLoading: false);
    navigateMode(level.typeStart, level.start);
  }

  void navigateMode(String? modeType, String? modeId) {
    if (state.activeMode == 'dialog' || state.activeMode == 'preDialog') {
      ref.read(soundEffectServiceProvider.notifier).pauseTyping();
    }

    if (modeType == 'preDialog') {
      showPreDialog(modeId!);
    } else if (modeType == 'dialog') {
      if (game.characters != null) game.showCharactersOverlay();
      showDialog(modeId!);
    } else if (modeType == 'soal') {
      showQuestion(modeId!);
    } else if (modeType == 'dragAndDrop') {
      state = state.copyWith(
        activeMode: null,
        currentDialog: null,
        preDialog: null,
        currentQuestion: null,
        indexDialog: null,
      );
      ref.read(dndControllerProvider.notifier).initializeDragAndDrop(modeId!);
      ref.read(routerProvider).push('/pembelajaran/dnd');
    } else {
      showEndGame();
    }
  }

  void showPreDialog(String id) {
    state = state.activeMode != 'preDialog'
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
    final currentConversation = dialog.dialogs[0];

    final firstIdx = currentConversation.characterIndex;
    final firstReact = currentConversation.reactionIndex;

    final c1Reaction = firstIdx == 1 ? firstReact : 0;
    final c2Reaction = firstIdx == 2 ? firstReact : 0;

    final ilustrationIndex = currentConversation.ilustrationIndex;

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
    final length = dialog.dialogs.length;

    if (nextIdx < length) {
      final currentConversation = dialog.dialogs[nextIdx];
      final charIdx = currentConversation.characterIndex;
      final charReact = currentConversation.reactionIndex;
      final ilustrationIndex = currentConversation.ilustrationIndex;

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
            } else if (choice.nextType == 'dragAndDrop') {
              ref.read(soundEffectServiceProvider.notifier).pauseTyping();
              game.hideCharacters();
              game.hideIlustration();
              ref
                  .read(dndControllerProvider.notifier)
                  .initializeDragAndDrop(choice.next);
              ref.read(routerProvider).push('/pembelajaran/dnd');
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
          showQuestion(dialog.next!);
          return true;
        } else if (dialog.nextType == 'dialog') {
          dialog = dialogs.firstWhere((d) => d.id == dialog!.next);
        } else if (dialog.nextType == 'dragAndDrop') {
          ref.read(soundEffectServiceProvider.notifier).pauseTyping();
          game.hideCharacters();
          game.hideIlustration();
          ref
              .read(dndControllerProvider.notifier)
              .initializeDragAndDrop(dialog.next!);
          ref.read(routerProvider).push('/pembelajaran/dnd');
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
  }

  Future<void> _saveProgress() async {
    final completedLevel = ref.read(storyProgressProvider);
    final currentLevel = state.activeLevel!;
    if (currentLevel.level > completedLevel) {
      await ref
          .read(storyProgressProvider.notifier)
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
    ref.read(routerProvider).go('/pembelajaran');
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
