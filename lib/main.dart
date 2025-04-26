import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:timetocode/games/background.dart';
import 'package:timetocode/pages/end_game_page.dart';
import 'package:timetocode/pages/main_navigation.dart';
import 'package:flame_audio/flame_audio.dart';
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
    final Background background = Background();

    return MaterialApp(
      title: 'TimetoCode',
      themeMode: ThemeMode.dark,
      darkTheme: AppThemes.darkTheme,
      home: GameWidget<Background>(
        game: background,
        overlayBuilderMap: {
          'GameUI': (context, game) => MainNavigation(game: game),
          'EndGame': (context, game) => EndGameScreen(game: game),
        },
        initialActiveOverlays: const ['GameUI'],
      ),
    );
  }
}
