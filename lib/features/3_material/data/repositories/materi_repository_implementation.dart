import 'package:timetocode/features/3_material/data/datasources/materi_local_datasource.dart';
import 'package:timetocode/features/3_material/domain/repositories/materi_repository.dart';
import 'package:timetocode/features/3_material/data/models/materi_model.dart';

class MateriRepositoryImpl implements MateriRepository {
  MateriRepositoryImpl(
    this._local, {
    this.assetPath = 'assets/stories/materi.json',
  });
  final MateriLocalDataSource _local;
  final String assetPath;

  @override
  Future<MateriModel> getMateri() => _local.loadOneMateriFromAssets(assetPath);

  @override
  Future<List<MateriModel>> getAllMateri() =>
      _local.loadAllMateriFromAssets(assetPath); // baru
}
