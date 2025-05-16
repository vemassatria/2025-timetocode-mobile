import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:timetocode/games/component/background.dart';
import 'package:timetocode/games/component/character.dart';

class GameEngine extends FlameGame with RiverpodGameMixin {
  late SceneBackgroundComponent _background;
  StoryCharactersComponent? _characters;

  @override
  Future<void> onLoad() async {
    images.prefix = 'assets/';
    await super.onLoad();
    _background = SceneBackgroundComponent(size: size);
    add(_background);
  }

  @override
  void onRemove() {
    super.onRemove();
    _background.removeFromParent();
    _characters?.removeFromParent();
    _characters = null;
  }

  Future<void> loadScene(String name) async {
    await _background.loadScene(name);
  }

  Future<void> showCharacters({
    String? char1Img,
    String? char2Img,
    int? c1Reaction,
    int? c2Reaction,
    required int speaker,
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
    await _characters!.changeEmotion(speaker);
  }

  void removeCharacters() {
    _characters?.removeFromParent();
    _characters = null;
  }

  void hideCharacters() {
    _characters?.removeFromParent();
  }

  void showCharactersOverlay() {
    add(_characters!);
  }

  get characters => _characters;
}
