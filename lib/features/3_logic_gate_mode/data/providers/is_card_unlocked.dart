import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/controllers/logic_gate_gameplay_controller.dart';

final isCardSlotUnlockedProvider = Provider.autoDispose.family<bool, int>((
  ref,
  cardSlotId,
) {
  final inputSlotId1 = ref
      .read(logicGateControllerProvider.notifier)
      .calculateTopBinarySlotIndex(cardSlotId);
  final inputSlotId2 = inputSlotId1 + 1;

  final binarySlot1 = ref.watch(
    logicGateControllerProvider.select(
      (state) => state.binarySlots!
          .firstWhere((slot) => slot.id == inputSlotId1)
          .value,
    ),
  );
  final binarySlot2 = ref.watch(
    logicGateControllerProvider.select(
      (state) => state.binarySlots!
          .firstWhere((slot) => slot.id == inputSlotId2)
          .value,
    ),
  );

  return binarySlot1 != null && binarySlot2 != null;
});
