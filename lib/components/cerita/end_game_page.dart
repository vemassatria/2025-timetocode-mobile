import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:timetocode/providers/game_provider.dart';
import 'package:timetocode/themes/typography.dart';

class EndGameScreen extends ConsumerWidget {
  const EndGameScreen({super.key});

  Future<void> _saveCompletedLevel(int level) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('completedLevel', level);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.read(gameEngineProvider);
    final correctAnswer = game.correctAnswer;
    final wrongAnswer = game.wrongAnswer;
    final totalAnswer = correctAnswer + wrongAnswer;
    final totalSteps = game.levels.length;
    final completedLevel = game.activeLevel + 1;
    final maxLevel = game.levels.length;
    _saveCompletedLevel(completedLevel);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularStepProgressIndicator(
              circularDirection: CircularDirection.counterclockwise,
              totalSteps: totalSteps,
              currentStep: completedLevel,
              stepSize: 20,
              selectedColor: const Color.fromRGBO(0, 200, 83, 1),
              unselectedColor: const Color.fromRGBO(255, 255, 255, 0.498),
              height: 300,
              width: 300,
              child: Center(
                child: Text(
                  '$completedLevel/$maxLevel',
                  style: AppTypography.heading1().copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Level $completedLevel Selesai',
              style: AppTypography.heading3().copyWith(
                decoration: TextDecoration.none,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.5),
                    offset: const Offset(4, 1),
                  ),
                ],
              ),
              child: TextButton.icon(
                onPressed: () {
                  rangkumanDialog(
                    context,
                    game.levels[game.activeLevel].summary!,
                  );
                },
                icon: const Icon(Icons.chrome_reader_mode, color: Colors.white),
                label: const Text(
                  'Rangkuman',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 150, 70, 215),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                informationCard(
                  context,
                  'Tepat',
                  '$correctAnswer/$totalAnswer',
                  const Color.fromARGB(255, 70, 215, 77),
                ),
                const SizedBox(width: 16),
                informationCard(
                  context,
                  'Salah',
                  '$wrongAnswer/$totalAnswer',
                  const Color.fromARGB(255, 215, 70, 70),
                ),
              ],
            ),
            const SizedBox(height: 82),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextButton(
                onPressed: () {
                  game.overlays.remove('EndGame');
                  game.endGame();
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 112, 183, 255),
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Lanjutkan',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> rangkumanDialog(BuildContext context, List<String> summary) {
    return showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: const Color.fromARGB(255, 20, 26, 58),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
              side: const BorderSide(color: Colors.white, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Rangkuman',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text('$summary', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Ok'),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget informationCard(
    BuildContext context,
    String title,
    String text,
    Color color,
  ) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          SizedBox(
            width: 70,
            height: 40,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: Text(
                text,
                style: AppTypography.heading6().copyWith(
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
