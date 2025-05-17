import 'package:timetocode/games/backend/models/question_model.dart';

class QuestionDifficulty {
  final List<QuestionModel> mudah;
  final List<QuestionModel> sedang;
  final List<QuestionModel> sulit;

  QuestionDifficulty({
    required this.mudah,
    required this.sedang,
    required this.sulit,
  });

  factory QuestionDifficulty.fromJson(Map<String, dynamic> json) {
    return QuestionDifficulty(
      mudah:
          (json['mudah'] as List)
              .map((q) => QuestionModel.fromJson(q as Map<String, dynamic>))
              .toList(),
      sedang:
          (json['sedang'] as List)
              .map((q) => QuestionModel.fromJson(q as Map<String, dynamic>))
              .toList(),
      sulit:
          (json['sulit'] as List)
              .map((q) => QuestionModel.fromJson(q as Map<String, dynamic>))
              .toList(),
    );
  }
}
