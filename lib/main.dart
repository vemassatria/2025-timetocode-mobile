import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:timetocode/components/box/dialog_box.dart';
import 'package:timetocode/components/cerita/intro.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/components/cerita/end_game_page.dart';
import 'package:timetocode/pages/main_navigation.dart';
import 'package:timetocode/components/cerita/story.dart';
import 'package:timetocode/themes/app_themes.dart';
import 'package:timetocode/components/cerita/question_box_widget.dart';
import 'package:timetocode/SFX/music_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MusicService.init();
  runApp(const MyApp());
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
          'GameUI': (_, game) => MainNavigation(game: game),
          'Story': (_, game) => StoryPage(game: game),
          'Intro': (_, game) => IntroBoxWidget(game: game),
          'DialogueBox': (_, game) => DialogBox(game: game),
          'QuestionBox': (_, game) => QuestionBoxWidget(game: game),
          'EndGame': (_, game) => EndGameScreen(game: game),
        },
        initialActiveOverlays: const ['GameUI'],
      ),
    );
  }
}
