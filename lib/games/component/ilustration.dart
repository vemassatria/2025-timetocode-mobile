import 'package:flame/components.dart';
import 'package:flame/game.dart';

class StoryIlustrationComponent extends Component {
  final String ilustrationPath;
  late final SpriteComponent ilustration;
  late final FlameGame _game;

  StoryIlustrationComponent(this.ilustrationPath);

  @override
  Future<void> onLoad() async {
    _game = findGame()!;
    await loadIlustration(ilustrationPath);
  }

  Future<void> loadIlustration(String ilustrationPath) async {
    final image = await _game.images.fromCache(
      'ilustration/$ilustrationPath.webp',
    );

    final height = _game.size.y * 0.7;
    final width = image.width / image.height * height;

    ilustration = SpriteComponent(
      sprite: Sprite(image),
      size: Vector2(width, height),
      position: Vector2(_game.size.x * 0.5, _game.size.y * 0.5),
      anchor: Anchor.center,
      priority: -100,
    );

    add(ilustration);
  }

  Future<void> changeIlustration(String newIlustrationPath) async {
    ilustration.removeFromParent();
    final image = await _game.images.fromCache(
      'ilustration/$newIlustrationPath.webp',
    );

    final height = _game.size.y * 0.7;
    final width = image.width / image.height * height;

    ilustration
      ..sprite = Sprite(image)
      ..size = Vector2(width, height);
  }
}
