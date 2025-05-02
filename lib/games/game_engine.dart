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

  late PreDialogModel? preDialog;

  late DialogModel? currentDialogs;

  late List<String>? character1Path;
  late List<String>? character2Path;

  late int character1ActivePath;
  late int character2ActivePath;

  late int activeLevel;
  late String activeMode;

  late QuestionModel? currentQuestion;

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
    overlays.add('StoryMenu');
    changeScene(levels[indexLevel].background);
    character1Path = levels[indexLevel].character1Images;
    character2Path = levels[indexLevel].character2Images;
    activeLevel = indexLevel;
    correctAnswer = 0;
    wrongAnswer = 0;
    if (levels[indexLevel].typeStart == 'preDialog') {
      preDialog = levels[indexLevel].preDialog;
      activeMode = "intro";
      overlays.add('Intro');
    } else {
      setCurrentDialog(levels[indexLevel].start);
    }
  }

  void setCurrentDialog(String id) {
    currentDialogs = levels[activeLevel].getDialog(id);
    activeMode = "dialog";
    overlays.add('DialogBox');
  }

  void setCurrentQuestion(String id) {
    currentQuestion = levels[activeLevel].questions.firstWhere(
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
    currentDialogs = null;
    removeCharacter();
    overlays.remove('DialogBox');
  }

  void removeQuestion() {
    overlays.remove('QuestionBox');
    currentQuestion = null;
  }

  void removeIntro() {
    overlays.remove('Intro');
    preDialog = null;
  }

  void endGame() {
    currentDialogs = null;
    currentQuestion = null;
    preDialog = null;
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

  void blackCharacter(int indexCharacter) async {
    await storyCharacters!.negroCharacter(indexCharacter);
  }

  void enhancedSizeCharacter(int indexCharacter) async {
    await storyCharacters!.enhancedSizeCharacter(indexCharacter);
  }

  void normalSizeCharacter(int indexCharacter) async {
    await storyCharacters!.normalSizeCharacter(indexCharacter);
  }

  void normalColorCharacter(int indexCharacter) async {
    await storyCharacters!.normalColorCharacter(indexCharacter);
  }
}
