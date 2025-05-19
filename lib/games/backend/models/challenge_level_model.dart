import 'package:timetocode/games/backend/models/question_difficulty_model.dart.dart';

class ChallengeLevelModel {
  final String id;
  final String levelName;
  final QuestionDifficulty questions;

  ChallengeLevelModel({
    required this.id,
    required this.levelName,
    required this.questions,
  });

  factory ChallengeLevelModel.fromJson(Map<String, dynamic> json) {
    return ChallengeLevelModel(
      id: json['id'] as String,
      levelName: json['level_name'] as String,
      questions: QuestionDifficulty.fromJson(json['questions']),
    );
  }
}
