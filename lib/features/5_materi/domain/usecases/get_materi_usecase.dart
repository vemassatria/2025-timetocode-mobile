import 'package:timetocode/features/5_materi/domain/repositories/materi_repository.dart';
import 'package:timetocode/features/5_materi/data/models/materi_model.dart';

class GetMateriUseCase {
  const GetMateriUseCase(this._repo);
  final MateriRepository _repo;

  Future<MateriModel> call() => _repo.getMateri();
}
