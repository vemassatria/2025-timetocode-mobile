import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/controllers/logic_gate_gameplay_controller.dart';

class BinarySlotWidget extends ConsumerWidget {
  final int slotId;

  const BinarySlotWidget({super.key, required this.slotId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final binarySlot = ref.watch(
      logicGateControllerProvider.select(
        (state) => state.binarySlots?.firstWhere((s) => s.id == slotId),
      ),
    );

    return Container(
      width: 34.w,
      height: 34.h,
      decoration: BoxDecoration(
        color: binarySlot!.value == null
            ? AppColors.secondaryText
            : (binarySlot.value == 0
                  ? AppColors.softViolet
                  : AppColors.skyByte),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: binarySlot.value == null
              ? AppColors.black1
              : (binarySlot.value == 0
                    ? AppColors.royalIndigo
                    : AppColors.deepAzure),
          width: 2.w,
        ),
      ),
      child: Center(
        child: Text(
          binarySlot.value?.toString() ?? '',
          style: AppTypography.heading5().copyWith(color: AppColors.black1),
        ),
      ),
    );
  }
}
