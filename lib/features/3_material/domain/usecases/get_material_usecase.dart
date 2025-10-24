import 'package:timetocode/features/3_material/domain/repositories/material_repository.dart';
import 'package:timetocode/features/3_material/data/models/material_model.dart';

class GetMaterialUseCase {
  const GetMaterialUseCase(this._repo);
  final MaterialRepository _repo;

  Future<MaterialModel> call() => _repo.getMaterial();
}
