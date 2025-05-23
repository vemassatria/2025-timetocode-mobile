// completed_challenge_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompletedChallengeNotifier extends StateNotifier<int> {
  final SharedPreferences _prefs;
  CompletedChallengeNotifier(this._prefs) : super(0) {
    _load();
  }

  Future<void> _load() async {
    state = _prefs.getInt('completedChallengeLevel') ?? 0;
  }

  Future<void> setCompletedChallenge(int level, int stars) async {
    await _prefs.setInt('completedChallengeLevel', level);
    await _prefs.setInt('completedChallengeStars$level', stars);
    state = level;
  }

  int getCompletedChallengeStars(int level) {
    return _prefs.getInt('completedChallengeStars$level') ?? 0;
  }
}
