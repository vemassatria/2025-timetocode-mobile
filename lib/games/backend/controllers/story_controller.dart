import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/game_engine.dart';
import 'package:timetocode/games/backend/models/choices_model.dart';
import 'package:timetocode/games/backend/providers/game_provider.dart';
import 'package:timetocode/games/backend/providers/daftar_level_provider.dart';
import 'package:timetocode/games/backend/providers/resource_provider.dart';
import 'package:timetocode/games/backend/services/predialog_service.dart';
import 'package:timetocode/games/backend/services/resource_service.dart';
import '../services/level_service.dart';
import '../services/dialog_service.dart';
import '../services/question_service.dart';
import '../services/music_service.dart';
import '../models/level_model.dart';
import '../models/predialog_model.dart';
import '../models/dialog_model.dart';
import '../models/question_model.dart';

class StoryState {
  final List<LevelModel> levels;

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
    required this.levels,
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
    Object? levels = _sentinel,
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
      levels:
          levels == _sentinel
              ? this.levels
              : levels as List<LevelModel>? ?? this.levels,
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
  final LevelService _levelService = LevelService();
  final DialogService _dialogService = DialogService();
  final QuestionService _questionService = QuestionService();
  final PredialogService _predialogService = PredialogService();
  late final ResourceService resource;
  late final GameEngine game;

  @override
  Future<StoryState> build() async {
    ref.onDispose(() {
      resource.clearAll();
      game.removeStoryResources();
    });
    game = ref.read(gameEngineProvider);
    resource = ref.read(resourceServiceProvider);
    final levels = await _levelService.loadAllLevels(
      'assets/stories/stage1.json',
    );
    await resource.preLoadBackgrounds(
      levels.map((level) => level.background).toList(),
    );
    return StoryState(levels: levels);
  }

  Future<void> startLevel(int index) async {
    state = const AsyncValue.loading();
    final levels = state.value!.levels;
    final level = levels[index];

    await Future.wait([
      MusicService.switchLevelMusic(index),
      resource.preloadCharacters(
        level.character1Images + level.character2Images,
      ),
      resource.preloadIlustrations(level.ilustrations),
    ]);
    state = AsyncValue.data(state.value!.copyWith(activeLevel: level));
    game.overlays.remove('GameUI');
    if (level.typeStart == 'preDialog') {
      showPreDialog(level.start);
    } else {
      showDialog(level.start);
    }
    await game.loadBackground(level.background);
  }

  void showPreDialog(String preDialogId) {
    final level = state.value!.activeLevel!;
    final preDialog = _predialogService.getPredialogById(level, preDialogId);
    state = AsyncValue.data(
      state.value!.copyWith(preDialog: preDialog, activeMode: 'preDialog'),
    );

    _showContentOverlay('Intro');
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

    _showContentOverlay('Dialog');
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
    _showContentOverlay('Question', withMenu: false);
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
              final nextDialog = _dialogService.getDialogById(level, choice.next);
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
    game.removeStoryResources();
    _showContentOverlay('EndGame', withMenu: false);
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
    resource.clearStoryResources();
    _showContentOverlay('GameUI', withMenu: false);
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
        activeLevel: null,
      ),
    );
  }

  void restartLevel() {
    if (state.value!.activeMode == 'dialog') {
      game.hideCharacters();
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
    resource.clearStoryResources();
    game.removeStoryResources();
    _clearStoryContents();
    game.overlays.remove('StoryMenu');
    game.overlays.add('GameUI');
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
        activeLevel: null,
      ),
    );
  }

  void _clearStoryContents() {
    final o = game.overlays;
    for (final name in [
      'Intro',
      'Dialog',
      'StorySkip',
      'Question',
      'EndGame',
    ]) {
      o.remove(name);
    }
  }

  void _showContentOverlay(String contentName, {bool withMenu = true}) {
    _clearStoryContents();
    if (!withMenu) {
      game.overlays.remove('StoryMenu');
    }

    if (withMenu) game.overlays.add('StoryMenu');
    game.overlays.add(contentName);
    if (contentName == 'Dialog') game.overlays.add('StorySkip');
  }
}
