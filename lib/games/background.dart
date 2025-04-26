import 'package:flame/game.dart';
import 'package:timetocode/components/background.dart';

class Background extends FlameGame {
  late SceneBackgroundComponent sceneBackground;

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
}
