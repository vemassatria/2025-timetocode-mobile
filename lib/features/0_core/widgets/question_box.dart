import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class QuestionBox extends StatelessWidget {
  final String questionText;
  final double? height;

  const QuestionBox({super.key, required this.questionText, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      width: 328.w,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.backgroundTransparent,
        border: Border.all(color: AppColors.white),
      ),
      alignment: Alignment.center,
      child: Text(
        questionText,
        style: AppTypography.small(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
