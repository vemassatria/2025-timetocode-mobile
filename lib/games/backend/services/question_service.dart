import 'package:timetocode/games/backend/models/visual_novel/level_model.dart';
import 'package:timetocode/games/backend/models/question_model.dart';

class QuestionService {
  QuestionModel getQuestionById(LevelModel level, String questionId) {
    return level.questions.firstWhere((question) => question.id == questionId);
  }
}
