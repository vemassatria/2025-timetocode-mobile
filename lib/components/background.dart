// Buat class untuk mengelola background scene
import 'dart:ui';

import 'package:flame/components.dart';

class SceneBackgroundComponent extends Component {
  String currentScene;
  late Sprite backgroundSprite;
  Vector2 size;

  SceneBackgroundComponent({this.currentScene = "default", required this.size});

  @override
  Future<void> onLoad() async {
    await loadScene(currentScene);
    return super.onLoad();
  }

  Future<void> loadScene(String sceneName) async {
    currentScene = sceneName;
    backgroundSprite = await Sprite.load('background/$sceneName.webp');
  }

  @override
  void render(Canvas canvas) {
    backgroundSprite.render(canvas, size: size);
  }
}
