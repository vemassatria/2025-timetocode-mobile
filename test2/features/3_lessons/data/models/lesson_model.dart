import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/3_lessons/data/models/content_block_model.dart';

part 'lesson_model.freezed.dart';
part 'lesson_model.g.dart';

@freezed
abstract class LessonModel with _$LessonModel {
  const factory LessonModel({
    required int level,
    required String title,
    required List<ContentBlockModel> content,
    String? videoUrl,
  }) = _LessonModel;

  factory LessonModel.fromJson(Map<String, dynamic> json) =>
      _$LessonModelFromJson(json);

  const LessonModel._();
}
