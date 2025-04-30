import 'package:flutter/material.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/themes/colors.dart';

class IntroBoxWidget extends StatelessWidget {
  final GameEngine game;
  const IntroBoxWidget({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.35;

    return Center(
      child: Container(
        width: 380,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.backgroundTransparent,
          border: Border.all(color: Theme.of(context).dividerColor, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: maxHeight),
              child: SingleChildScrollView(
                child: Text(
                  game.preDialogue.text,
                  style: Theme.of(context).textTheme.labelSmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  game.removeIntro();
                  if (game.preDialogue.nextType == 'dialogue') {
                    game.setCurrentDialog(game.preDialogue.next!);
                  } else if (game.preDialogue.nextType == 'question') {
                    game.setCurrentQuestion(game.preDialogue.next!);
                  }
                },
                icon: const Icon(
                  Icons.double_arrow,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
