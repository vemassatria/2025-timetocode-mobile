import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:timetocode/app/data/services/hive_service.dart';
import 'package:timetocode/app/data/services/music_service.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/config/routes/app_route.dart';
import 'package:timetocode/app/config/theme/app_themes.dart';
import 'package:timetocode/app/utils/screen_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  final futures = [
    Hive.openBox<Map<String, int>>('consequences'),
    Hive.openBox<int>('story_progress'),
    Hive.openBox<int>('challenge_progress'),
    Hive.openBox<bool>('settings'),
  ];

  final results = await Future.wait(futures);

  final container = ProviderContainer(
    overrides: [
      hiveProvider.overrideWithValue(
        HiveService(
          consequencesBox: results[0] as Box<Map<String, int>>,
          storyProgressBox: results[1] as Box<int>,
          challengeProgressBox: results[2] as Box<int>,
          settingsBox: results[3] as Box<bool>,
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
