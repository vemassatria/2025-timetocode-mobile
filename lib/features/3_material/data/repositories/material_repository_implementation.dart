import 'package:timetocode/features/3_material/data/datasources/material_local_datasource.dart';
import 'package:timetocode/features/3_material/domain/repositories/material_repository.dart';
import 'package:timetocode/features/3_material/data/models/material_model.dart';

class MaterialRepositoryImpl implements MaterialRepository {
  MaterialRepositoryImpl(
    this._local, {
    this.assetPath = 'assets/stories/material.json',
  });
  final MaterialLocalDataSource _local;
  final String assetPath;

  @override
  Future<MaterialModel> getMaterial() => _local.loadOneMaterialFromAssets(assetPath);

  @override
  Future<List<MaterialModel>> getAllMaterial() =>
      _local.loadAllMaterialFromAssets(assetPath); // baru
}
