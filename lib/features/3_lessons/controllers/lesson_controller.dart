import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/3_lessons/data/models/lesson_model.dart';
import 'package:timetocode/features/3_lessons/services/repositories/lesson_repository.dart';
import 'package:timetocode/features/3_lessons/states/lesson_state.dart';

class LessonController extends StateNotifier<LessonState> {
  LessonController({required LessonRepository repo})
    : _repo = repo,
      super(const LessonState());

  final LessonRepository _repo;

  Future<void> load() async {
    state = state.copyWith(status: LessonStatus.loading, error: null);
    try {
      final items = await _repo.getAllLessons();
      state = state.copyWith(status: LessonStatus.loaded, items: items);
    } catch (e) {
      state = state.copyWith(status: LessonStatus.failure, error: '$e');
    }
  }

  void select(LessonModel m) => state = state.copyWith(selected: m);
}
