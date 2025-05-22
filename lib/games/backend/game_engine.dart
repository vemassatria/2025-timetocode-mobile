import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:timetocode/games/component/background.dart';
import 'package:timetocode/games/component/character.dart';
import 'package:timetocode/games/component/ilustration.dart';

class GameEngine extends FlameGame with RiverpodGameMixin {
  SceneBackgroundComponent? _background;
  StoryCharactersComponent? _characters;
  StoryIlustrationComponent? _ilustration;

  @override
  Future<void> onLoad() async {
    images.prefix = 'assets/';
    await super.onLoad();
  }

  @override
  void onRemove() {
    super.onRemove();
    removeStoryResources();
  }

  Future<void> loadBackground(String name) async {
    _background = SceneBackgroundComponent(size: size, currentScene: name);
    await add(_background!);
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
    if (isIllustration)
      await _characters!.explainEmotion(speaker);
    else
      await _characters!.changeEmotion(speaker);
  }

  void removeStoryResources() {
    _characters?.removeFromParent();
    _background?.removeFromParent();
    _ilustration?.removeFromParent();
    _background = null;
    _characters = null;
    _ilustration = null;
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

  get characters => _characters;
  get ilustration => _ilustration;
}
