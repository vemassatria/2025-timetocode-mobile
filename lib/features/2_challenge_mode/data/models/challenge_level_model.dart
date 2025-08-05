import 'package:freezed_annotation/freezed_annotation.dart';
import 'question_difficulty_model.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/models/drag_and_drop_model.dart';

part 'challenge_level_model.freezed.dart';
part 'challenge_level_model.g.dart';

@freezed
abstract class ChallengeLevelModel with _$ChallengeLevelModel {
  const factory ChallengeLevelModel({
    required int id,
    required String levelName,
    required QuestionDifficultyModel questions,
    List<DragAndDropModel>? dragAndDrop,
  }) = _ChallengeLevelModel;

  factory ChallengeLevelModel.fromJson(Map<String, dynamic> json) =>
      _$ChallengeLevelModelFromJson(json);
}
