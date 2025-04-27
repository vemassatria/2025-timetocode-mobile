import 'package:flutter/material.dart';
import 'package:timetocode/components/menu_button.dart';
import 'package:timetocode/games/game_engine.dart';

class StoryPage extends StatelessWidget {
  final GameEngine game;
  const StoryPage({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 48,
        leadingWidth: 70,
        backgroundColor: Colors.transparent,
        leading: MenuButton(
          onRestart: () {},
          onExit: () {
            game.overlays.remove('Story');
            game.changeScene('default');
            game.removeStory();
            game.overlays.add('GameUI');
          },
        ),
      ),
    );
  }
}
