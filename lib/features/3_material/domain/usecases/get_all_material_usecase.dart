import 'package:timetocode/features/3_material/data/models/material_model.dart';
import 'package:timetocode/features/3_material/domain/repositories/material_repository.dart';

class GetAllMaterialUseCase {
  const GetAllMaterialUseCase(this._repo);
  final MaterialRepository _repo;

  Future<List<MaterialModel>> call() => _repo.getAllMaterial();
}
