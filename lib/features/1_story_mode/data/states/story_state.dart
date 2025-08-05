import 'package:timetocode/features/0_core/models/question_model.dart';
import 'package:timetocode/features/1_story_mode/data/models/dialog_model.dart';
import 'package:timetocode/features/1_story_mode/data/models/story_model.dart';
import 'package:timetocode/features/1_story_mode/data/models/predialog_model.dart';

class StoryState {
  final StoryModel? activeLevel;
  final PreDialogModel? preDialog;
  final DialogModel? currentDialog;
  final QuestionModel? currentQuestion;
  int? indexDialog;
  int? correctAnswer;
  int? wrongAnswer;
  bool? falsePrevious;
  String? activeMode;

  StoryState({
    this.activeLevel,
    this.preDialog,
    this.currentDialog,
    this.currentQuestion,
    this.indexDialog,
    this.correctAnswer,
    this.wrongAnswer,
    this.falsePrevious,
    this.activeMode,
  });

  static const _sentinel = Object();

  StoryState copyWith({
    Object? activeLevel = _sentinel,
    Object? preDialog = _sentinel,
    Object? currentDialog = _sentinel,
    Object? currentQuestion = _sentinel,
    Object? indexDialog = _sentinel,
    Object? correctAnswer = _sentinel,
    Object? wrongAnswer = _sentinel,
    Object? falsePrevious = _sentinel,
    Object? activeMode = _sentinel,
  }) {
    return StoryState(
      activeLevel:
          activeLevel == _sentinel
              ? this.activeLevel
              : activeLevel as StoryModel?,
      preDialog:
          preDialog == _sentinel
              ? this.preDialog
              : preDialog as PreDialogModel?,
      currentDialog:
          currentDialog == _sentinel
              ? this.currentDialog
              : currentDialog as DialogModel?,
      currentQuestion:
          currentQuestion == _sentinel
              ? this.currentQuestion
              : currentQuestion as QuestionModel?,
      indexDialog:
          indexDialog == _sentinel ? this.indexDialog : indexDialog as int?,
      correctAnswer:
          correctAnswer == _sentinel
              ? this.correctAnswer
              : correctAnswer as int?,
      wrongAnswer:
          wrongAnswer == _sentinel ? this.wrongAnswer : wrongAnswer as int?,
      falsePrevious:
          falsePrevious == _sentinel
              ? this.falsePrevious
              : falsePrevious as bool?,
      activeMode:
          activeMode == _sentinel ? this.activeMode : activeMode as String?,
    );
  }
}
