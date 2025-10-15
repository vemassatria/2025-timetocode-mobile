import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/popups/base_popup.dart';

class GameResultPopup extends StatelessWidget {
  final bool isCorrect;
  final VoidCallback onPrimaryAction;
  final VoidCallback? onSecondaryAction;

  const GameResultPopup({
    super.key,
    required this.isCorrect,
    required this.onPrimaryAction,
    this.onSecondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    return BasePopup(
      borderColor: isCorrect ? AppColors.xpGreen : AppColors.dangerRed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isCorrect ? Icons.check_circle : Icons.cancel,
                color: isCorrect ? AppColors.xpGreen : AppColors.dangerRed,
                size: 32.sp,
              ),
              SizedBox(width: 12.w),
              Text(
                isCorrect ? "Benar" : "Salah",
                style: AppTypography.heading4(
                    color: isCorrect ? AppColors.xpGreen : AppColors.dangerRed),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          if (isCorrect)
            CustomButton(
              label: "Lanjut",
              onPressed: onPrimaryAction,
              color: ButtonColor.green,
              widthMode: ButtonWidthMode.fill,
            )
          else
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: "Lewati",
                    onPressed: onSecondaryAction,
                    type: ButtonType.outline,
                    color: ButtonColor.none,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CustomButton(
                    label: "Coba Lagi",
                    onPressed: onPrimaryAction,
                    color: ButtonColor.red,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}