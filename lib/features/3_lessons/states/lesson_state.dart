import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/3_lessons/data/models/lesson_model.dart';

part 'lesson_state.freezed.dart';

enum LessonStatus { initial, loading, loaded, failure }

@freezed
abstract class LessonState with _$LessonState {
  const factory LessonState({
    @Default(LessonStatus.initial) LessonStatus status,
    @Default(<LessonModel>[]) List<LessonModel> items,
    LessonModel? selected,
    String? error,
  }) = _LessonState;
}
