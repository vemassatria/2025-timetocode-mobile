import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/5_matriks/data/models/matrix_level_model.dart';
import 'package:timetocode/features/5_matriks/data/models/matrix_command_model.dart';


// --- State Provider ---
final matrixGameControllerProvider =
    StateNotifierProvider.autoDispose<MatrixGameController, MatrixGameState>(
  // Kita akan load level pertama secara default.
  // Nantinya ini bisa diubah untuk menerima levelId secara dinamis.
  (ref) => MatrixGameController(dummyLevel1),
);

// --- State Model ---
enum GameStatus { playing, levelWon, levelLost, incorrectMove }

class MatrixGameState {
  final MatrixLevelModel level;
  final int pointerPosition;
  final int currentStepIndex; // Melacak sudah sampai gerakan ke berapa
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

// --- Controller ---
class MatrixGameController extends StateNotifier<MatrixGameState> {
  MatrixGameController(MatrixLevelModel initialLevel)
      : super(MatrixGameState(
          level: initialLevel,
          pointerPosition: initialLevel.initialPointerPosition,
          currentStepIndex: 0,
          lives: 3,
          status: GameStatus.playing,
        ));

  // Fungsi ini dipanggil dari UI setiap kali user melakukan swipe
  void attemptMove(String action) {
    if (state.status != GameStatus.playing) return;

    final expectedAction = state.level.commands[state.currentStepIndex].action;

    if (action == expectedAction) {
      // --- GERAKAN BENAR ---
      _movePointer(action); // Pindahkan pointer
      final nextStep = state.currentStepIndex + 1;

      if (nextStep >= state.level.commands.length) {
        // Level Selesai!
        state = state.copyWith(currentStepIndex: nextStep, status: GameStatus.levelWon);
      } else {
        // Lanjut ke gerakan berikutnya
        state = state.copyWith(currentStepIndex: nextStep);
      }
    } else {
      // --- GERAKAN SALAH ---
      final newLives = state.lives - 1;
      state = state.copyWith(status: GameStatus.incorrectMove, lives: newLives);

      if (newLives <= 0) {
        // Nyawa habis, level gagal
        Future.delayed(const Duration(milliseconds: 500), () {
          state = state.copyWith(status: GameStatus.levelLost);
        });
      }
    }
  }

  // Mengembalikan game ke kondisi awal di level ini setelah salah
  void retryLevelAfterMistake() {
    state = state.copyWith(
      pointerPosition: state.level.initialPointerPosition,
      currentStepIndex: 0,
      status: GameStatus.playing,
    );
  }

  // Pindah ke level selanjutnya (bisa dipanggil dari popup)
  void nextLevel() {
    // TODO: Implementasi logika untuk memuat level berikutnya
    print("Memuat level selanjutnya...");
  }

  void _movePointer(String action) {
    int currentPos = state.pointerPosition;
    int row = currentPos ~/ 3;
    int col = currentPos % 3;

    switch (action) {
      case "up": row = (row - 1 + 3) % 3; break;
      case "down": row = (row + 1) % 3; break;
      case "left": col = (col - 1 + 3) % 3; break;
      case "right": col = (col + 1) % 3; break;
    }
    state = state.copyWith(pointerPosition: row * 3 + col);
  }
}

final dummyLevel1 = MatrixLevelModel(
  levelId: 1,
  code: "for i in range(3):\n  go right\nfor j in range(2):\n  go down\ngo left",
  initialPointerPosition: 0,
  targetPointerPosition: 7,
  commands: [
    const MatrixCommandModel(type: "action", action: "right"),
    const MatrixCommandModel(type: "action", action: "right"),
    const MatrixCommandModel(type: "action", action: "right"),
    const MatrixCommandModel(type: "action", action: "down"),
    const MatrixCommandModel(type: "action", action: "down"),
    const MatrixCommandModel(type: "action", action: "left"),
  ],
);