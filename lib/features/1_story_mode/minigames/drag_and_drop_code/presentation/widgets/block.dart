import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';

class Block extends StatelessWidget {
  final String text;
  final bool isDragging;
  final bool isSpecial;

  const Block({
    super.key,
    required this.text,
    this.isDragging = false,
    this.isSpecial = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: isDragging ? 4.0 : 0.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color:
              isSpecial
                  ? AppColors.rewardYellow
                  : isDragging
                  ? AppColors.technoBlue
                  : AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: AppColors.white, width: 1.5.w),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Fira Code',
            fontSize: 12.sp,
            color: isSpecial ? AppColors.black1 : AppColors.gray1,
            letterSpacing: 0.5,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
