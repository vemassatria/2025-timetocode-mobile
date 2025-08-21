import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:timetocode/features/1_story_mode/engine/components/story_characters_component.dart';
import 'package:timetocode/features/1_story_mode/engine/components/story_illustration_component.dart';

class GameEngine extends FlameGame {
  final Set<String> _loadedCharacter = {};
  final Set<String> _loadedIlustration = {};
  StoryCharactersComponent? _characters;
  StoryIlustrationComponent? _ilustration;
  SpriteComponent? _background;

  @override
  void onRemove() {
    deleteAll();
    super.onRemove();
  }

  @override
  void onDispose() {
    deleteAll();
    super.onDispose();
  }

  Future<void> setBackground(String backgroundName) async {
    final newSprite = await Sprite.load('background/$backgroundName.webp');
    _background = SpriteComponent(sprite: newSprite);

    _background?.priority = -1;

    await add(_background!);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _background?.size = size;
  }

  Future<void> showCharacters({
    String? char1Img,
    String? char2Img,
    int? c1Reaction,
    int? c2Reaction,
    required int speaker,
    required bool isIllustration,
  }) async {
    if (_characters == null) {
      _characters = StoryCharactersComponent(
        char1Img!,
        char2Img!,
        c1Reaction!,
        c2Reaction!,
      );
      await add(_characters!);
    } else {
      await Future.wait([
        if (c1Reaction != null && _characters!.currentIndex1 != c1Reaction)
          _characters!.changeCharacter(1, char1Img!, c1Reaction),
        if (c2Reaction != null && _characters!.currentIndex2 != c2Reaction)
          _characters!.changeCharacter(2, char2Img!, c2Reaction),
      ]);
    }
    if (isIllustration) {
      await _characters!.explainEmotion(speaker);
    } else {
      await _characters!.changeEmotion(speaker);
    }
  }

  void hideCharacters() {
    _characters?.removeFromParent();
  }

  void showCharactersOverlay() {
    add(_characters!);
  }

  Future<void> showIlustration({
    String? ilustrationPath,
    int? ilustrationIndex,
  }) async {
    if (_ilustration == null) {
      _ilustration = StoryIlustrationComponent(
        ilustrationPath!,
        ilustrationIndex!,
      );
    } else {
      if (_ilustration!.currentIndex != ilustrationIndex) {
        await _ilustration!.changeIlustration(
          ilustrationPath!,
          ilustrationIndex!,
        );
      }
    }
    await add(_ilustration!);
  }

  void hideIlustration() {
    _ilustration?.removeFromParent();
  }

  Future<void> preloadCharacters(List<String> characterNames) async {
    await Future.wait(
      characterNames
          .where((name) => !_loadedCharacter.contains(_charKey(name)))
          .map((name) {
            final key = _charKey(name);
            _loadedCharacter.add(key);
            return images.load(key);
          }),
    );
  }

  Future<void> preloadIlustrations(List<String> ilustrations) async {
    await Future.wait(
      ilustrations
          .where((name) => !_loadedIlustration.contains(_ilustrationKey(name)))
          .map((name) {
            final key = _ilustrationKey(name);
            _loadedIlustration.add(key);
            return images.load(key);
          }),
    );
  }

  void deleteAll() {
    removeAll(children.toList());
    _background = null;
    _characters = null;
    _ilustration = null;
    _loadedCharacter.clear();
    _loadedIlustration.clear();
    images.clearCache();
  }

  String _charKey(String characterName) => 'character/$characterName.webp';
  String _ilustrationKey(String ilustrationName) =>
      'ilustration/$ilustrationName.webp';

  get characters => _characters;
  get ilustration => _ilustration;
}
