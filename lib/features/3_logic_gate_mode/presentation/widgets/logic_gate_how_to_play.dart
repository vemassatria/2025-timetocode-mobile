import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/features/3_logic_gate_mode/presentation/widgets/how_to_play_popup.dart';

class LogicGateHowToPlay extends ConsumerWidget {
  const LogicGateHowToPlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () => showPopupOverlay(context, const HowToPlayPopup(), ref),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: AppColors.white, width: 1.0),
          ),
          child: Icon(
            Icons.info_outline,
            color: AppColors.primaryText,
            size: 32.sp,
          ),
        ),
      ),
    );
  }
}
