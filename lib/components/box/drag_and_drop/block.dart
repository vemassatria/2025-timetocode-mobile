import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/themes/colors.dart';

class Block extends StatelessWidget {
  final String text;
  final bool isDragging;

  const Block({required this.text, this.isDragging = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: isDragging ? 4.0 : 0.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isDragging ? AppColors.technoBlue : AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: AppColors.white, width: 1.5.w),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Fira Code',
            fontSize: 12.sp,
            color: const Color(0xFFDCDCAA),
            letterSpacing: 0.5,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
