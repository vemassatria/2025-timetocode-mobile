import 'package:flutter/material.dart';
import 'package:timetocode/games/game_engine.dart';

class StoryPage extends StatelessWidget {
  final GameEngine game;
  const StoryPage({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Teks atau dialog cerita
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                '“Di suatu hari yang cerah…”,\nselamat datang di babak pertama!',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                game.overlays.remove('Story');
                game.changeScene('default');
                game.removeStory();
                game.overlays.add('GameUI');
              },
              child: const Text('Mulai'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                game.changeCharacter(1, "crush");
              },
              child: const Text('ganti karakter 1'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                game.activeCharacter(1);
              },
              child: const Text('mc bicara'),
            ),

            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                game.activeCharacter(2);
              },
              child: const Text('lawan bicara'),
            ),
            ElevatedButton(
              onPressed: () {
                game.normalCharacters(1);
              },
              child: const Text('normalkan karakter(mc selesai bicara)'),
            ),
            ElevatedButton(
              onPressed: () {
                game.normalCharacters(2);
              },
              child: const Text('normalkan karakter(lawan selesai bicara)'),
            ),
          ],
        ),
      ),
    );
  }
}
