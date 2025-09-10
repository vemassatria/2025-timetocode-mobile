import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/app/data/services/hive_service.dart';
import 'package:timetocode/app/data/services/music_service.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/data/providers/shared_preferences_provider.dart';
import 'package:timetocode/app/config/routes/app_route.dart';
import 'package:timetocode/app/config/theme/app_themes.dart';
import 'package:timetocode/app/utils/screen_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  await Hive.initFlutter();

  final consequencesBox = await Hive.openBox<Map<String, int>>('consequences');
  final storyProgressBox = await Hive.openBox<int>('story_progress');
  final challengeProgressBox = await Hive.openBox<int>('challenge_progress');

  final container = ProviderContainer(
    overrides: [
      sharedPrefsProvider.overrideWithValue(prefs),
      hiveProvider.overrideWithValue(
        HiveService(
          consequencesBox: consequencesBox,
          storyProgressBox: storyProgressBox,
          challengeProgressBox: challengeProgressBox,
        ),
      ),
    ],
  );

  await container.read(musicServiceProvider.notifier).initialize();
  await container.read(soundEffectServiceProvider.notifier).initialize();

  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initScreenUtil(context);

    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Time to Code',
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: router,
    );
  }
}
