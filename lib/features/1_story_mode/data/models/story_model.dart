import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/0_core/models/question_model.dart';
import 'package:timetocode/features/1_story_mode/data/models/dialog_model.dart';
import 'package:timetocode/features/1_story_mode/data/models/predialog_model.dart';
import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/data/models/drag_and_drop_model.dart';

part 'story_model.freezed.dart';
part 'story_model.g.dart';

@freezed
abstract class StoryModel with _$StoryModel {
  const factory StoryModel({
    required int level,
    required String description,
    required String title,
    required String background,
    required String character1,
    required String character2,
    required List<String> character1Images,
    required List<String> character2Images,
    required List<String> ilustrations,
    List<PreDialogModel>? preDialog,
    required List<DialogModel> dialogs,
    required List<QuestionModel> questions,
    List<DragAndDropModel>? dragAndDrop,
    List<String>? summary,
    required String start,
    required String typeStart,
  }) = _StoryModel;

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);
}
