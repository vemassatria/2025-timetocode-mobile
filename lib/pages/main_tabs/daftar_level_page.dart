import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:timetocode/components/card.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/themes/colors.dart';

class DaftarLevelPage extends StatelessWidget {
  final FlameGame game;
  const DaftarLevelPage({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalLevel = 6;
    int completedLevel = 1;
    final double progress = completedLevel / totalLevel;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'Konsep Pemrograman',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    value: progress,
                    color: AppColors.deepAzure,
                    backgroundColor: AppColors.gray1,
                    padding: EdgeInsets.all(4),
                  ),
                ),
                Text(
                  '$completedLevel/$totalLevel',
                  style: const TextStyle(color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  LevelCard(
                    image: Image.asset('assets/images/TEMP.jpg'),
                    title: "Level 1 - Pengenalan Pemrograman",
                    status: CardStatus.completed,
                    onStartPressed: () {
                      (game as GameEngine).changeScene('lab');
                      (game as GameEngine).loadCharacter('kakak', 'kating');
                      game.overlays.remove('GameUI');
                      game.overlays.add('Story');
                    },
                    onInfoPressed: () {
                      debugPrint("Info button pressed");
                    },
                  ),
                  LevelCard(
                    image: Image.asset('assets/images/TEMP.jpg'),
                    title: "Level 1 - Pengenalan Pemrograman",
                    status: CardStatus.unlocked,
                    onStartPressed: () {
                      debugPrint("Start button pressed");
                    },
                    onInfoPressed: () {
                      debugPrint("Info button pressed");
                    },
                  ),
                  LevelCard(
                    image: Image.asset('assets/images/TEMP.jpg'),
                    title: "Level 1 - Pengenalan Pemrograman",
                    status: CardStatus.locked,
                    onStartPressed: () {
                      debugPrint("Start button pressed");
                    },
                    onInfoPressed: () {
                      debugPrint("Info button pressed");
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
