import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_gameplay_controller.dart';
import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/data/models/drag_and_drop_model.dart';
import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/data/models/drop_zone_model.dart';
import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/data/states/dnd_state.dart';
import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/data/models/draggable_model.dart';

final dndControllerProvider =
    NotifierProvider.autoDispose<DndController, DndState>(DndController.new);

class DndController extends AutoDisposeNotifier<DndState> {
  KeepAliveLink? _keepAliveLink;

  @override
  DndState build() {
    return const DndState();
  }

  void initializeDragAndDrop(String id) {
    _keepAliveLink ??= ref.keepAlive();

    DragAndDropModel dndModel = ref
        .read(storyControllerProvider)
        .activeLevel!
        .dragAndDrop!
        .firstWhere((dnd) => dnd.id == id);

    state = DndState(
      currentDragAndDrop: dndModel,
      availableOptions: List.from(dndModel.draggableOptions),
      dropZones: List.from(dndModel.dropZones),
    );
  }

  void dropItem(String targetZoneId, String droppedOptionId) {
    final newOptions = List<DraggableModel>.from(state.availableOptions!);
    final newZones = List<DropZoneModel>.from(state.dropZones!);

    DraggableModel? droppedItem;
    int? sourceZoneIndex;

    final sourceOptionIndex = newOptions.indexWhere(
      (opt) => opt.id == droppedOptionId,
    );

    if (sourceOptionIndex != -1) {
      droppedItem = newOptions.removeAt(sourceOptionIndex);
    } else {
      sourceZoneIndex = newZones.indexWhere(
        (z) => z.contentDraggable?.id == droppedOptionId,
      );
      if (sourceZoneIndex != -1) {
        droppedItem = newZones[sourceZoneIndex].contentDraggable;
        newZones[sourceZoneIndex] = newZones[sourceZoneIndex].copyWith(
          contentDraggable: null,
        );
      }
    }

    if (targetZoneId == 'options_area') {
      newOptions.add(droppedItem!);
    } else {
      final targetZoneIndex = newZones.indexWhere((z) => z.id == targetZoneId);
      if (targetZoneIndex != -1) {
        final displacedItem = newZones[targetZoneIndex].contentDraggable;

        if (displacedItem != null) {
          if (sourceZoneIndex != null) {
            newZones[sourceZoneIndex] = newZones[sourceZoneIndex].copyWith(
              contentDraggable: displacedItem,
            );
          } else {
            newOptions.add(displacedItem);
          }
        }

        newZones[targetZoneIndex] = newZones[targetZoneIndex].copyWith(
          contentDraggable: droppedItem,
        );
      }
    }

    state = state.copyWith(availableOptions: newOptions, dropZones: newZones);
  }

  bool validateAnswer() {
    final userSequence = state.dropZones;
    final correctSequence = state.currentDragAndDrop!.correctSequence;

    for (int i = 0; i < userSequence!.length; i++) {
      if (userSequence[i].contentDraggable?.id != correctSequence[i]) {
        wrongAnswer();
        return false;
      }
    }
    correctAnswer();
    return true;
  }

  void finalizeDragAndDrop() {
    if (state.currentDragAndDrop!.nextType == 'dnd') {
      initializeDragAndDrop(state.currentDragAndDrop!.id);
    } else {
      ref
          .read(storyControllerProvider.notifier)
          .navigateMode(
            state.currentDragAndDrop!.nextType,
            state.currentDragAndDrop!.next,
          );
      releaseKeepAlive();
    }
  }

  void correctAnswer() {
    ref.read(storyControllerProvider.notifier).correctAnswer();
  }

  void wrongAnswer() {
    ref.read(storyControllerProvider.notifier).wrongAnswer();
  }

  void releaseKeepAlive() {
    _keepAliveLink!.close();
    _keepAliveLink = null;
  }
}
