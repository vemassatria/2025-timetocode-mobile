import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class MatrixScoreBox extends StatelessWidget {
  final double accuracy;
  final bool isSuccess;

  const MatrixScoreBox({
    super.key,
    required this.accuracy,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isSuccess ? AppColors.greenStats : AppColors.darkRed;
    final Color borderColor = isSuccess ? AppColors.xpGreen : AppColors.dangerRed;
    final Color textColor = isSuccess ? AppColors.primaryText : AppColors.primaryText;
    final Color secondaryTextColor = isSuccess ? AppColors.secondaryText : AppColors.gray1;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: borderColor, width: 4.w),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.track_changes_outlined,
                color: textColor,
                size: 40.r,
              ),
              SizedBox(width: 16.w),
              Text(
                '${accuracy.toStringAsFixed(0)}%',
                style: AppTypography.heading3(color: textColor),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Akurasi',
            style: AppTypography.normal(color: secondaryTextColor),
          ),
        ],
      ),
    );
  }
}
