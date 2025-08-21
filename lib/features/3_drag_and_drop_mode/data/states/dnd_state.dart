import 'package:timetocode/features/3_drag_and_drop_mode/data/models/drag_and_drop_model.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/models/draggable_model.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/models/drop_zone_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dnd_state.freezed.dart';

@freezed
abstract class DndState with _$DndState {
  const factory DndState({
    DragAndDropModel? currentDragAndDrop,
    List<DraggableModel>? availableOptions,
    List<DropZoneModel>? dropZones,
    String? modeGame,
    int? correctAnswer,
    int? wrongAnswer,

    bool? isLoading,
  }) = _DndState;
}
