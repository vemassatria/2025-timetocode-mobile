import 'dart:convert';

import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:timetocode/components/flame_engine/background.dart';
import 'package:timetocode/components/flame_engine/character.dart';
import 'package:timetocode/games/models/dialog_model.dart';
import 'package:timetocode/games/models/level_model.dart';
import 'package:timetocode/games/models/predialog_model.dart';
import 'package:timetocode/games/models/question_model.dart';

class GameEngine extends FlameGame with RiverpodGameMixin {
  late SceneBackgroundComponent sceneBackground;
  StoryCharactersComponent? storyCharacters;

  late final List<LevelModel> levels;

  PreDialogModel? preDialog;
  DialogModel? currentDialogs;

  List<String>? character1Path;
  List<String>? character2Path;

  late int character1ActivePath;
  late int character2ActivePath;

  late int activeLevel;
  late String activeMode;

  QuestionModel? currentQuestion;

  late int correctAnswer;
  late int wrongAnswer;

  // Add texture cache tracking
  final Set<String> _loadedTextures = {};

  @override
  Future<void> onLoad() async {
    await _loadLevels();
    images.prefix = 'assets/';
    await super.onLoad();
    sceneBackground = SceneBackgroundComponent(size: size);
    add(sceneBackground);
  }

  @override
  void onRemove() {
    // Clean up resources when game is removed
    _clearResources();
    super.onRemove();
  }

  // Add method to clear resources
  void _clearResources() {
    // Clear all cached images instead of trying to remove individual textures
    images.clearCache();

    // Clear other resources
    removeCharacter();
    currentDialogs = null;
    currentQuestion = null;
    preDialog = null;
    character1Path = null;
    character2Path = null;
    _loadedTextures.clear();
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
    // Clear previous resources before starting new level
    _clearGameplayResources();

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
    // Track which textures we're loading
    final String texturePath = 'background/$sceneName.webp';
    _loadedTextures.add(texturePath);

    // Load new scene
    await sceneBackground.loadScene(sceneName);
  }

  Future<void> loadCharacter(
    String character1Path,
    String character2Path,
  ) async {
    // Track character textures
    _loadedTextures.add(character1Path);
    _loadedTextures.add(character2Path);

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

  // Clear only gameplay resources
  void _clearGameplayResources() {
    if (storyCharacters != null) removeCharacter();
    currentDialogs = null;
    currentQuestion = null;
    preDialog = null;
    activeMode = "";
  }

  void endGame() {
    // Clean up all resources properly
    _clearResources();

    // Reset character state
    character1ActivePath = 0;
    character2ActivePath = 0;

    // Change scene with proper cleanup
    changeScene('default');

    // Update overlays
    overlays.remove('StoryMenu');
    overlays.add('GameUI');
  }

  void removeCharacter() {
    if (storyCharacters != null) {
      storyCharacters!.removeFromParent();
      storyCharacters = null;
    }
  }

  Future<void> changeCharacter(
    int indexCharacter,
    String characterNewPath,
  ) async {
    // Track character textures
    _loadedTextures.add(characterNewPath);

    await storyCharacters!.changeCharacter(indexCharacter, characterNewPath);
  }

  Future<void> blackCharacter(int indexCharacter) async {
    await storyCharacters!.negroCharacter(indexCharacter);
  }

  Future<void> enhancedSizeCharacter(int indexCharacter) async {
    await storyCharacters!.enhancedSizeCharacter(indexCharacter);
  }

  Future<void> normalSizeCharacter(int indexCharacter) async {
    await storyCharacters!.normalSizeCharacter(indexCharacter);
  }

  Future<void> normalColorCharacter(int indexCharacter) async {
    await storyCharacters!.normalColorCharacter(indexCharacter);
  }
}
