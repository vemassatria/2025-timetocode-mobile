import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/binary_slot_widget.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/drop_zone_card.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/logic_gate_menu.dart';

class GameBoard extends ConsumerWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.white, width: 2.w),
      ),
      height: 497.h,
      width: 328.w,
      child: Stack(children: [_buildGameRow(), LogicGateMenu()]),
    );
  }

  Widget _buildGameRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildGameColumn(1),
        _buildGameColumn(2),
        _buildGameColumn(3),
        _buildGameColumn(4),
        _buildGameColumn(5),
      ],
    );
  }

  Widget _buildGameColumn(int column) {
    final int iteration;
    int cardId;
    int binaryId;
    if (column == 1) {
      iteration = 9;
      cardId = 1;
      binaryId = 1;
    } else if (column == 2) {
      iteration = 7;
      cardId = 5;
      binaryId = 6;
    } else if (column == 3) {
      iteration = 5;
      cardId = 8;
      binaryId = 10;
    } else if (column == 4) {
      iteration = 3;
      cardId = 10;
      binaryId = 13;
    } else {
      iteration = 1;
      binaryId = 15;
      cardId = 0;
    }
    final List<Widget> slots = List.generate(iteration, (index) {
      final widget;
      if ((index + 1) % 2 != 0) {
        widget = BinarySlotWidget(slotId: binaryId);
        binaryId++;
      } else {
        widget = DropZoneCard(id: cardId);
        cardId++;
      }
      return widget;
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 12.h,
      children: [...slots],
    );
  }
}
