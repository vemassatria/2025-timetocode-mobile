import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/controllers/logic_gate_gameplay_controller.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/card_slot_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/providers/is_card_unlocked.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/logic_gate_card.dart';

class DropZoneCard extends ConsumerWidget {
  final int id;

  const DropZoneCard({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CardSlotModel? cardSlot = ref.watch(
      logicGateControllerProvider.select(
        (state) => state.cardSlots!.firstWhere((slot) => slot.id == id),
      ),
    );

    final bool isUnlocked = ref.watch(isCardSlotUnlockedProvider(id));

    return DragTarget<int>(
      builder: (context, candidateData, rejectedData) {
        final bool isHovering = candidateData.isNotEmpty;
        return cardSlot!.placedCard != null
            ? LogicGateCard(card: cardSlot.placedCard!, height: 50, width: 35)
            : (isUnlocked
                  ? Container(
                      width: 35.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.white.withValues(alpha: 0.5),
                          width: 1.w,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isHovering
                                ? AppColors.white.withValues(alpha: 0.6)
                                : AppColors.white.withValues(alpha: 0.15),
                            blurRadius: isHovering ? 10.0 : 5.0,
                            spreadRadius: 5.0,
                          ),
                        ],
                      ),
                    )
                  : Container(
                      width: 35.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: isHovering
                            ? AppColors.gray1
                            : Colors.white.withValues(alpha: 0.1),
                      ),
                    ));
      },
      onWillAcceptWithDetails: (details) =>
          ref.read(isCardSlotUnlockedProvider(id)),
      onAcceptWithDetails: (details) => ref
          .read(logicGateControllerProvider.notifier)
          .dropCard(id, details.data),
    );
  }
}
