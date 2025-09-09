import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/0_core/models/choices_model.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
abstract class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required String id,
    required String text,
    String? code,
    required List<ChoicesModel> choices,
    Map<String, String>? consequences,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
