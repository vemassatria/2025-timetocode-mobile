import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/data/models/drop_zone_model.dart';
import 'draggable_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drag_and_drop_model.freezed.dart';
part 'drag_and_drop_model.g.dart';

@freezed
abstract class DragAndDropModel with _$DragAndDropModel {
  const factory DragAndDropModel({
    required String id,
    required String instruction,
    String? scaffoldCode,
    required List<DraggableModel> draggableOptions,
    required List<DropZoneModel> dropZones,
    required List<String> correctSequence,
    String? next,
    String? nextType,
    Map<String, String>? consequences,
  }) = _DragAndDropModel;

  factory DragAndDropModel.fromJson(Map<String, dynamic> json) =>
      _$DragAndDropModelFromJson(json);
}
