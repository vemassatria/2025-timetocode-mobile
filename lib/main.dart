import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/pages/end_game_page.dart';
import 'package:timetocode/pages/main_navigation.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:timetocode/pages/story.dart';
import 'package:timetocode/themes/app_themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlameAudio.bgm.initialize();
  FlameAudio.bgm.play('music/bg_music.mp3');
  runApp(const MyApp());
}

void playMusic(bool value) {
  if (value) {
    FlameAudio.bgm.play('music/bg_music.mp3');
  } else {
    FlameAudio.bgm.stop();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GameEngine gameEngine = GameEngine();

    return MaterialApp(
      title: 'TimetoCode',
      themeMode: ThemeMode.dark,
      darkTheme: AppThemes.darkTheme,
      home: GameWidget<GameEngine>(
        game: gameEngine,
        overlayBuilderMap: {
          'GameUI': (context, game) => MainNavigation(game: game),
          'Story': (context, game) => StoryPage(game: game),
          'EndGame': (context, game) => EndGameScreen(game: game),
        },
        initialActiveOverlays: const ['GameUI'],
      ),
    );
  }
}
