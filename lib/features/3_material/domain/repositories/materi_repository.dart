import 'package:timetocode/features/3_material/data/models/materi_model.dart';

abstract class MateriRepository {
  Future<MateriModel> getMateri();
  Future<List<MateriModel>> getAllMateri(); // baru
}
