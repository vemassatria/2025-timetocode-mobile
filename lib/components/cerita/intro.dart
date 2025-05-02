import 'package:flutter/material.dart';
import 'package:timetocode/components/box/narration_box.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/providers/game_provider.dart';

class IntroBoxWidget extends ConsumerWidget {
  const IntroBoxWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.read(gameEngineProvider);
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
