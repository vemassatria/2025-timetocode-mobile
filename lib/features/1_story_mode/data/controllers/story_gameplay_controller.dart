import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/data/services/hive_service.dart';
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

    final consequences = ref
        .read(hiveProvider)
        .storySnapShotGetConsequences(level.level - 1);

    state = StoryState(
      activeLevel: level,
      userConsequences: consequences,
      isLoading: false,
    );

    state = state.copyWith(activeMode: 'adaptiveText');
  }

  void navigateMode(String? modeType, String? modeId) {
    if (state.activeMode == 'dialog' || state.activeMode == 'preDialog') {
      ref.read(soundEffectServiceProvider.notifier).pauseTyping();

      if (state.activeMode == 'dialog') {
        game.hideCharacters();
        game.hideIlustration();
      }
    }

    if (modeType == 'preDialog') {
      showPreDialog(modeId!);
    } else if (modeType == 'dialog') {
      if (game.characters != null) game.showCharactersOverlay();
      showDialog(modeId!);
    } else if (modeType == 'soal') {
      showQuestion(modeId!);
    } else if (modeType == 'dragAndDrop') {
      showDragAndDrop(modeId!);
    } else {
      showEndGame();
    }
  }

  void showPreDialog(String id) {
    final preDialog = state.activeLevel!.preDialog!.firstWhere(
      (preDialog) =>
          preDialog.id == id && preDialog.conditions == null ||
          (preDialog.conditions != null &&
              storyCheckConditions(preDialog.conditions!)),
    );
    state = state.activeMode != 'preDialog'
        ? state.copyWith(preDialog: preDialog, activeMode: 'preDialog')
        : state.copyWith(preDialog: preDialog);
  }

  void nextPreDialog() {
    final preDialog = state.preDialog!;
    final nextType = preDialog.nextType;
    final next = preDialog.next;

    navigateMode(nextType, next);
  }

  Future<void> showDialog(String dialogId) async {
    final level = state.activeLevel!;
    final dialog = level.dialogs.firstWhere(
      (dialog) =>
          dialog.id == dialogId &&
          (dialog.conditions == null ||
              (dialog.conditions != null &&
                  storyCheckConditions(dialog.conditions!))),
    );
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
    final question = state.activeLevel!.minigame.questions!.firstWhere(
      (question) =>
          question.id == questionId &&
          (question.conditions == null ||
              (question.conditions != null &&
                  storyCheckConditions(question.conditions!))),
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
    bool isSuccess = selected.isCorrect;

    if (isSuccess) {
      correctAnswer(consequences: state.currentQuestion?.consequences);
    } else {
      wrongAnswer(consequences: state.currentQuestion?.consequences);
    }

    navigateMode(selected.nextType, selected.next);
  }

  void skipCurrentDialog() {
    DialogModel? dialog = state.currentDialog;
    final visited = <String>{};

    bool findAndShowSoal(DialogModel? dialog) {
      while (dialog != null && !visited.contains(dialog.id)) {
        visited.add(dialog.id);

        if (dialog.branch != null) {
          state = state.copyWith(indexDialog: dialog.dialogs.length - 1);
          return true;
        }

        if (dialog.nextType != null) {
          navigateMode(dialog.nextType, dialog.next);
          return true;
        } else {
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

  void showDragAndDrop(String modeId) {
    ref.read(dndControllerProvider.notifier).initializeDragAndDrop(modeId);
    state = state.copyWith(
      activeMode: 'dragAndDrop',
      currentDialog: null,
      preDialog: null,
      currentQuestion: null,
      indexDialog: null,
    );
  }

  Future<void> _saveProgress() async {
    final completedLevel = ref.read(storyProgressProvider);
    final currentLevel = state.activeLevel!;
    ref
        .read(hiveProvider)
        .storySnapShotSaveConsequences(
          currentLevel.level,
          state.userConsequences,
        );
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

    final consequences = ref
        .read(hiveProvider)
        .storySnapShotGetConsequences(state.activeLevel!.level - 1);

    state = state.copyWith(
      correctAnswer: 0,
      wrongAnswer: 0,
      userConsequences: consequences,
      falsePrevious: false,
      preDialog: null,
      currentDialog: null,
      indexDialog: null,
      currentQuestion: null,
    );
    navigateMode(state.activeLevel!.typeStart, state.activeLevel!.start);
  }

  void exitStory() {
    _releaseKeepAlive();
    ref.read(routerProvider).go('/pembelajaran');
  }

  bool storyCheckConditions(Map<String, String> conditions) {
    Map<String, int>? userConsequences = state.userConsequences;
    if (userConsequences == null) return true;

    for (var entry in conditions.entries) {
      String key = entry.key;
      String conditionValue = entry.value;

      String operator = '==';
      int requiredValue;

      if (conditionValue.startsWith('>=')) {
        operator = '>=';
        requiredValue = int.parse(conditionValue.substring(2));
      } else if (conditionValue.startsWith('<=')) {
        operator = '<=';
        requiredValue = int.parse(conditionValue.substring(2));
      } else if (conditionValue.startsWith('>')) {
        operator = '>';
        requiredValue = int.parse(conditionValue.substring(1));
      } else if (conditionValue.startsWith('<')) {
        operator = '<';
        requiredValue = int.parse(conditionValue.substring(1));
      } else if (conditionValue.startsWith('!=')) {
        operator = '!=';
        requiredValue = int.parse(conditionValue.substring(2));
      } else {
        requiredValue = int.parse(conditionValue);
      }

      int userValue = userConsequences[key] ?? 0;
      bool conditionMet = false;
      switch (operator) {
        case '>=':
          conditionMet = userValue >= requiredValue;
          break;
        case '<=':
          conditionMet = userValue <= requiredValue;
          break;
        case '>':
          conditionMet = userValue > requiredValue;
          break;
        case '<':
          conditionMet = userValue < requiredValue;
          break;
        case '==':
          conditionMet = userValue == requiredValue;
          break;
        case '!=':
          conditionMet = userValue != requiredValue;
      }
      if (!conditionMet) {
        return false;
      }
    }

    return true;
  }

  Future<void> storySaveConsequences({
    required Map<String, String> consequences,
    bool? isMinigameSuccess,
  }) async {
    Map<String, int> userConsequences = Map.from(state.userConsequences ?? {});
    if (isMinigameSuccess != null) {
      if (isMinigameSuccess) {
        consequences.forEach((key, value) {
          userConsequences[key] = (userConsequences.containsKey(key))
              ? (userConsequences[key]! + int.parse(value))
              : int.parse(value);
        });
      } else {
        consequences.forEach((key, value) {
          userConsequences[key] = (userConsequences.containsKey(key))
              ? (userConsequences[key]! - int.parse(value))
              : -int.parse(value);
        });
      }
    } else {
      consequences.forEach((key, value) {
        userConsequences[key] = (userConsequences.containsKey(key))
            ? (userConsequences[key]! + int.parse(value))
            : int.parse(value);
      });
    }

    state = state.copyWith(userConsequences: userConsequences);
  }

  void correctAnswer({Map<String, String>? consequences}) {
    if (state.falsePrevious != true) {
      if (consequences != null) {
        storySaveConsequences(
          consequences: consequences,
          isMinigameSuccess: true,
        );
      }
      state = state.copyWith(correctAnswer: (state.correctAnswer ?? 0) + 1);
    } else {
      state = state.copyWith(falsePrevious: false);
    }
  }

  void wrongAnswer({Map<String, String>? consequences}) {
    if (state.falsePrevious != true) {
      if (consequences != null) {
        storySaveConsequences(
          consequences: consequences,
          isMinigameSuccess: false,
        );
      }
      state = state.copyWith(
        wrongAnswer: (state.wrongAnswer ?? 0) + 1,
        falsePrevious: true,
      );
    }
  }

  void _releaseKeepAlive() {
    if (state.activeMode == 'dragAndDrop') {
      ref.read(dndControllerProvider.notifier).releaseKeepAlive();
    }
    _keepAliveLink!.close();
    _keepAliveLink = null;
  }
}
