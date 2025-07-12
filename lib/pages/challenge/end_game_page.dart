import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/game_stats.dart';
import 'package:timetocode/games/backend/providers/challenge/challenge_level_provider.dart';
import 'package:timetocode/games/backend/providers/challenge/challenge_provider.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';

class EndGameChallenge extends ConsumerWidget {
  const EndGameChallenge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxLevel = ref.read(challengeLevelProvider).value!.levels.length;
    final challengeState = ref.read(challengeControllerProvider).value!;

    final correctAnswer = challengeState.correctAnswer ?? 0;
    final wrongAnswer = challengeState.wrongAnswer ?? 0;
    final indexLevel = challengeState.currentLevel!.id;

    return Container(
      decoration: BoxDecoration(color: AppColors.darkBackground),
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
                      .endChallengePopup();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
