import 'package:flame/game.dart';
import 'package:timetocode/components/flame_engine/background.dart';
import 'package:timetocode/components/flame_engine/character.dart';

class GameEngine extends FlameGame {
  late SceneBackgroundComponent sceneBackground;
  StoryCharactersComponent? storyCharacters;

  @override
  Future<void> onLoad() async {
    images.prefix = 'assets/';
    await super.onLoad();
    sceneBackground = SceneBackgroundComponent(size: size);
    add(sceneBackground);
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
}
