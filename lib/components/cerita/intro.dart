import 'package:flutter/material.dart';
import 'package:timetocode/components/box/narration_box.dart';
import 'package:timetocode/games/game_engine.dart';

class IntroBoxWidget extends StatelessWidget {
  final GameEngine game;
  const IntroBoxWidget({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NarrationBox(
        narrationText: game.preDialog!.text,
        onTap: () {
          if (game.preDialog!.nextType == 'dialog') {
            game.setCurrentDialog(game.preDialog!.next);
          } else if (game.preDialog!.nextType == 'soal') {
            game.setCurrentQuestion(game.preDialog!.next);
          }
          game.removeIntro();
        },
      ),
    );
  }
}
