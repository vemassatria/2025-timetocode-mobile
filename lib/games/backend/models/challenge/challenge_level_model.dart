import 'package:timetocode/games/backend/models/challenge/question_difficulty_model.dart.dart';
import 'package:timetocode/games/backend/models/drag%20_and_drop/drag_and_drop_question_model.dart';

class ChallengeLevelModel {
  final int id;
  final String levelName;
  final QuestionDifficulty questions;
  final List<DragAndDropModel>? dragAndDrop;

  ChallengeLevelModel({
    required this.id,
    required this.levelName,
    required this.questions,
    this.dragAndDrop,
  });

  factory ChallengeLevelModel.fromJson(Map<String, dynamic> json) {
    return ChallengeLevelModel(
      id: json['id'] as int,
      levelName: json['level_name'] as String,
      questions: QuestionDifficulty.fromJson(json['questions']),
      dragAndDrop:
          json['drag_and_drop'] != null
              ? (json['drag_and_drop'] as List<dynamic>)
                  .map(
                    (dragAndDrop) => DragAndDropModel.fromJson(
                      dragAndDrop as Map<String, dynamic>,
                    ),
                  )
                  .toList()
              : null,
    );
  }

  DragAndDropModel? getDragAndDropById(String id) {
    return dragAndDrop?.firstWhere((drag) => drag.id == id);
  }
}
