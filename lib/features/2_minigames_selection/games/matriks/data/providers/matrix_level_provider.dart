import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/models/matrix_level_model.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/services/matrix_load_service.dart';

final matrixLoadServiceProvider = Provider<MatrixLoadService>((ref) {
  return MatrixLoadService();
});

final matrixLevelsProvider = FutureProvider<List<MatrixLevelModel>>((ref) {
  final matrixService = ref.read(matrixLoadServiceProvider);
  
  return matrixService.loadAllLevels('assets/stories/matriks_kode_levels.json');
});
final matrixScoreProvider = StateProvider<int>((ref) => 0);