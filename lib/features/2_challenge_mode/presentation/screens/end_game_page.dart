import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/game_stats.dart';
import 'package:timetocode/features/2_challenge_mode/data/controllers/challenge_gameplay_controller.dart';
import 'package:timetocode/features/2_challenge_mode/data/providers/challenge_level_provider.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class EndGameChallenge extends ConsumerWidget {
  const EndGameChallenge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxLevel = ref.read(challengeLevelProvider).value!.levels.length;
    final challengeState = ref.read(challengeControllerProvider);

    final correctAnswer = challengeState.correctAnswer ?? 0;
    final wrongAnswer = challengeState.wrongAnswer ?? 0;
    final indexLevel = challengeState.currentLevel!.id;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        ref.read(soundEffectServiceProvider.notifier).playButtonClick2();
        ref.read(challengeControllerProvider.notifier).exitChallenge();
      },
      child: Container(
        decoration: const BoxDecoration(color: AppColors.darkBackground),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48.h),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32.h),
                CircularStepProgressIndicator(
                  circularDirection: CircularDirection.counterclockwise,
                  totalSteps: maxLevel,
                  currentStep: indexLevel,
                  stepSize: 20,
                  selectedColor: AppColors.xpGreen,
                  unselectedColor: AppColors.gray1,
                  height: 250.h,
                  width: 250.w,
                  child: Center(
                    child: Text(
                      '$indexLevel/$maxLevel',
                      style: AppTypography.heading1().copyWith(
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 32.h),
                correctAnswer > 0
                    ? Text(
                        'Level $indexLevel Selesai',
                        style: AppTypography.heading4().copyWith(
                          decoration: TextDecoration.none,
                        ),
                      )
                    : Text(
                        'Level $indexLevel Gagal ',
                        style: AppTypography.heading4().copyWith(
                          decoration: TextDecoration.none,
                        ),
                      ),

                SizedBox(height: 120.h),

                GameStats(correct: correctAnswer, wrong: wrongAnswer, total: 3),

                SizedBox(height: 64.h),

                CustomButton(
                  label: "Lanjutkan",
                  widthMode: ButtonWidthMode.fill,
                  onPressed: () {
                    ref
                        .read(soundEffectServiceProvider.notifier)
                        .playButtonClick2();
                    ref
                        .read(challengeControllerProvider.notifier)
                        .exitChallenge();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
