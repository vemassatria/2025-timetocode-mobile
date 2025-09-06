import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/data/models/content_component_model.dart';
import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/data/models/draggable_model.dart';

part 'drop_zone_model.freezed.dart';
part 'drop_zone_model.g.dart';

@freezed
abstract class DropZoneModel with _$DropZoneModel {
  const factory DropZoneModel({
    required String id,
    List<String>? acceptedIds,
    ContentComponentModel? content,
    DraggableModel? contentDraggable,
  }) = _DropZoneModel;

  factory DropZoneModel.fromJson(Map<String, dynamic> json) =>
      _$DropZoneModelFromJson(json);
}
