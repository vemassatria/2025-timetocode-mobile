import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/game_stats.dart';
import 'package:timetocode/components/popups/info_popup.dart';
import 'package:timetocode/games/backend/controllers/visual_novel/story_gameplay_controller.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/games/backend/providers/current_level_provider.dart';
import 'package:timetocode/games/backend/providers/visual_novel/story_level_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/overlay_utils.dart';

class EndGameScreen extends ConsumerWidget {
  final StoryState storyState;
  const EndGameScreen({super.key, required this.storyState});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLevelIndex = ref.read(currentLevelIndexProvider)!;
    final audioService = ref.read(soundEffectServiceProvider.notifier);
    final storyLevel = ref.read(storyLevelProvider);

    final correctAnswer = storyState.correctAnswer ?? 0;
    final wrongAnswer = storyState.wrongAnswer ?? 0;
    final totalAnswer = correctAnswer + wrongAnswer;
    final totalSteps = storyLevel.value!.length;
    final completedLevel = currentLevelIndex + 1;
    final maxLevel = totalSteps;

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
                  audioService.playButtonClick2();
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
                  if (context.mounted) {
                    context.pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
