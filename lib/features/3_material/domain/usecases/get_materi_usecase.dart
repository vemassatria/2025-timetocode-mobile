import 'package:timetocode/features/3_material/domain/repositories/materi_repository.dart';
import 'package:timetocode/features/3_material/data/models/materi_model.dart';

class GetMateriUseCase {
  const GetMateriUseCase(this._repo);
  final MateriRepository _repo;

  Future<MateriModel> call() => _repo.getMateri();
}
