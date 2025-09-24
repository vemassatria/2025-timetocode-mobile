import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';

class BasePopup extends StatelessWidget {
  final Widget child;
  final Color? borderColor;

  const BasePopup({super.key, required this.child, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.w,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        border: Border.all(color: borderColor ?? AppColors.white, width: 2.r),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: IntrinsicHeight(child: child),
    );
  }
}
