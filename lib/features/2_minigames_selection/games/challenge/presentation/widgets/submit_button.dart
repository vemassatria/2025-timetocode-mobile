import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/features/0_core/models/choices_model.dart';

class SubmitButton extends StatelessWidget {
  final ChoicesModel? selectedAnswer;
  final VoidCallback onSubmit;

  const SubmitButton({super.key, required this.selectedAnswer, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        border: Border(
          top: BorderSide(color: AppColors.black1, width: 1.w),
        ),
      ),
      child: CustomButton(
        label: "Kirim",
        onPressed: onSubmit,
        color: ButtonColor.purple,
        isDisabled: selectedAnswer == null,
      ),
    );
  }
}
