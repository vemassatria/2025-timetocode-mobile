import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/binary_slot_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/card_slot_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/logic_gate_card_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/player_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/states/logic_gate_state.dart';

class LogicGateGameplayController extends AutoDisposeNotifier<LogicGateState> {
  KeepAliveLink? _keepAliveLink;

  @override
  LogicGateState build() {
    return LogicGateState();
  }

  void initializeLogicGateGame() {
    _keepAliveLink ??= ref.keepAlive();

    state = LogicGateState(
      binarySlots: _initializeBinarySlots(15),
      cardSlots: _initializeCardSlots(10),
      player: PlayerModel(id: 1, hand: _getAvailableCards(1), targetValue: 0),
      opponent: PlayerModel(id: 2, hand: _getAvailableCards(2), targetValue: 1),
    );
  }

  List<LogicGateCardModel> _getAvailableCards(int playerId) {
    const int numberOfCards = 5;
    const int gateTypeCount = 5;

    final random = Random();
    final availableTypes = LogicGateType.values;

    final int startId = (playerId == 1) ? 1 : (numberOfCards + 1);

    return List.generate(numberOfCards, (index) {
      return LogicGateCardModel(
        id: startId + index,
        type: availableTypes[random.nextInt(gateTypeCount)],
      );
    });
  }

  List<CardSlotModel> _initializeCardSlots(int count) {
    return List.generate(count, (index) {
      return CardSlotModel(id: index + 1);
    });
  }

  List<BinarySlotModel> _initializeBinarySlots(int count) {
    final random = Random();
    return List.generate(count, (index) {
      if (index < 5) {
        return BinarySlotModel(id: index + 1, value: random.nextInt(2));
      }
      return BinarySlotModel(id: index + 1);
    });
  }

  void dropCard(int slotId, int cardId) {
    final isPlayerTurn = state.currentPlayerId == 1;
    final user = isPlayerTurn ? state.player! : state.opponent!;

    final cardToMove = user.hand.firstWhere((c) => c.id == cardId);

    final newHand = user.hand.where((c) => c.id != cardId).toList();

    final newCardSlots = state.cardSlots!.map((slot) {
      if (slot.id == slotId) {
        return slot.copyWith(placedCard: cardToMove);
      }
      return slot;
    }).toList();

    final updatedUser = user.copyWith(hand: newHand);

    state = state.copyWith(
      cardSlots: newCardSlots,
      player: isPlayerTurn ? updatedUser : state.player,
      opponent: !isPlayerTurn ? updatedUser : state.opponent,
      currentPlayerId: state.currentPlayerId == 1 ? 2 : 1,
    );

    updateBinarySlotValue(slotId);
  }

  void updateBinarySlotValue(int cardSlotId) {
    late CardSlotModel cardSlot;
    late int nextBinarySlot;
    final binarySlotIndex = _calculateCardSlotIndex(cardSlotId);

    final binarySlot1 = state.binarySlots![binarySlotIndex];
    final binarySlot2 = state.binarySlots![binarySlotIndex + 1];

    if (binarySlot1.value != null && binarySlot2.value != null) {
      cardSlot = state.cardSlots!.firstWhere((slot) => slot.id == cardSlotId);
      nextBinarySlot = _calculateBinarySlotIndex(
        binarySlotIndex,
        binarySlotIndex + 1,
      );

      int resultValue;
      final value1 = binarySlot1.value!;
      final value2 = binarySlot2.value!;

      switch (cardSlot.placedCard!.type) {
        case LogicGateType.AND:
          resultValue = value1 & value2;
          break;
        case LogicGateType.OR:
          resultValue = value1 | value2;
          break;
        case LogicGateType.NOR:
          resultValue = (value1 | value2) == 0 ? 1 : 0;
          break;
        case LogicGateType.XOR:
          resultValue = value1 ^ value2;
          break;
        case LogicGateType.NAND:
          resultValue = (value1 & value2) == 0 ? 1 : 0;
          break;
      }

      state.binarySlots![nextBinarySlot] = state.binarySlots![nextBinarySlot]
          .copyWith(value: resultValue);
    }
  }

  int _calculateBinarySlotIndex(int x, int y) {
    final offset = (x - 1) ~/ 4;
    const int fixedOffset = 4;

    return y + fixedOffset - offset;
  }

  int _calculateCardSlotIndex(int x) {
    bool isLowerThanEight = x < 8;
    final offset = isLowerThanEight ? (x - 1) ~/ 4 : (x - 1) ~/ 3;
    return x + offset;
  }
}
