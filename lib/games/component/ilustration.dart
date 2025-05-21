import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart' show Colors, Paint; // buat warna

class StoryIlustrationComponent extends Component {
  final String ilustrationPath;
  late final SpriteComponent ilustration;
  late final RectangleComponent border;
  late final FlameGame _game;

  StoryIlustrationComponent(this.ilustrationPath);

  @override
  Future<void> onLoad() async {
    _game = findGame()!;
    await loadIlustration(ilustrationPath);
  }

  Future<void> loadIlustration(String path) async {
    final image = await _game.images.fromCache('ilustration/$path.webp');

    final size = Vector2.all(350);
    final borderWidth = 4.0;
    final position = Vector2((_game.size.x - size.x) / 2, _game.size.y * 0.15);

    border = RectangleComponent(
      position: position - Vector2.all(borderWidth),
      size: size + Vector2.all(borderWidth * 2),
      paint: Paint()..color = Colors.black,
      priority: -101,
    );

    ilustration = SpriteComponent(
      sprite: Sprite(image),
      size: size,
      position: position,
      anchor: Anchor.topLeft,
      priority: -100,
    );

    addAll([border, ilustration]);
  }

  Future<void> changeIlustration(String newPath) async {
    ilustration.removeFromParent();
    border.removeFromParent();

    final image = await _game.images.fromCache('ilustration/$newPath.webp');

    final size = Vector2.all(350);
    final borderWidth = 4.0;
    final position = Vector2((_game.size.x - size.x) / 2, _game.size.y * 0.3);

    border = RectangleComponent(
      position: position - Vector2.all(borderWidth),
      size: size + Vector2.all(borderWidth * 2),
      paint: Paint()..color = Colors.black,
      priority: -101,
    );

    ilustration
      ..sprite = Sprite(image)
      ..size = size
      ..position = position;

    addAll([border, ilustration]);
  }
}
