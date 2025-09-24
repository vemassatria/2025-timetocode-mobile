import 'package:timetocode/features/3_logic_gate_mode/data/models/binary_slot_model.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/models/card_slot_model.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/models/logic_gate_card_model.dart';

class AiGameState {
  final List<BinarySlotModel> binarySlots;
  final List<CardSlotModel> cardSlots;
  final List<LogicGateCardModel> player1Hand;
  final List<LogicGateCardModel> player2Hand;
  final int currentPlayerId;

  AiGameState({
    required this.binarySlots,
    required this.cardSlots,
    required this.player1Hand,
    required this.player2Hand,
    required this.currentPlayerId,
  });

  List<List<double>> toVector() {
    final List<double> vector = List.filled(36, 0.0);

    // Binary Slots (index 0-14)
    for (int i = 0; i < 15; i++) {
      vector[i] = binarySlots[i].value?.toDouble() ?? -1.0;
    }

    // Card Slots (index 15-24)
    for (int i = 0; i < 10; i++) {
      final card = cardSlots[i].placedCard;
      vector[15 + i] = card != null ? (card.type.index + 1) / 5.0 : 0.0;
    }

    // Player 1 Hand (index 25-29)
    for (final card in player1Hand) {
      vector[25 + card.type.index] += 1.0 / 5.0;
    }

    // Player 2 (AI) Hand (index 30-34)
    for (final card in player2Hand) {
      vector[30 + card.type.index] += 1.0 / 5.0;
    }

    // 5. Current Player (index 35)
    vector[35] = (currentPlayerId == 1) ? 1.0 : -1.0;

    return [vector];
  }

  List<Map<String, int>> getValidMoves() {
    final List<Map<String, int>> moves = [];
    final hand = (currentPlayerId == 1) ? player1Hand : player2Hand;

    for (final cardSlot in cardSlots) {
      if (cardSlot.placedCard == null) {
        final inputIndices = _getInputBinaryIndices(cardSlot.id);
        final binary1 = binarySlots.firstWhere((s) => s.id == inputIndices[0]);
        final binary2 = binarySlots.firstWhere((s) => s.id == inputIndices[1]);

        if (binary1.value != null && binary2.value != null) {
          final uniqueCardTypesInHand = hand
              .map((c) => c.type.index + 1)
              .toSet();
          for (final cardId in uniqueCardTypesInHand) {
            moves.add({'slot': cardSlot.id, 'card': cardId});
          }
        }
      }
    }
    return moves;
  }

  List<int> _getInputBinaryIndices(int cardSlotId) {
    final topIndex = _calculateTopBinarySlotIndex(cardSlotId);
    return [topIndex, topIndex + 1];
  }

  int _calculateTopBinarySlotIndex(int x) {
    bool isLowerThanEight = x < 8;
    final offset = isLowerThanEight ? (x - 1) ~/ 4 : (x - 1) ~/ 3;
    return x + offset;
  }
}
