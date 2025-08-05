import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/app/data/providers/shared_preferences_provider.dart';
import 'package:timetocode/features/2_challenge_mode/data/states/challenge_progress_state.dart';

final challengeProgressProvider = StateNotifierProvider<
  ChallengeProgressNotifier,
  List<ChallengeProgressState>
>((ref) {
  final prefs = ref.read(sharedPrefsProvider);
  return ChallengeProgressNotifier(prefs);
});

class ChallengeProgressNotifier
    extends StateNotifier<List<ChallengeProgressState>> {
  final SharedPreferences _prefs;

  ChallengeProgressNotifier(this._prefs) : super([]) {
    _load();
  }

  Future<void> _load() async {
    final levelCompleted = _prefs.getInt('completedChallengeLevel') ?? 0;
    final List<ChallengeProgressState> completedChallenges = [];
    for (int i = 1; i <= levelCompleted; i++) {
      final stars = _prefs.getInt('completedChallengeStars$i') ?? 0;
      completedChallenges.add(ChallengeProgressState(level: i, stars: stars));
    }
    state = completedChallenges;
  }

  Future<void> setCompletedChallenge(int level, int stars) async {
    final existingChallengeIndex = state.indexWhere(
      (challenge) => challenge.level == level,
    );

    if (existingChallengeIndex != -1) {
      final existingStars = state[existingChallengeIndex].stars;
      if (stars > existingStars) {
        await _prefs.setInt('completedChallengeStars$level', stars);
        state = [
          for (int i = 0; i < state.length; i++)
            if (i == existingChallengeIndex)
              ChallengeProgressState(level: level, stars: stars)
            else
              state[i],
        ];
      }
    } else {
      if (stars != 0 && level == (state.length + 1)) {
        await _prefs.setInt('completedChallengeLevel', level);
        await _prefs.setInt('completedChallengeStars$level', stars);
        state = [...state, ChallengeProgressState(level: level, stars: stars)];
      }
    }
  }
}
