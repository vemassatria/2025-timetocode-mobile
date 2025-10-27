import 'package:timetocode/features/3_lessons/data/models/lesson_model.dart';

abstract class LessonRepository {
  Future<List<LessonModel>> getAllLessons();

  Future<LessonModel?> getLesson(int level);
}
