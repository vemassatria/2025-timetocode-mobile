import 'package:flutter/material.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/screen_utils.dart';

class QuestionBox extends StatelessWidget {
  final String questionText;

  const QuestionBox({super.key, required this.questionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 328 / 360 * ScreenUtils.screenWidth(context),
      decoration: BoxDecoration(
        color: AppColors.backgroundTransparent,
        border: Border.all(color: AppColors.white),
      ),
      child: Text(questionText, style: AppTypography.normal()),
    );
  }
}
