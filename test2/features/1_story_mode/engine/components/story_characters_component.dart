import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class StoryCharactersComponent extends Component {
  final String person1Path, person2Path;
  late final SpriteComponent person1, person2;
  late final FlameGame _game;
  int currentIndex1 = 0;
  int currentIndex2 = 0;

  StoryCharactersComponent(
    this.person1Path,
    this.person2Path,
    this.currentIndex1,
    this.currentIndex2,
  ) : super(priority: 100);

  @override
  Future<void> onLoad() async {
    _game = findGame()!;
    await loadCharacters(
      person1Path,
      person2Path,
      currentIndex1,
      currentIndex2,
    );
  }

  Future<void> loadCharacters(
    String person1Path,
    String person2Path,
    int indexPerson1Path,
    int indexPerson2Path,
  ) async {
    final image1 = _game.images.fromCache('character/$person1Path.webp');
    final image2 = _game.images.fromCache('character/$person2Path.webp');

    person1 = SpriteComponent(
      sprite: Sprite(image1),
      anchor: Anchor.bottomLeft,
    );

    person2 = SpriteComponent(
      sprite: Sprite(image2),
      anchor: Anchor.bottomRight,
    );

    add(person1);
    add(person2);

    currentIndex1 = indexPerson1Path;
    currentIndex2 = indexPerson2Path;
  }

  //mengganti karakter
  Future<void> changeCharacter(
    int indexCharacter,
    String characterNewPath,
    int newIndexPath,
  ) async {
    final image = _game.images.fromCache(
      'character/$characterNewPath.webp',
    );
    final height = _game.size.y * 0.35;
    final width = image.width / image.height * height;

    final character = indexCharacter == 1 ? person1 : person2;

    character
      ..sprite = Sprite(image)
      ..size = Vector2(width, height);

    if (indexCharacter == 1) {
      currentIndex1 = newIndexPath;
    } else {
      currentIndex2 = newIndexPath;
    }
  }

  //menghitamkan karakter
  Future<void> negroCharacter(int indexCharacter) async {
    final secondCharacter = indexCharacter == 1 ? person1 : person2;
    secondCharacter.paint =
        Paint()
          ..colorFilter = ColorFilter.mode(
            Colors.black.withValues(alpha: 0.655),
            BlendMode.srcATop,
          );
  }

  //membesarkan karakter
  Future<void> enhancedSizeCharacter(int indexCharacter) async {
    final target = indexCharacter == 1 ? person1 : person2;
    final height = _game.size.y * 0.375;
    final width = target.sprite!.srcSize.x / target.sprite!.srcSize.y * height;
    final position =
        indexCharacter == 1
            ? Vector2(_game.size.x * 0, _game.size.y * 0.63)
            : Vector2(_game.size.x * 1, _game.size.y * 0.63);

    target.priority = 101;

    target
      ..size = Vector2(width, height)
      ..position = position;
  }

  //fungsinya ini untuk mengecilkan karakter ke posisi semula
  Future<void> normalSizeCharacter(int indexCharacter) async {
    final target = indexCharacter == 1 ? person1 : person2;
    final height = _game.size.y * 0.35;
    final width = target.sprite!.srcSize.x / target.sprite!.srcSize.y * height;
    final position =
        indexCharacter == 1
            ? Vector2(_game.size.x * 0, _game.size.y * 0.63)
            : Vector2(_game.size.x * 1, _game.size.y * 0.63);

    target.priority = 100;

    target
      ..size = Vector2(width, height)
      ..position = position;
  }

  //fungsinya ini untuk menormalkan warna karakter
  Future<void> normalColorCharacter(int indexCharacter) async {
    final target = indexCharacter == 1 ? person1 : person2;
    target.paint = Paint();
  }

  Future<void> changeEmotion(int indexMainCharacter) async {
    final int indexSecondCharacter = indexMainCharacter == 1 ? 2 : 1;
    await Future.wait([
      normalColorCharacter(indexMainCharacter),
      normalSizeCharacter(indexSecondCharacter),
      enhancedSizeCharacter(indexMainCharacter),
      negroCharacter(indexSecondCharacter),
    ]);
  }

  Future<void> transparentCharacter(int indexCharacter) async {
    final target = indexCharacter == 1 ? person1 : person2;
    target.paint =
        Paint()
          ..colorFilter = const ColorFilter.mode(Colors.transparent, BlendMode.dstIn);
  }

  Future<void> explainingCharacter(int indexCharacter) async {
    final target = indexCharacter == 1 ? person1 : person2;
    final halfHeight = _game.size.y * 0.25;
    final halfWidth =
        target.sprite!.srcSize.x / target.sprite!.srcSize.y * halfHeight;
    final halfPosition =
        indexCharacter == 1
            ? Vector2(_game.size.x * 0, _game.size.y * 0.63)
            : Vector2(_game.size.x * 1, _game.size.y * 0.63);

    target
      ..size = Vector2(halfWidth, halfHeight)
      ..position = halfPosition;
  }

  Future<void> explainEmotion(int indexMainCharacter) async {
    final int indexSecondCharacter = indexMainCharacter == 1 ? 2 : 1;
    await Future.wait([
      normalColorCharacter(indexMainCharacter),
      normalSizeCharacter(indexSecondCharacter),
      explainingCharacter(indexMainCharacter),
      transparentCharacter(indexSecondCharacter),
    ]);
  }
}
