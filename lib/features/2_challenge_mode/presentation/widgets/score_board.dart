import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/features/2_challenge_mode/data/controllers/challenge_gameplay_controller.dart';

class ScoreBoard extends ConsumerWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final correctAnswer = ref.watch(
      challengeControllerProvider.select((state) => state.correctAnswer),
    );
    final wrongAnswer = ref.watch(
      challengeControllerProvider.select((state) => state.wrongAnswer),
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.check_circle, color: AppColors.xpGreen),
        SizedBox(
          width: 35.w,
          child: Text(
            "${correctAnswer ?? 0}/3",
            style: AppTypography.mediumBold(),
            textAlign: TextAlign.end,
          ),
        ),
        SizedBox(width: 16.w),
        const Icon(Icons.cancel, color: AppColors.dangerRed),
        SizedBox(
          width: 35.w,
          child: Text(
            "${wrongAnswer ?? 0}/3",
            style: AppTypography.mediumBold(),
            textAlign: TextAlign.end,
          ),
        ),
        SizedBox(width: 16.w),
      ],
    );
  }
}
