import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/data/services/hive_service.dart';
import 'package:timetocode/features/2_challenge_mode/data/states/challenge_progress_state.dart';

final challengeProgressProvider =
    StateNotifierProvider<
      ChallengeProgressNotifier,
      List<ChallengeProgressState>
    >((ref) {
      final hiveService = ref.watch(hiveProvider);
      return ChallengeProgressNotifier(hiveService);
    });

class ChallengeProgressNotifier
    extends StateNotifier<List<ChallengeProgressState>> {
  final HiveService _hiveService;

  ChallengeProgressNotifier(this._hiveService) : super([]) {
    _load();
  }

  void _load() {
    final allProgress = _hiveService.challengeGetProgress();

    final progressList = allProgress.entries
        .map(
          (entry) =>
              ChallengeProgressState(level: entry.key, stars: entry.value),
        )
        .toList();

    progressList.sort((a, b) => a.level.compareTo(b.level));

    state = progressList;
  }

  Future<void> setCompletedChallenge(int level, int stars) async {
    final existingChallengeIndex = state.indexWhere((c) => c.level == level);

    if (existingChallengeIndex != -1) {
      final existingStars = state[existingChallengeIndex].stars;

      if (stars > existingStars) {
        await _hiveService.challengeSaveProgress(level, stars);

        state = [
          for (final challenge in state)
            if (challenge.level == level)
              challenge.copyWith(stars: stars)
            else
              challenge,
        ];
      }
    } else {
      final highestLevelCompleted = state.isEmpty
          ? 0
          : state.map((c) => c.level).reduce((a, b) => a > b ? a : b);

      if (stars > 0 && level == highestLevelCompleted + 1) {
        await _hiveService.challengeSaveProgress(level, stars);
        final newState = [
          ...state,
          ChallengeProgressState(level: level, stars: stars),
        ];
        newState.sort((a, b) => a.level.compareTo(b.level));
        state = newState;
      }
    }
  }
}
