import 'dart:math';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/states/ai_game_state.dart';

enum AiDifficulty { easy, medium, hard }

class AiService {
  Interpreter? _interpreter;

  final Map<AiDifficulty, double> _epsilonValues = {
    AiDifficulty.easy: 0.5,
    AiDifficulty.medium: 0.1,
    AiDifficulty.hard: 0.0001,
  };

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset(
      'assets/ml/logic_gate_ai.tflite',
    );
  }

  Map<String, int>? predictMove({
    required AiGameState gameState,
    required AiDifficulty difficulty,
  }) {
    final validMoves = gameState.getValidMoves();
    if (validMoves.isEmpty) {
      return null;
    }

    // randomness (epsilon-greedy)
    final double epsilon = _epsilonValues[difficulty]!;
    if (Random().nextDouble() < epsilon) {
      return validMoves[Random().nextInt(validMoves.length)];
    }

    final input = gameState.toVector();

    // make output that filled all possibility card placement
    final output = List.filled(1 * 50, 0.0).reshape([1, 50]);

    _interpreter!.run(input, output);

    final List<double> qValues = output[0];

    int? bestActionIndex;
    double maxQValue = -double.infinity;

    // get best action from valid moves
    for (final move in validMoves) {
      final actionIndex = _moveToActionIndex(move);
      if (qValues[actionIndex] > maxQValue) {
        maxQValue = qValues[actionIndex];
        bestActionIndex = actionIndex;
      }
    }

    return bestActionIndex != null ? _actionIndexToMove(bestActionIndex) : null;
  }

  /*
  this function converts a move (slot and card) into a unique action index that can be used for Q-value lookup.
  look at -1 at the code. it is because model used 0(based array first index) and our dart code is 1-based(use its id).
  */
  int _moveToActionIndex(Map<String, int> move) {
    final int slot = move['slot']!; // Slot ID (1-10)
    final int cardId = move['card']!; // Card ID (1-5)
    return (slot - 1) * 5 + (cardId - 1);
  }

  /*
  same as above, + 1 is because model used 0(based array first index) and our dart code is 1-based(use its id).
  */
  Map<String, int> _actionIndexToMove(int index) {
    final int slot = (index ~/ 5) + 1;
    final int card = (index % 5) + 1;
    return {'slot': slot, 'card': card};
  }

  void dispose() {
    _interpreter?.close();
  }
}
