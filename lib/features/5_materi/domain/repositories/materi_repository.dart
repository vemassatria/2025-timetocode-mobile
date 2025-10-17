import 'package:timetocode/features/5_materi/data/models/materi_model.dart';

abstract class MateriRepository {
  Future<MateriModel> getMateri();
  Future<List<MateriModel>> getAllMateri(); // baru
}
