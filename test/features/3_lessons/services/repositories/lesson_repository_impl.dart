import 'package:timetocode/features/3_lessons/data/models/lesson_model.dart';
import 'package:timetocode/features/3_lessons/services/repositories/lesson_repository.dart';
import 'package:timetocode/features/3_lessons/services/datasources/lesson_local_datasource.dart';

class LessonRepositoryImpl implements LessonRepository {
  LessonRepositoryImpl(this._local);
  final LessonLocalDataSource _local;

  @override
  Future<List<LessonModel>> getAllLessons() {
    return _local.getAll();
  }

  @override
  Future<LessonModel?> getLesson(int level) async {
    try {
      final all = await _local.getAll();
      return all.firstWhere((e) => e.level == level);
    } catch (_) {
      return null;
    }
  }
}
