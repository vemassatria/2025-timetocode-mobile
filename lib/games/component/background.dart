import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';

class SceneBackgroundComponent extends SpriteComponent {
  String currentScene;
  late final FlameGame game;

  SceneBackgroundComponent({
    this.currentScene = "default",
    required Vector2 size,
  }) : super(size: size, position: Vector2.zero(), anchor: Anchor.topLeft);

  @override
  Future<void> onLoad() async {
    game = findGame()!;
    await super.onLoad();
    await loadScene(currentScene);
  }

  Future<void> loadScene(String sceneName) async {
    final image = await game.images.fromCache('background/$sceneName.webp');
    sprite = Sprite(image);

    size = game.size;

    sprite!.paint =
        Paint()
          ..filterQuality = FilterQuality.high
          ..isAntiAlias = true
          ..shader = null;
  }
}
