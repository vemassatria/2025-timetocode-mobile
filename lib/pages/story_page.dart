import 'dart:async';

import 'package:flame/components.dart';
import 'package:jenny/jenny.dart';
import 'package:timetocode/games/story_mode.dart';

class StoryPage extends PositionComponent
    with DialogueView, HasGameReference<StoryMode> {
  final background = SpriteComponent();

  @override
  FutureOr<void> onLoad() {
    background
      ..sprite = game.backgroundSprite
      ..size = game.size;

    addAll([background]);
    return super.onLoad();
  }
}
