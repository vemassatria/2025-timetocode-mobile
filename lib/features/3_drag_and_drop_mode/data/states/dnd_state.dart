import 'package:timetocode/features/3_drag_and_drop_mode/data/models/drag_and_drop_model.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/models/draggable_model.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/models/drop_zone_model.dart';

class DndState {
  final DragAndDropModel? currentDragAndDrop;
  final List<DraggableModel> availableOptions;
  final List<DropZoneModel> dropZones;
  final String? modeGame;

  final int? correctAnswer;
  final int? wrongAnswer;

  DndState({
    this.currentDragAndDrop,
    this.availableOptions = const [],
    this.dropZones = const [],
    this.modeGame,
    this.correctAnswer,
    this.wrongAnswer,
  });

  DndState copyWith({
    DragAndDropModel? currentDragAndDrop,
    List<DraggableModel>? availableOptions,
    List<DropZoneModel>? dropZones,
    String? modeGame,
    int? correctAnswer,
    int? wrongAnswer,
  }) {
    return DndState(
      currentDragAndDrop: currentDragAndDrop ?? this.currentDragAndDrop,
      availableOptions: availableOptions ?? this.availableOptions,
      dropZones: dropZones ?? this.dropZones,
      modeGame: modeGame ?? this.modeGame,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      wrongAnswer: wrongAnswer ?? this.wrongAnswer,
    );
  }
}
