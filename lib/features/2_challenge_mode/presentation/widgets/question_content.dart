import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/features/0_core/widgets/code_text.dart';

class QuestionContent extends StatelessWidget {
  final String? text;
  final String? code;

  const QuestionContent({super.key, this.text, this.code});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (text != null)
          Text(
            text!,
            style: AppTypography.normal(color: AppColors.primaryText),
            textAlign: TextAlign.justify,
          ),
        if (text != null && code != null) SizedBox(height: 24.h),
        if (code != null)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.backgroundTransparent,
              border: Border.all(color: AppColors.primaryText, width: 1.w),
            ),
            padding: EdgeInsets.all(16.w),
            child: CodeText(data: code!),
          ),
      ],
    );
  }
}
