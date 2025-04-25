import 'package:flame/components.dart';
import 'package:flame/game.dart';

class EndGame extends FlameGame {
  late Sprite backgroundSprite;

  @override
  Future<void> onLoad() async {
    images.prefix = 'assets/';
    backgroundSprite = await loadSprite('background/background.webp');
    return super.onLoad();
  }
}
