import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/2_challenge_mode/data/controllers/challenge_gameplay_controller.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_gameplay_controller.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/models/drag_and_drop_model.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/models/drop_zone_model.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/states/dnd_state.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/models/draggable_model.dart';
import 'package:timetocode/app/config/routes/app_route.dart';

class DndController extends AutoDisposeNotifier<DndState> {
  KeepAliveLink? _keepAliveLink;
  @override
  DndState build() {
    return const DndState();
  }

  void initializeDragAndDrop(String id, String modeGame) {
    _keepAliveLink ??= ref.keepAlive();

    DragAndDropModel dndModel;
    int? initialCorrect, initialWrong;

    if (modeGame == 'challenge') {
      final challengeState = ref.read(challengeControllerProvider);
      dndModel = challengeState.currentLevel!.dragAndDrop!.firstWhere(
        (dnd) => dnd.id == id,
      );
      initialCorrect = challengeState.correctAnswer;
      initialWrong = challengeState.wrongAnswer;
    } else {
      final storyState = ref.read(storyControllerProvider);
      dndModel = storyState.activeLevel!.dragAndDrop!.firstWhere(
        (dnd) => dnd.id == id,
      );
      initialCorrect = storyState.correctAnswer;
      initialWrong = storyState.wrongAnswer;
    }

    state = DndState(
      currentDragAndDrop: dndModel,
      availableOptions: List.from(dndModel.draggableOptions),
      dropZones: List.from(dndModel.dropZones),
      modeGame: modeGame,
      correctAnswer: initialCorrect,
      wrongAnswer: initialWrong,
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
    if (state.modeGame == 'challenge') {
      switch (state.currentDragAndDrop!.nextType) {
        case 'question':
          ref
              .read(challengeControllerProvider.notifier)
              .nextQuestion(state.currentDragAndDrop!.next!);
          break;
        case 'dnd':
          initializeDragAndDrop(state.currentDragAndDrop!.next!, "challenge");
          break;
        case null:
          ref.read(challengeControllerProvider.notifier).endgameChallenge();
          break;
      }
    } else {
      if (state.currentDragAndDrop!.nextType == 'dnd') {
        initializeDragAndDrop(state.currentDragAndDrop!.id, 'story');
      } else {
        ref
            .read(storyControllerProvider.notifier)
            .navigateMode(
              state.currentDragAndDrop!.next,
              state.currentDragAndDrop!.nextType,
            );
      }
    }
    if (state.currentDragAndDrop!.nextType != 'dnd') {
      ref.read(routerProvider).pop();
      _releaseKeepAlive();
    }
  }

  void resetDnD() {
    switch (state.modeGame) {
      case 'challenge':
        ref.read(challengeControllerProvider.notifier).restartChallenge();
        break;
      case 'story':
        ref.read(storyControllerProvider.notifier).restartStory();
        break;
    }
    ref.read(routerProvider).pop();
    _releaseKeepAlive();
  }

  void exitDnD() {
    switch (state.modeGame) {
      case 'challenge':
        ref.read(challengeControllerProvider.notifier).exitChallenge();
        break;
      case 'story':
        ref.read(storyControllerProvider.notifier).exitStory();
        break;
    }
    _releaseKeepAlive();
  }

  void correctAnswer() {
    if (state.modeGame == 'challenge') {
      ref.read(challengeControllerProvider.notifier).correctAnswer();
    } else {
      ref.read(storyControllerProvider.notifier).correctAnswer();
    }
  }

  void wrongAnswer() {
    if (state.modeGame == 'challenge') {
      ref.read(challengeControllerProvider.notifier).wrongAnswer();
    } else {
      ref.read(storyControllerProvider.notifier).wrongAnswer();
    }
  }

  void _releaseKeepAlive() {
    _keepAliveLink!.close();
    _keepAliveLink = null;
  }
}

final dndControllerProvider =
    NotifierProvider.autoDispose<DndController, DndState>(DndController.new);
