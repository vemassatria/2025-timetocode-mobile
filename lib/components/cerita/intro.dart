import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/providers/game_provider.dart';
import 'package:timetocode/themes/colors.dart';

class IntroBoxWidget extends ConsumerWidget {
  const IntroBoxWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.read(gameEngineProvider);
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
                  game.preDialog!.text,
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
                  if (game.preDialog!.nextType == 'dialog') {
                    game.setCurrentDialog(game.preDialog!.next);
                  } else if (game.preDialog!.nextType == 'soal') {
                    game.setCurrentQuestion(game.preDialog!.next);
                  }
                  game.removeIntro();
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
