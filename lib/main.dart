import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/components/box/dialog_box.dart';
import 'package:timetocode/components/cerita/intro.dart';
import 'package:timetocode/components/skip_button.dart';
import 'package:timetocode/games/backend/game_engine.dart';
import 'package:timetocode/games/backend/providers/music_service_provider.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/pages/challenge/end_game.dart';
import 'package:timetocode/pages/challenge/quiz_page.dart';
import 'package:timetocode/pages/main_tabs/end_game_page.dart';
import 'package:timetocode/games/backend/providers/shared_preferences_provider.dart';
import 'package:timetocode/pages/main_navigation.dart';
import 'package:timetocode/components/cerita/story.dart';
import 'package:timetocode/games/backend/providers/game_provider.dart';
import 'package:timetocode/themes/app_themes.dart';
import 'package:timetocode/components/cerita/question_box_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [sharedPrefsProvider.overrideWithValue(prefs)],
  );

  await container.read(musicServiceProvider.notifier).initialize();
  await container.read(soundEffectServiceProvider.notifier).initialize();

  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
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
          // Overlays utama
          'GameUI': (_, __) => MainNavigation(),

          // Story overlays
          'StoryMenu': (_, __) => StoryPage(),
          'StorySkip': (_, __) => SkipButton(),
          'Intro': (_, __) => IntroBoxWidget(),
          'Dialog': (_, __) => DialogBox(),
          'Question': (_, __) => QuestionBoxWidget(),
          'EndGame': (_, __) => EndGameScreen(),

          // challenge overlays
          'Challenge': (_, __) => QuizPage(),
          'ChallengeEnd': (_, __) => EndGameChallenge(),
        },
        initialActiveOverlays: const ['GameUI'],
      ),
    );
  }
}
