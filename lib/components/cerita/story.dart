import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/components/menu_button.dart';
import 'package:timetocode/providers/game_provider.dart';
import 'package:timetocode/utils/overlay_utils.dart';

class StoryPage extends ConsumerWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.read(gameEngineProvider);
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
            } else if (game.activeMode == "dialog") {
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
            } else if (game.activeMode == "dialog") {
              game.removeDialog();
            } else {
              game.removeQuestion();
            }
            game.endGame();
            game.overlays.remove('StoryMenu');
            closePopupOverlay();
          },
        ),
      ),
    );
  }
}
