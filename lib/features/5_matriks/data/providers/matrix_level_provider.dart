import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/5_matriks/data/models/matrix_level_model.dart';
import 'package:timetocode/features/5_matriks/data/services/matrix_load_service.dart';

final matrixLoadServiceProvider = Provider<MatrixLoadService>((ref) {
  return MatrixLoadService();
});

final matrixLevelsProvider = FutureProvider<List<MatrixLevelModel>>((ref) {
  final matrixService = ref.read(matrixLoadServiceProvider);
  
  return matrixService.loadAllLevels('assets/stories/matriks_kode_levels.json');
});
final matrixScoreProvider = StateProvider<int>((ref) => 0);