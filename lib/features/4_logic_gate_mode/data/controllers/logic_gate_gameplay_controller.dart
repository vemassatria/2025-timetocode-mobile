import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/config/routes/app_route.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/binary_slot_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/card_slot_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/logic_gate_card_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/logic_gate_type.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/player_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/states/logic_gate_state.dart';

final logicGateControllerProvider =
    NotifierProvider.autoDispose<LogicGateGameplayController, LogicGateState>(
      LogicGateGameplayController.new,
    );

class LogicGateGameplayController extends AutoDisposeNotifier<LogicGateState> {
  KeepAliveLink? _keepAliveLink;

  @override
  LogicGateState build() {
    return const LogicGateState();
  }

  void initializeLogicGateGame() {
    _keepAliveLink ??= ref.keepAlive();

    state = LogicGateState(
      binarySlots: _initializeBinarySlots(15),
      cardSlots: _initializeCardSlots(10),
      player: PlayerModel(id: 1, hand: _getAvailableCards(1), targetValue: 1),
      opponent: PlayerModel(id: 0, hand: _getAvailableCards(2), targetValue: 0),
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
    final binarySlot = state.binarySlots!;
    /*
      Logic for removing card from user's hand
    */
    final cardToMove = user.hand.firstWhere((c) => c.id == cardId);
    final newHand = user.hand.where((c) => c.id != cardId).toList();
    final updatedUser = user.copyWith(hand: newHand);
    /*
      Logic for updating card slots
    */
    final newCardSlots = state.cardSlots!.map((slot) {
      if (slot.id == slotId) {
        return slot.copyWith(placedCard: cardToMove);
      }
      return slot;
    }).toList();
    /*
      Logic for calculating binary slot values based on card placement
    */
    final inputSlotId1 = calculateTopBinarySlotIndex(slotId);
    final inputSlotId2 = inputSlotId1 + 1;

    final value1 = binarySlot
        .firstWhere((slot) => slot.id == inputSlotId1)
        .value!;
    final value2 = binarySlot
        .firstWhere((slot) => slot.id == inputSlotId2)
        .value!;

    final outputSlotId = calculateNextBinarySlotIndex(
      inputSlotId1,
      inputSlotId2,
    );

    final resultValue = cardToMove.type.calculate(value1, value2);

    final newBinarySlot = binarySlot.map((slot) {
      if (slot.id == outputSlotId) {
        return slot.copyWith(value: resultValue);
      }
      return slot;
    }).toList();

    state = state.copyWith(
      cardSlots: newCardSlots,
      binarySlots: newBinarySlot,
      player: isPlayerTurn ? updatedUser : state.player,
      opponent: !isPlayerTurn ? updatedUser : state.opponent,
      currentPlayerId: state.currentPlayerId == 1 ? 0 : 1,
      lastUpdatedCardSlotId: slotId,
    );
  }

  // find next binary slot index based on the previous binary slots
  int calculateNextBinarySlotIndex(int x, int y) {
    final offset = (x - 1) ~/ 4;
    const int fixedOffset = 4;

    return y + fixedOffset - offset;
  }

  // calculate binary slot index (on the top position) based on the card slot index
  int calculateTopBinarySlotIndex(int x) {
    bool isLowerThanEight = x < 8;
    final offset = isLowerThanEight ? (x - 1) ~/ 4 : (x - 1) ~/ 3;
    return x + offset;
  }

  void _releaseKeepAlive() {
    _keepAliveLink!.close();
    _keepAliveLink = null;
  }

  void exit() {
    _releaseKeepAlive();
    ref.read(routerProvider).pop();
  }

  void restart() {
    initializeLogicGateGame();
  }
}
