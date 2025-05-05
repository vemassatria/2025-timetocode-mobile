import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: Stack(
        children: [
          // Konten lainnya di bawah MenuButton bisa ditambahkan di sini
          Positioned(
            top: 0, // Memberikan jarak 16.h dari atas layar
            left: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 16.h), // Padding ke atas
                child: MenuButton(
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
            ),
          ),
          // Kamu bisa menambahkan widget lainnya di sini, misalnya:
          // Positioned(
          //   top: 100.h,
          //   left: 0,
          //   child: Text('Konten lainnya'),
          // ),
        ],
      ),
    );
  }
}
