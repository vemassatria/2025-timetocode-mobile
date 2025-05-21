import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/components/box/dialog_box.dart';
import 'package:timetocode/components/cerita/intro.dart';
import 'package:timetocode/games/backend/game_engine.dart';
import 'package:timetocode/components/cerita/end_game_page.dart';
import 'package:timetocode/games/backend/providers/shared_preferences_provider.dart';
import 'package:timetocode/pages/main_navigation.dart';
import 'package:timetocode/components/cerita/story.dart';
import 'package:timetocode/games/backend/providers/game_provider.dart';
import 'package:timetocode/themes/app_themes.dart';
import 'package:timetocode/components/cerita/question_box_widget.dart';
import 'package:timetocode/games/backend/services/music_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MusicService.init();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [sharedPrefsProvider.overrideWithValue(prefs)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  static final gameWidgetKey =
      GlobalKey<RiverpodAwareGameWidgetState<GameEngine>>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.read(gameEngineProvider);
    return MaterialApp(
      title: 'Time to Code',
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      home: RiverpodAwareGameWidget<GameEngine>(
        game: game,
        key: gameWidgetKey,
        overlayBuilderMap: {
          'GameUI': (_, __) => MainNavigation(),
          'StoryMenu': (_, __) => StoryPage(),
          'Intro': (_, __) => IntroBoxWidget(),
          'Dialog': (_, __) => DialogBox(),
          'Question': (_, __) => QuestionBoxWidget(),
          'EndGame': (_, __) => EndGameScreen(),
        },
        initialActiveOverlays: const ['GameUI'],
      ),
    );
  }
}
