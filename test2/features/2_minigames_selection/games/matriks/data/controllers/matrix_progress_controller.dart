import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/data/services/hive_service.dart';

final matrixProgressProvider =
    StateNotifierProvider<MatrixProgressNotifier, Map<int, int>>((ref) {
  final hiveService = ref.watch(hiveProvider);
  return MatrixProgressNotifier(hiveService);
});

class MatrixProgressNotifier extends StateNotifier<Map<int, int>> {
  final HiveService _hiveService;

  MatrixProgressNotifier(this._hiveService)
      : super(_hiveService.matrixGetProgress());

  Future<void> setCompletedLevel(int level, int stars) async {
    if (stars > (state[level] ?? 0)) {
      await _hiveService.matrixSaveProgress(level, stars);
      state = {...state, level: stars};
    }
  }

  int get highestCompletedLevel {
    if (state.isEmpty) {
      return 0;
    }
    return state.keys.reduce((a, b) => a > b ? a : b);
  }
}

final highestMatrixLevelCompletedProvider = Provider<int>((ref) {
  return ref.watch(matrixProgressProvider.notifier).highestCompletedLevel;
});