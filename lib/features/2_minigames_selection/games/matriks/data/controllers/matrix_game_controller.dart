import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/config/routes/app_route.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/models/matrix_level_model.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/providers/matrix_level_provider.dart';

final matrixGameControllerProvider = StateNotifierProvider.autoDispose
    .family<MatrixGameController, MatrixGameState, MatrixLevelModel>((
      ref,
      level,
    ) {
      return MatrixGameController(ref, level);
    });

enum GameStatus { playing, levelWon, levelLost, incorrectMove }

class MatrixGameState {
  final MatrixLevelModel level;
  final int pointerPosition;
  final int currentStepIndex;
  final int lives;
  final GameStatus status;

  MatrixGameState({
    required this.level,
    required this.pointerPosition,
    required this.currentStepIndex,
    required this.lives,
    required this.status,
  });

  MatrixGameState copyWith({
    int? pointerPosition,
    int? currentStepIndex,
    int? lives,
    GameStatus? status,
  }) {
    return MatrixGameState(
      level: level,
      pointerPosition: pointerPosition ?? this.pointerPosition,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      lives: lives ?? this.lives,
      status: status ?? this.status,
    );
  }
}

class MatrixGameController extends StateNotifier<MatrixGameState> {
  final Ref _ref;

  MatrixGameController(this._ref, MatrixLevelModel initialLevel)
    : super(
        MatrixGameState(
          level: initialLevel,
          pointerPosition: initialLevel.initialPointerPosition,
          currentStepIndex: 0,
          lives: 3,
          status: GameStatus.playing,
        ),
      );

  void attemptMove(String action) {
    if (state.status != GameStatus.playing) return;

    final expectedAction = state.level.commands[state.currentStepIndex].action;

    if (action == expectedAction) {
      _movePointer(action);
      final nextStep = state.currentStepIndex + 1;
      if (nextStep >= state.level.commands.length) {
        _ref.read(matrixScoreProvider.notifier).state++;
        state = state.copyWith(
          currentStepIndex: nextStep,
          status: GameStatus.levelWon,
        );
      } else {
        state = state.copyWith(currentStepIndex: nextStep);
      }
    } else {
      final newLives = state.lives - 1;
      state = state.copyWith(status: GameStatus.incorrectMove, lives: newLives);
      if (newLives <= 0) {
        Future.delayed(const Duration(milliseconds: 500), () {
          state = state.copyWith(status: GameStatus.levelLost);
        });
      }
    }
  }

  void retryLevelAfterMistake() {
    state = state.copyWith(
      pointerPosition: state.level.initialPointerPosition,
      currentStepIndex: 0,
      status: GameStatus.playing,
    );
  }

  void nextLevel() {
    final allLevels = _ref.read(matrixLevelsProvider).asData!.value;
    final currentIndex = allLevels.indexWhere(
      (l) => l.levelId == state.level.levelId,
    );
    final nextIndex = currentIndex + 1;

    if (nextIndex < allLevels.length) {
      final newLevel = allLevels[nextIndex];
      _ref
          .read(routerProvider)
          .pushReplacement('/minigames/matriks/level', extra: newLevel);
    } else {
      exitGame();
    }
  }

  void restartLevel() {
    final currentLevel = state.level;
    state = MatrixGameState(
      level: currentLevel,
      pointerPosition: currentLevel.initialPointerPosition,
      currentStepIndex: 0,
      lives: 3,
      status: GameStatus.playing,
    );
  }

  void exitGame() {
    _ref.read(routerProvider).go('/minigames/matriks');
  }

  void _movePointer(String action) {
    int currentPos = state.pointerPosition;
    int row = currentPos ~/ 3;
    int col = currentPos % 3;
    switch (action) {
      case "up":
        row = (row - 1 + 3) % 3;
        break;
      case "down":
        row = (row + 1) % 3;
        break;
      case "left":
        col = (col - 1 + 3) % 3;
        break;
      case "right":
        col = (col + 1) % 3;
        break;
    }
    state = state.copyWith(pointerPosition: row * 3 + col);
  }
}
