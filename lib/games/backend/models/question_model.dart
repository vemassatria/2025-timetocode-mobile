import 'package:timetocode/games/backend/models/choices_model.dart';

class QuestionModel {
  final String id;
  final String question;
  final String code;
  final List<ChoicesModel> choices;

  QuestionModel({
    required this.id,
    required this.question,
    required this.choices,
    required this.code,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'] as String? ?? '',
      question: json['text'] as String? ?? '',
      code: json['code'] as String? ?? '',
      choices:
          (json['choices'] as List)
              .map((c) => ChoicesModel.fromJson(c as Map<String, dynamic>))
              .toList(),
    );
  }
}
