import 'dart:convert';

import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:timetocode/components/flame_engine/background.dart';
import 'package:timetocode/components/flame_engine/character.dart';
import 'package:timetocode/games/models/dialog_model.dart';
import 'package:timetocode/games/models/level_model.dart';
import 'package:timetocode/games/models/predialog_model.dart';
import 'package:timetocode/games/models/question_model.dart';

class GameEngine extends FlameGame {
  late SceneBackgroundComponent sceneBackground;
  StoryCharactersComponent? storyCharacters;

  late final List<LevelModel> levels;

  late PreDialogModel? _preDialogue;

  late DialogModel? _currentDialogs;
  PreDialogModel get preDialogue => _preDialogue!;
  DialogModel get currentDialogs => _currentDialogs!;

  late List<String>? _character1Path;
  late List<String>? _character2Path;
  List<String> get character1Path => _character1Path!;
  List<String> get character2Path => _character2Path!;

  late int character1ActivePath;
  late int character2ActivePath;

  late int activeLevel;
  late String activeMode;

  late QuestionModel? _currentQuestion;
  QuestionModel get currentQuestion => _currentQuestion!;

  late int correctAnswer;
  late int wrongAnswer;

  @override
  Future<void> onLoad() async {
    await _loadLevels();
    images.prefix = 'assets/';
    await super.onLoad();
    sceneBackground = SceneBackgroundComponent(size: size);
    add(sceneBackground);
  }

  Future<void> _loadLevels() async {
    final jsonStr = await rootBundle.loadString('assets/stories/stage1.json');
    final data = json.decode(jsonStr) as Map<String, dynamic>;
    levels =
        (data['levels'] as List)
            .map((j) => LevelModel.fromJson(j as Map<String, dynamic>))
            .toList();
  }

  void startLevel(int indexLevel) {
    overlays.remove('GameUI');
    overlays.add('Story');
    changeScene(levels[indexLevel].background);
    _character1Path = levels[indexLevel].character1Images;
    _character2Path = levels[indexLevel].character2Images;
    character1ActivePath = 0;
    character2ActivePath = 0;
    activeLevel = indexLevel;
    correctAnswer = 0;
    wrongAnswer = 0;
    if (levels[indexLevel].typeStart == 'preDialog') {
      _preDialogue = levels[indexLevel].preDialog;
      activeMode = "intro";
      overlays.add('Intro');
    } else {
      setCurrentDialog(levels[indexLevel].start);
    }
  }

  void setCurrentDialog(String id) {
    _currentDialogs = levels[activeLevel].getDialog(id);
    activeMode = "dialogue";
    overlays.add('DialogueBox');
  }

  void setCurrentQuestion(String id) {
    _currentQuestion = levels[activeLevel].questions.firstWhere(
      (dialog) => dialog.id == id,
    );
    activeMode = "question";
    overlays.add('QuestionBox');
  }

  Future<void> changeScene(String sceneName) async {
    images.prefix = 'assets/';
    await sceneBackground.loadScene(sceneName);
  }

  Future<void> loadCharacter(
    String character1Path,
    String character2Path,
  ) async {
    storyCharacters = StoryCharactersComponent(character1Path, character2Path);
    add(storyCharacters!);
  }

  void removeDialog() {
    _currentDialogs = null;
    removeCharacter();
    overlays.remove('DialogueBox');
  }

  void removeQuestion() {
    overlays.remove('QuestionBox');
    _currentQuestion = null;
  }

  void removeIntro() {
    overlays.remove('Intro');
    _preDialogue = null;
  }

  void endGame() {
    _currentDialogs = null;
    _currentQuestion = null;
    _preDialogue = null;
    changeScene('default');
    overlays.add('GameUI');
  }

  void removeCharacter() {
    storyCharacters!.removeFromParent();
    storyCharacters = null;
  }

  void changeCharacter(int indexCharacter, String characterNewPath) async {
    await storyCharacters!.changeCharacter(indexCharacter, characterNewPath);
  }

  void activeCharacter(int indexCharacter) async {
    await storyCharacters!.activeCharacter(indexCharacter);
  }

  void enchancedCharacter(int indexCharacter) async {
    await storyCharacters!.enhancedCharacter(indexCharacter);
  }

  void normalMCCharacter(int indexCharacter) async {
    await storyCharacters!.normalMCCharacter(indexCharacter);
  }

  void normalSecondCharacter(int indexCharacter) async {
    await storyCharacters!.normalSecondCharacter(indexCharacter);
  }

  void normalCharacters(int indexCharacter) async {
    await storyCharacters!.normalCharacters(indexCharacter);
  }
}
