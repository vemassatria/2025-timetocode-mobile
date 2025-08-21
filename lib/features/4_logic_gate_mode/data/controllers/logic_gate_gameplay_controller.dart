import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/config/routes/app_route.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/binary_slot_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/card_slot_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/logic_gate_card_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/logic_gate_type.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/player_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/services/ai_service.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/states/ai_game_state.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/states/logic_gate_state.dart';

final logicGateControllerProvider =
    NotifierProvider.autoDispose<LogicGateGameplayController, LogicGateState>(
      LogicGateGameplayController.new,
    );

class LogicGateGameplayController extends AutoDisposeNotifier<LogicGateState> {
  KeepAliveLink? _keepAliveLink;
  AiService? _aiService;
  VoidCallback? _updateLineConnection;

  @override
  LogicGateState build() {
    ref.onDispose(() {
      _aiService?.dispose();
    });
    return const LogicGateState();
  }

  void initializeLogicGateGame({
    bool vsAI = false,
    AiDifficulty difficulty = AiDifficulty.medium,
  }) async {
    _keepAliveLink ??= ref.keepAlive();

    if (vsAI) {
      _aiService = AiService();
      await _aiService!.loadModel();
    }

    state = LogicGateState(
      binarySlots: _initializeBinarySlots(15),
      cardSlots: _initializeCardSlots(10),
      player: PlayerModel(id: 1, hand: _getAvailableCards(1), targetValue: 1),
      opponent: PlayerModel(id: 0, hand: _getAvailableCards(2), targetValue: 0),
      vsAI: vsAI,
      difficulty: difficulty,
    );
  }

  void updateLineConnection(VoidCallback callback) {
    _updateLineConnection = callback;
  }

  List<LogicGateCardModel> _getAvailableCards(int playerId) {
    const int numberOfCards = 5;
    const availableTypes = LogicGateType.values;

    final int startId = (playerId == 1) ? 1 : (numberOfCards + 1);

    return List.generate(numberOfCards, (index) {
      return LogicGateCardModel(
        id: startId + index,
        type: availableTypes[index],
      );
    });
  }

  List<CardSlotModel> _initializeCardSlots(int count) {
    return List.generate(count, (index) {
      return CardSlotModel(id: index + 1);
    });
  }

  List<BinarySlotModel> _initializeBinarySlots(int count) {
    return List.generate(count, (index) {
      if (index < 5) {
        return BinarySlotModel(id: index + 1, value: index % 2);
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

    final nextPlayerId = state.currentPlayerId == 1 ? 0 : 1;

    state = slotId == 10
        ? state.copyWith(
            cardSlots: newCardSlots,
            binarySlots: newBinarySlot,
            player: isPlayerTurn ? updatedUser : state.player,
            opponent: !isPlayerTurn ? updatedUser : state.opponent,
            lastUpdatedCardSlotId: slotId,
            outputBinary: resultValue,
          )
        : state.copyWith(
            cardSlots: newCardSlots,
            binarySlots: newBinarySlot,
            player: isPlayerTurn ? updatedUser : state.player,
            opponent: !isPlayerTurn ? updatedUser : state.opponent,
            currentPlayerId: nextPlayerId,
            lastUpdatedCardSlotId: slotId,
          );

    if (state.vsAI && nextPlayerId == 0) {
      _handleAiTurn();
    }
  }

  void _handleAiTurn() {
    final aiGameState = AiGameState(
      binarySlots: state.binarySlots!,
      cardSlots: state.cardSlots!,
      player1Hand: state.player!.hand,
      player2Hand: state.opponent!.hand,
      currentPlayerId: 0,
    );

    final move = _aiService!.predictMove(
      gameState: aiGameState,
      difficulty: state.difficulty,
    );

    if (move != null) {
      final slotId = move['slot']!;
      final cardTypeId = move['card']!;

      final cardInHand = state.opponent!.hand.firstWhere(
        (card) => card.type.index + 1 == cardTypeId,
      );

      dropCard(slotId, cardInHand.id);
    }
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
    _updateLineConnection!();
    initializeLogicGateGame(vsAI: state.vsAI, difficulty: state.difficulty);
  }
}
