import 'dart:convert';

import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:timetocode/components/flame_engine/background.dart';
import 'package:timetocode/components/flame_engine/character.dart';
import 'package:timetocode/games/models/level_model.dart';

class GameEngine extends FlameGame {
  late SceneBackgroundComponent sceneBackground;
  StoryCharactersComponent? storyCharacters;

  late final List<LevelModel> levels;
  late String _preDialogue;
  List<String> _currentDialogs = [];
  List<String> get currentDialogs => _currentDialogs;
  String get preDialogue => _preDialogue;

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

  void startPreDialogue(int levelIndex) {
    final intro = levels[levelIndex].preDialog?.text;
    startDialogue(levelIndex);
    _preDialogue = intro!;
    overlays
      ..remove('GameUI')
      ..add('Story')
      ..add('Intro');
  }

  /// Mulai dialog intro untuk sebuah level
  void startDialogue(int levelIndex) {
    final intro =
        levels[levelIndex].dialogs.firstWhere((d) => d.id == 'intro').text;
    _currentDialogs = intro;
    // // show the overlay once
    // overlays
    //   ..remove('GameUI')
    //   ..add('Story')
    //   ..add('DialogueBox');
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

  void removeStory() {
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
