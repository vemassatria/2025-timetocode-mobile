import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:timetocode/components/cerita/dialogue.dart';
import 'package:timetocode/components/cerita/intro.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/pages/end_game_page.dart';
import 'package:timetocode/pages/main_navigation.dart';
import 'package:timetocode/pages/story.dart';
import 'package:timetocode/themes/app_themes.dart';
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
          'DialogueBox':
              (_, game) => DialogueBoxWidget(
                dialoguesText: game.currentDialogs,
                onNext: () {
                  game.changeScene('default');
                  game.overlays
                    ..remove('DialogueBox')
                    ..add('EndGame');
                },
              ),
          'Story': (_, game) => StoryPage(game: game),
          'Intro':
              (_, game) => IntroBoxWidget(
                introText: game.preDialogue,
                onNext: () {
                  game.overlays
                    ..remove('Intro')
                    ..add('DialogueBox');
                },
              ),
          'EndGame': (_, game) => EndGameScreen(game: gameEngine),
        },
        initialActiveOverlays: const ['GameUI'],
      ),
    );
  }
}
