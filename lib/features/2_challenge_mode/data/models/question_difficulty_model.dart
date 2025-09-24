import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/0_core/models/question_model.dart';

part 'question_difficulty_model.freezed.dart';
part 'question_difficulty_model.g.dart';

@freezed
abstract class QuestionDifficultyModel with _$QuestionDifficultyModel {
  const factory QuestionDifficultyModel({
    required List<QuestionModel> mudah,
    required List<QuestionModel> sedang,
    required List<QuestionModel> susah,
  }) = _QuestionDifficultyModel;

  factory QuestionDifficultyModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionDifficultyModelFromJson(json);
}
