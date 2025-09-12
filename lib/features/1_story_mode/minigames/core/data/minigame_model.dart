import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/0_core/models/question_model.dart';
import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/data/models/drag_and_drop_model.dart';

part 'minigame_model.freezed.dart';
part 'minigame_model.g.dart';

@freezed
abstract class MinigameModel with _$MinigameModel {
  const factory MinigameModel({
    List<QuestionModel>? questions,
    List<DragAndDropModel>? dragAndDrop,
  }) = _MinigameModel;

  factory MinigameModel.fromJson(Map<String, dynamic> json) =>
      _$MinigameModelFromJson(json);
}
