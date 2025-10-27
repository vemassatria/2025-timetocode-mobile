import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class MatrixLevelBanner extends StatelessWidget {
  final int levelNumber;
  final bool isSuccess;

  const MatrixLevelBanner({
    super.key,
    required this.levelNumber,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    final String text = isSuccess ? 'Level $levelNumber Selesai' : 'Gagal 💔';
    const Color bannerColor = AppColors.cyberPurple;

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: bannerColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Text(
          text,
          style: AppTypography.heading5(color: AppColors.white),
        ),
      ),
    );
  }
}
