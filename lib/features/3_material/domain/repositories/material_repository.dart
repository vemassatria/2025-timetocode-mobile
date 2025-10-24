import 'package:timetocode/features/3_material/data/models/material_model.dart';

abstract class MaterialRepository {
  Future<MaterialModel> getMaterial();
  Future<List<MaterialModel>> getAllMaterial(); // baru
}
