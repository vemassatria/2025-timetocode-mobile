import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/data/models/drag_and_drop_model.dart';
import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/data/models/draggable_model.dart';
import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/data/models/drop_zone_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dnd_state.freezed.dart';

@freezed
abstract class DndState with _$DndState {
  const factory DndState({
    DragAndDropModel? currentDragAndDrop,
    List<DraggableModel>? availableOptions,
    List<DropZoneModel>? dropZones,

    bool? isLoading,
  }) = _DndState;
}
