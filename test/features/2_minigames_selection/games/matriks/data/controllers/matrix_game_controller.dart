import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/config/routes/app_route.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/models/matrix_level_model.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/providers/matrix_level_provider.dart';

final matrixGameControllerProvider = StateNotifierProvider.autoDispose
    .family<MatrixGameController, MatrixGameState, int>((
  ref,
  levelNumber,
) {
  final bankAsyncValue = ref.watch(matrixQuestionBankProvider);

  if (bankAsyncValue is! AsyncData) {
    return MatrixGameController(ref, [], levelNumber);
  }

  final bank = bankAsyncValue.value!;
  List<MatrixLevelModel> levelQuestions;

  switch (levelNumber) {
    case 1: levelQuestions = bank.level1; break;
    case 2: levelQuestions = bank.level2; break;
    case 3: levelQuestions = bank.level3; break;
    case 4: levelQuestions = bank.level4; break;
    case 5: levelQuestions = bank.level5; break;
    default: levelQuestions = bank.level1;
  }

  final shuffled = List<MatrixLevelModel>.from(levelQuestions)..shuffle();
  final selectedQuestions = shuffled.take(3).toList();

  return MatrixGameController(ref, selectedQuestions, levelNumber);
});

List<String> _expandCommands(MatrixLevelModel question) {
  final List<String> steps = [];
  for (final commandModel in question.commands) {
    for (int i = 0; i < commandModel.value; i++) {
      steps.add(commandModel.command.toUpperCase());
    }
  }
  return steps;
}

enum GameStatus { 
  loading, 
  playing, 
  questionWon, 
  questionFailed, 
  levelWon, 
  levelLost, 
  incorrectMove 
}

class MatrixGameState {
  final List<MatrixLevelModel> questions; 
  final int levelNumber;
  final int currentQuestionIndex; 
  
  final List<String> expandedCommands; 

  final int pointerPosition;
  final int currentStepIndex; 
  final int lives;
  final GameStatus status;

  MatrixLevelModel? get currentQuestion {
    if (questions.isEmpty || currentQuestionIndex >= questions.length) {
      return null;
    }
    return questions[currentQuestionIndex];
  }

  MatrixGameState({
    required this.questions,
    required this.levelNumber,
    required this.currentQuestionIndex,
    required this.expandedCommands, 
    required this.pointerPosition,
    required this.currentStepIndex,
    required this.lives,
    required this.status,
  });

  MatrixGameState copyWith({
    List<MatrixLevelModel>? questions,
    int? currentQuestionIndex,
    List<String>? expandedCommands, 
    int? pointerPosition,
    int? currentStepIndex,
    int? lives,
    GameStatus? status,
  }) {
    return MatrixGameState(
      questions: questions ?? this.questions,
      levelNumber: levelNumber,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      expandedCommands: expandedCommands ?? this.expandedCommands, 
      pointerPosition: pointerPosition ?? this.pointerPosition,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      lives: lives ?? this.lives,
      status: status ?? this.status,
    );
  }
}

class MatrixGameController extends StateNotifier<MatrixGameState> {
  final Ref _ref;

  static int _findInitialPointerPosition(MatrixLevelModel level) {
    for (int i = 0; i < level.initialMatrix.length; i++) {
      for (int j = 0; j < level.initialMatrix[i].length; j++) {
        if (level.initialMatrix[i][j] == 1) {
          return i * 3 + j;
        }
      }
    }
    return 0;
  }

  MatrixGameController(this._ref, List<MatrixLevelModel> initialQuestions, int levelNumber)
      : super(
          initialQuestions.isEmpty
              ? MatrixGameState( 
                  questions: [],
                  levelNumber: levelNumber,
                  currentQuestionIndex: 0,
                  expandedCommands: [], 
                  pointerPosition: 0,
                  currentStepIndex: 0,
                  lives: 3,
                  status: GameStatus.loading,
                )
              : MatrixGameState( 
                  questions: initialQuestions,
                  levelNumber: levelNumber,
                  currentQuestionIndex: 0,
                  expandedCommands: _expandCommands(initialQuestions[0]),
                  pointerPosition: _findInitialPointerPosition(initialQuestions[0]),
                  currentStepIndex: 0,
                  lives: 3, 
                  status: GameStatus.playing,
                ),
        );

  void attemptMove(String action) {
    if (state.status != GameStatus.playing || state.currentQuestion == null) return;

    final currentCommands = state.expandedCommands;
    if (state.currentStepIndex >= currentCommands.length) return;

    final expectedAction = currentCommands[state.currentStepIndex];

    if (action.toUpperCase() == expectedAction.toUpperCase()) {
      _movePointer(action); 
      final nextStep = state.currentStepIndex + 1;

      if (nextStep >= currentCommands.length) {
        
        _ref.read(matrixScoreProvider.notifier).state++;
        
        if (state.currentQuestionIndex >= state.questions.length - 1) {
          state = state.copyWith(status: GameStatus.levelWon);
        } else {
          state = state.copyWith(status: GameStatus.questionWon);
        }
      } else {
        state = state.copyWith(currentStepIndex: nextStep);
      }
    } else {
      final newLives = state.lives - 1;
      
      if (newLives <= 0) {
        if (state.currentQuestionIndex >= state.questions.length - 1) {
          state = state.copyWith(lives: 0, status: GameStatus.levelLost);
        } else {
          state = state.copyWith(lives: 0, status: GameStatus.questionFailed);
        }
      } else {
        state = state.copyWith(lives: newLives, status: GameStatus.incorrectMove);
      }
    }
  }

  void retryCurrentQuestion() {
    if (state.currentQuestion == null) return;
    state = state.copyWith(
      pointerPosition: _findInitialPointerPosition(state.currentQuestion!),
      currentStepIndex: 0, 
      status: GameStatus.playing,
    );
  }

  void _moveToNextQuestion() {
    final nextQuestionIndex = state.currentQuestionIndex + 1;
    if (nextQuestionIndex < state.questions.length) {
      final newLevel = state.questions[nextQuestionIndex];
      final newExpandedCommands = _expandCommands(newLevel);

      state = state.copyWith(
        currentQuestionIndex: nextQuestionIndex,
        expandedCommands: newExpandedCommands,
        pointerPosition: _findInitialPointerPosition(newLevel),
        currentStepIndex: 0, 
        status: GameStatus.playing,
        lives: 3, 
      );
    } else {
      if (state.status != GameStatus.levelWon) {
         state = state.copyWith(status: GameStatus.levelLost);
      } else {
      }
    }
  }

  void nextQuestion() {
    _moveToNextQuestion(); 
  }

  void skipQuestion() {
    _moveToNextQuestion(); 
  }

  void exitGame() {
    _ref.read(routerProvider).go('/minigames/matriks');
  }

  void _movePointer(String action) {
    int currentPos = state.pointerPosition;
    int row = currentPos ~/ 3;
    int col = currentPos % 3;
    
    switch (action.toLowerCase()) {
      case "up": row = (row - 1 + 3) % 3; break;
      case "down": row = (row + 1) % 3; break;
      case "left": col = (col - 1 + 3) % 3; break;
      case "right": col = (col + 1) % 3; break;
    }
    
    state = state.copyWith(pointerPosition: row * 3 + col);
  }
}