import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:timetocode/pages/story_page.dart';

class StoryMode extends FlameGame {
  late Sprite backgroundSprite;

  @override
  Future<void> onLoad() async {
    images.prefix = 'assets/';
    backgroundSprite = await loadSprite('background/background.webp');

    add(StoryPage());
    return super.onLoad();
  }
}
