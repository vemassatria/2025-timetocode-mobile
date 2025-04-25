import 'dart:async';
import 'package:flame/components.dart';
import 'package:timetocode/games/end_game.dart';

class EndGameComponent extends Component with HasGameReference<EndGame> {
  late SpriteComponent background;

  @override
  FutureOr<void> onLoad() async {
    background =
        SpriteComponent()
          ..sprite = game.backgroundSprite
          ..size = game.size;

    add(background);
    return super.onLoad();
  }
}
