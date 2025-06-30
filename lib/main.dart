import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/games/backend/providers/music_service_provider.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/games/backend/providers/shared_preferences_provider.dart';
import 'package:timetocode/routes/app_route.dart';
import 'package:timetocode/themes/app_themes.dart';
import 'package:timetocode/utils/screen_utils.dart';

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
