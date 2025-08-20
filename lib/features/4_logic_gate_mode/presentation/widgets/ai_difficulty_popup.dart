import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/popups/base_popup.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/controllers/logic_gate_gameplay_controller.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/services/ai_service.dart';

class DifficultyPopup extends ConsumerWidget {
  const DifficultyPopup({super.key});

  void _startGame(
    BuildContext context,
    WidgetRef ref,
    AiDifficulty difficulty,
  ) {
    ref
        .read(logicGateControllerProvider.notifier)
        .initializeLogicGateGame(vsAI: true, difficulty: difficulty);
    context.go('/logic-gate/gameplay');
    closePopupOverlay(ref);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePopup(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Pilih Tingkat Kesulitan",
            style: AppTypography.heading4(),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Divider(thickness: 3.w),
          SizedBox(height: 32.h),
          CustomButton(
            label: "Mudah",
            onPressed: () => _startGame(context, ref, AiDifficulty.easy),
            widthMode: ButtonWidthMode.fill,
            color: ButtonColor.green,
          ),
          SizedBox(height: 12.h),
          CustomButton(
            label: "Biasa",
            onPressed: () => _startGame(context, ref, AiDifficulty.medium),
            widthMode: ButtonWidthMode.fill,
            color: ButtonColor.yellow,
          ),
          SizedBox(height: 12.h),
          CustomButton(
            label: "Sulit",
            onPressed: () => _startGame(context, ref, AiDifficulty.hard),
            widthMode: ButtonWidthMode.fill,
            color: ButtonColor.red,
          ),
        ],
      ),
    );
  }
}
