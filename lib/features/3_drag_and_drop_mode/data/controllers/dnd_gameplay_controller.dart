import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/2_challenge_mode/data/controllers/challenge_gameplay_controller.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_gameplay_controller.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/states/dnd_state.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/models/draggable_model.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/models/drop_zone_model.dart';
import 'package:timetocode/app/config/routes/app_route.dart';

class DndController extends AutoDisposeNotifier<DndState> {
  KeepAliveLink? _keepAliveLink;
  @override
  DndState build() {
    return DndState();
  }

  void initializeDragAndDrop(String id, String modeGame) {
    _keepAliveLink ??= ref.keepAlive();

    if (modeGame == 'challenge') {
      final challenge = ref.read(challengeControllerProvider);
      final dnd = challenge.currentLevel!.dragAndDrop!.firstWhere(
        (dnd) => dnd.id == id,
      );
      state = DndState(
        currentDragAndDrop: dnd,
        availableOptions: dnd.draggableOptions,
        dropZones: dnd.dropZones,
        modeGame: modeGame,
        correctAnswer: ref.read(challengeControllerProvider).correctAnswer,
        wrongAnswer: ref.read(challengeControllerProvider).wrongAnswer,
      );
    } else if (modeGame == 'story') {
      final dnd = ref
          .read(storyControllerProvider)
          .activeLevel!
          .dragAndDrop!
          .firstWhere((dnd) => dnd.id == id);
      state = DndState(
        currentDragAndDrop: dnd,
        availableOptions: dnd.draggableOptions,
        dropZones: dnd.dropZones,
        modeGame: modeGame,
        correctAnswer: ref.read(storyControllerProvider).correctAnswer,
        wrongAnswer: ref.read(storyControllerProvider).wrongAnswer,
      );
    }
  }

  void dropItem(String targetZoneId, String droppedOptionId) {
    final currentOptions = List<DraggableModel>.from(state.availableOptions);
    final currentZones = List<DropZoneModel>.from(state.dropZones);

    DraggableModel? droppedItem;

    // Mencari index item yang di-drop di dek zone opsi
    int sourceOptionIndex = currentOptions.indexWhere(
      (opt) => opt.id == droppedOptionId,
    );
    int? sourceZoneIndex;
    if (sourceOptionIndex != -1) {
      droppedItem = currentOptions.removeAt(sourceOptionIndex);
    } else {
      // Mencari item yang di-drop di drop zone
      sourceZoneIndex = currentZones.indexWhere(
        (zone) => zone.contentDraggable?.id == droppedOptionId,
      );
      droppedItem = currentZones[sourceZoneIndex].contentDraggable;
      currentZones[sourceZoneIndex].contentDraggable = null;
    }

    // Tempatkan item ke dek zone utama
    if (targetZoneId == 'options_area') {
      currentOptions.add(droppedItem!);
    } else {
      // Pindah ke drop zone
      int targetZoneIndex = currentZones.indexWhere(
        (zone) => zone.id == targetZoneId,
      );
      // Jika ada item di target, kembalikan ke options
      final displacedItem = currentZones[targetZoneIndex].contentDraggable;
      if (displacedItem != null) {
        if (sourceZoneIndex != null) {
          currentZones[sourceZoneIndex].contentDraggable = displacedItem;
        } else {
          currentOptions.add(displacedItem);
        }
      }
      // Tempatkan item yang baru
      currentZones[targetZoneIndex].contentDraggable = droppedItem;
    }

    state = state.copyWith(
      availableOptions: currentOptions,
      dropZones: currentZones,
    );
  }

  bool validateAnswer() {
    final userSequence = state.dropZones;
    final correctSequence = state.currentDragAndDrop!.correctSequence;

    for (int i = 0; i < userSequence.length; i++) {
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
        ref.read(routerProvider).go('/tantangan/level');
        break;
      case 'story':
        ref.read(storyControllerProvider.notifier).restartStory();
        ref.read(routerProvider).go('/pembelajaran/level');
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
    ref.read(routerProvider).pop();
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
