import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompletedChallengeState {
  final int level;
  final int stars;

  CompletedChallengeState({required this.level, required this.stars});
}

class CompletedChallengeNotifier
    extends StateNotifier<List<CompletedChallengeState>> {
  final SharedPreferences _prefs;

  CompletedChallengeNotifier(this._prefs) : super([]) {
    _load();
  }

  Future<void> _load() async {
    final levelCompleted = _prefs.getInt('completedChallengeLevel') ?? 0;
    final List<CompletedChallengeState> completedChallenges = [];
    for (int i = 1; i <= levelCompleted; i++) {
      final stars = _prefs.getInt('completedChallengeStars$i') ?? 0;
      completedChallenges.add(CompletedChallengeState(level: i, stars: stars));
    }
    state = completedChallenges;
  }

  Future<void> setCompletedChallenge(int level, int stars) async {
    final existingChallengeIndex = state.indexWhere(
      (challenge) => challenge.level == level,
    );

    if (existingChallengeIndex != -1) {
      // --- Level sudah ada ---
      final existingStars = state[existingChallengeIndex].stars;
      // bapaknya loh rek sampai kaget
      if (stars > existingStars) {
        await _prefs.setInt('completedChallengeStars$level', stars);
        state = [
          for (int i = 0; i < state.length; i++)
            if (i == existingChallengeIndex)
              CompletedChallengeState(level: level, stars: stars)
            else
              state[i],
        ];
      }
    } else {
      // --- Level baru selesai loh ya---
      if (stars != 0 && level == (state.length + 1)) {
        await _prefs.setInt('completedChallengeLevel', level);
        await _prefs.setInt('completedChallengeStars$level', stars);
        state = [...state, CompletedChallengeState(level: level, stars: stars)];
      }
    }
  }
}
