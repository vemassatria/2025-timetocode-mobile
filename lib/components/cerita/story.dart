import 'package:flutter/material.dart';
import 'package:timetocode/components/menu_button.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/utils/overlay_utils.dart';

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
          onRestart: () {
            if (game.activeMode == "intro") {
              game.removeIntro();
            } else if (game.activeMode == "dialogue") {
              game.removeDialog();
            } else {
              game.removeQuestion();
            }
            game.startLevel(game.activeLevel);
            closePopupOverlay();
          },
          onExit: () {
            if (game.activeMode == "intro") {
              game.removeIntro();
            } else if (game.activeMode == "dialogue") {
              game.removeDialog();
            } else {
              game.removeQuestion();
            }
            game.endGame();
            game.overlays.remove('Story');
            closePopupOverlay();
          },
        ),
      ),
    );
  }
}
