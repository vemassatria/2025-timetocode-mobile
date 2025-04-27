import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class StoryCharactersComponent extends Component {
  final String person1Path, person2Path;
  late final SpriteComponent person1, person2;
  late final FlameGame _game;

  StoryCharactersComponent(this.person1Path, this.person2Path);

  @override
  Future<void> onLoad() async {
    _game = findGame()!;
    await loadCharacters(person1Path, person2Path);
  }

  Future<void> loadCharacters(String person1Path, String person2Path) async {
    final image1 = await _game.images.load('character/$person1Path.webp');
    final image2 = await _game.images.load('character/$person2Path.webp');

    final height = _game.size.y * 0.7;
    final width1 = image1.width / image1.height * height;
    final width2 = image2.width / image2.height * height;

    person1 = SpriteComponent(
      sprite: Sprite(image1),
      size: Vector2(width1, height),
      position: Vector2(_game.size.x * 0.925, _game.size.y * 0.95),
      anchor: Anchor.bottomRight,
    );

    person2 = SpriteComponent(
      sprite: Sprite(image2),
      size: Vector2(width2, height),
      position: Vector2(_game.size.x * 0.075, _game.size.y * 0.95),
      anchor: Anchor.bottomLeft,
    );

    add(person1);
    add(person2);
  }

  //mengganti karakter
  Future<void> changeCharacter(
    int indexCharacter,
    String characterNewPath,
  ) async {
    final image = await _game.images.load('character/$characterNewPath.webp');
    final height = _game.size.y * 0.7;
    final width = image.width / image.height * height;

    final character = indexCharacter == 1 ? person1 : person2;

    character
      ..sprite = Sprite(image)
      ..size = Vector2(width, height);
  }

  //menghitamkan karakter
  Future<void> activeCharacter(int indexCharacter) async {
    final secondCharacter = indexCharacter == 1 ? person2 : person1;
    enhancedCharacter(indexCharacter);
    secondCharacter.paint =
        Paint()
          ..colorFilter = ColorFilter.mode(
            Colors.black.withOpacity(0.75),
            BlendMode.srcATop,
          );
  }

  //membesarkan karakter
  Future<void> enhancedCharacter(int indexCharacter) async {
    final target = indexCharacter == 1 ? person1 : person2;
    final height = _game.size.y * 0.825;
    final width = target.sprite!.srcSize.x / target.sprite!.srcSize.y * height;
    final position =
        indexCharacter == 1
            ? Vector2(_game.size.x * 1.15, _game.size.y * 0.95)
            : Vector2(_game.size.x * -0.15, _game.size.y * 0.95);
    target
      ..size = Vector2(width, height)
      ..position = position;
  }

  //fungsinya ini untuk mengecilkan karakter ke posisi semula
  Future<void> normalMCCharacter(int indexCharacter) async {
    final target = indexCharacter == 1 ? person1 : person2;
    final height = _game.size.y * 0.7;
    final width = target.sprite!.srcSize.x / target.sprite!.srcSize.y * height;
    final position =
        indexCharacter == 1
            ? Vector2(_game.size.x * 0.925, _game.size.y * 0.95)
            : Vector2(_game.size.x * 0.075, _game.size.y * 0.95);
    target
      ..size = Vector2(width, height)
      ..position = position;
  }

  //fungsinya ini untuk menormalkan warna karakter
  Future<void> normalSecondCharacter(int indexCharacter) async {
    final target = indexCharacter == 1 ? person1 : person2;
    target.paint = Paint();
  }

  Future<void> normalCharacters(int MCIndex) async {
    if (MCIndex == 1) {
      normalMCCharacter(1);
      normalSecondCharacter(2);
    } else {
      normalMCCharacter(2);
      normalSecondCharacter(1);
    }
  }
}
