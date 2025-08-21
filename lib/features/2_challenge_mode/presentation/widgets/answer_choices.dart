import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/features/0_core/models/choices_model.dart';

class AnswerChoices extends ConsumerWidget {
  final List<ChoicesModel> choices;
  final ChoicesModel? selectedAnswer;
  final ValueChanged<ChoicesModel> onAnswerSelected;

  const AnswerChoices({super.key, 
    required this.choices,
    required this.selectedAnswer,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final soundEffectService = ref.read(soundEffectServiceProvider.notifier);

    return Column(
      children: choices.asMap().entries.map((entry) {
        final int index = entry.key;
        final ChoicesModel option = entry.value;
        final bool isSelected = selectedAnswer == option;

        return Padding(
          padding: EdgeInsets.only(top: index == 0 ? 0 : 16.h),
          child: GestureDetector(
            onTap: () {
              soundEffectService.playButtonClick2();
              onAnswerSelected(option);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? AppColors.skyByte : Colors.transparent,
                  width: 2.w,
                ),
                color: isSelected
                    ? AppColors.selectedBlue
                    : AppColors.blueTransparent,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                option.text,
                style: AppTypography.normal(color: AppColors.primaryText),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
