import 'package:timetocode/games/models/choices_model.dart';

class QuestionModel {
  final String id;
  final String question;
  final List<ChoicesModel> choices;

  QuestionModel({
    required this.id,
    required this.question,
    required this.choices,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'] as String? ?? '',
      question: json['question'] as String? ?? '',
      choices:
          (json['choices'] as List)
              .map((c) => ChoicesModel.fromJson(c as Map<String, dynamic>))
              .toList(),
    );
  }

  List<String> getChoices() {
    return choices.map((choice) => choice.text).toList();
  }

  String getCorrectAnswer() {
    return choices.firstWhere((choice) => choice.isCorrect == true).text;
  }
}
