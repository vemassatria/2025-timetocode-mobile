import 'package:flutter/material.dart';
import 'package:timetocode/components/box/narration_box.dart';
import 'package:timetocode/games/game_engine.dart';

class IntroBoxWidget extends StatelessWidget {
  final GameEngine game;
  const IntroBoxWidget({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NarrationBox(
        narrationText: game.preDialogue.text,
        onTap: () {
          if (game.preDialogue.nextType == 'dialog') {
            game.setCurrentDialog(game.preDialogue.next);
          } else if (game.preDialogue.nextType == 'soal') {
            game.setCurrentQuestion(game.preDialogue.next);
          }
          game.removeIntro();
        },
      ),
    );
  }
}
