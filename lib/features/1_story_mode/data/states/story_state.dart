import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/0_core/models/question_model.dart';
import 'package:timetocode/features/1_story_mode/data/models/dialog_model.dart';
import 'package:timetocode/features/1_story_mode/data/models/predialog_model.dart';
import 'package:timetocode/features/1_story_mode/data/models/story_model.dart';

part 'story_state.freezed.dart';

@freezed
abstract class StoryState with _$StoryState {
  const factory StoryState({
    StoryModel? activeLevel,
    PreDialogModel? preDialog,
    DialogModel? currentDialog,
    QuestionModel? currentQuestion,
    int? indexDialog,
    int? correctAnswer,
    int? wrongAnswer,
    bool? falsePrevious,
    String? activeMode,

    bool? isLoading,
  }) = _StoryState;
}
