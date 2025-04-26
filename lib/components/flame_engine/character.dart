import 'package:flame/components.dart';
import 'package:flame/game.dart';

class StoryCharactersComponent extends Component {
  final String person1Path, person2Path;
  late final SpriteComponent person1, person2;
  late final FlameGame _game;

  StoryCharactersComponent(this.person1Path, this.person2Path);

  @override
  Future<void> onLoad() async {
    _game = findGame()!;
    final image1 = await _game.images.load('character/$person1Path.webp');
    final image2 = await _game.images.load('character/$person2Path.webp');

    final height = _game.size.y * 0.7;
    final width1 = image1.width / image1.height * height;
    final width2 = image2.width / image2.height * height;

    person1 = SpriteComponent(
      sprite: Sprite(image1),
      size: Vector2(width1, height),
      position: Vector2(_game.size.x * 0.2, _game.size.y * 0.8),
      anchor: Anchor.bottomLeft,
    );

    person2 = SpriteComponent(
      sprite: Sprite(image2),
      size: Vector2(width2, height),
      position: Vector2(_game.size.x * 0.8, _game.size.y * 0.8),
      anchor: Anchor.bottomRight,
    );

    add(person1);
    add(person2);
  }
}
