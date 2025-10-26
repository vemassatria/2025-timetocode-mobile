import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';

class MatrixEndLevelButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final bool isPrimary;

  const MatrixEndLevelButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;

    final Color backgroundColor;
    final Color borderColor;
    final Color iconColor;

    if (isDisabled) {
      backgroundColor = AppColors.gray1;
      borderColor = AppColors.gray1;
      iconColor = AppColors.secondaryText;
    } else if (isPrimary) {
      backgroundColor = AppColors.technoBlue;
      borderColor = AppColors.technoBlue;
      iconColor = AppColors.white;
    } else {
      backgroundColor = AppColors.cyberPurple;
      borderColor = AppColors.cyberPurple;
      iconColor = AppColors.white;
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 70.w,
        height: 70.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 32.sp,
        ),
      ),
    );
  }
}
