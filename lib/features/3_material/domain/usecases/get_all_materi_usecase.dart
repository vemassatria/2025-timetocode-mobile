import 'package:timetocode/features/3_material/data/models/materi_model.dart';
import 'package:timetocode/features/3_material/domain/repositories/materi_repository.dart';

class GetAllMateriUseCase {
  const GetAllMateriUseCase(this._repo);
  final MateriRepository _repo;

  Future<List<MateriModel>> call() => _repo.getAllMateri();
}
