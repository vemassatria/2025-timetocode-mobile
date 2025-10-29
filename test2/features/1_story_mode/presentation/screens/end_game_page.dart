import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/game_stats.dart';
import 'package:timetocode/app/widgets/popups/info_popup.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_gameplay_controller.dart';
import 'package:timetocode/features/1_story_mode/data/providers/story_level_provider.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';

class EndGameScreen extends ConsumerWidget {
  const EndGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyLevel = ref.read(storyLevelProvider);
    final audioService = ref.read(soundEffectServiceProvider.notifier);
    final storyState = ref.read(storyControllerProvider);

    final correctAnswer = storyState.correctAnswer ?? 0;
    final wrongAnswer = storyState.wrongAnswer ?? 0;
    final totalAnswer = correctAnswer + wrongAnswer;
    final totalSteps = storyLevel.value!.length;
    final completedLevel = storyState.activeLevel!.level;
    final maxLevel = totalSteps;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        audioService.playSelectClick();
        ref.read(storyControllerProvider.notifier).exitStory();
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
                  totalSteps: totalSteps,
                  currentStep: completedLevel,
                  stepSize: 20,
                  selectedColor: AppColors.xpGreen,
                  unselectedColor: AppColors.gray1,
                  height: 250.h,
                  width: 250.w,
                  child: Center(
                    child: Text(
                      '$completedLevel/$maxLevel',
                      style: AppTypography.heading1().copyWith(
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 32.h),

                Text(
                  'Level $completedLevel Selesai',
                  style: AppTypography.heading4().copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),

                SizedBox(height: 16.h),

                CustomButton(
                  label: "Rangkuman",
                  icon: const Icon(Icons.chrome_reader_mode),
                  color: ButtonColor.purple,
                  type: ButtonType.iconLabel,
                  onPressed: () {
                    showPopupOverlay(
                      context,
                      InfoPopup(
                        title: "Rangkuman",
                        summaryList: storyState.activeLevel!.summary!,
                        variant: InfoPopupVariant.summary,
                        onClose: () {
                          audioService.playNegativeClick();
                          closePopupOverlay(ref);
                        },
                      ),
                      ref,
                    );
                  },
                ),

                SizedBox(height: 64.h),

                GameStats(
                  correct: correctAnswer,
                  wrong: wrongAnswer,
                  total: totalAnswer,
                ),

                SizedBox(height: 64.h),

                CustomButton(
                  label: "Lanjutkan",
                  widthMode: ButtonWidthMode.fill,
                  onPressed: () {
                    audioService.playSelectClick();
                    ref.read(storyControllerProvider.notifier).exitStory();
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
