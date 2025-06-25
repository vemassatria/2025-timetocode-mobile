import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/controllers/challenge/daftar_challenge_controller.dart';
import 'package:timetocode/games/backend/providers/shared_preferences_provider.dart';

final completedChallengeProvider =
    StateNotifierProvider<CompletedChallengeNotifier, int>((ref) {
      final prefs = ref.read(sharedPrefsProvider);
      return CompletedChallengeNotifier(prefs);
    });
