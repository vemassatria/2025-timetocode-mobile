import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/3_lessons/controllers/lesson_controller.dart';
import 'package:timetocode/features/3_lessons/services/repositories/lesson_repository.dart';
import 'package:timetocode/features/3_lessons/services/datasources/lesson_local_datasource.dart';
import 'package:timetocode/features/3_lessons/services/repositories/lesson_repository_impl.dart';
import 'package:timetocode/features/3_lessons/states/lesson_state.dart';

final lessonLocalDataSourceProvider = Provider<LessonLocalDataSource>(
  (ref) => const LessonLocalDataSourceImpl(),
);

final lessonRepositoryProvider = Provider<LessonRepository>(
  (ref) => LessonRepositoryImpl(ref.read(lessonLocalDataSourceProvider)),
);

final lessonControllerProvider =
    StateNotifierProvider<LessonController, LessonState>(
      (ref) =>
          LessonController(repo: ref.read(lessonRepositoryProvider))..load(),
    );
