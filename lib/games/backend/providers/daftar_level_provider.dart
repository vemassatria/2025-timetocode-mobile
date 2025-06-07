import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/controllers/daftar_level_controller.dart';
import 'package:timetocode/games/backend/providers/shared_preferences_provider.dart';

final completedLevelProvider =
    StateNotifierProvider<CompletedLevelNotifier, int>((ref) {
      final prefs = ref.read(sharedPrefsProvider);
      return CompletedLevelNotifier(prefs);
    });
