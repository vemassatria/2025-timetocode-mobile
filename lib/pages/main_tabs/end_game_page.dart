import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/game_stats.dart';
import 'package:timetocode/components/popups/info_popup.dart';
import 'package:timetocode/games/backend/providers/daftar_level_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:timetocode/utils/screen_utils.dart';
// import 'package:timetocode/SFX/music_service.dart';
import 'package:timetocode/components/popups/popscope_popups.dart';

// Import StoryController provider
import 'package:timetocode/games/backend/providers/story_provider.dart';

class EndGameScreen extends ConsumerWidget {
  const EndGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initScreenUtil(context);

    // Watch story state
    final storyStateAsync = ref.watch(storyControllerProvider);
    final levelNotifier = ref.read(completedLevelProvider.notifier);

    return storyStateAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      data: (storyState) {
        // Data dari StoryController
        final correctAnswer = storyState.correctAnswer ?? 0;
        final wrongAnswer = storyState.wrongAnswer ?? 0;
        final totalAnswer = correctAnswer + wrongAnswer;

        // Data dari activeLevel
        final activeLevel = storyState.activeLevel;
        if (activeLevel == null) {
          return const Center(child: Text('No active level found'));
        }

        final currentLevelIndex = storyState.levels.indexOf(activeLevel);
        final totalSteps = storyState.levels.length;
        final completedLevel = currentLevelIndex + 1;
        final maxLevel = totalSteps;

        levelNotifier.setCompletedLevel(completedLevel);

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (PopscopePopups.isPopScopeActive()) {
              endGamePopup(context, ref);
              PopscopePopups.setPopScope(false);
            } else {
              closePopupOverlay();
              PopscopePopups.setPopScope(true);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/background/default.webp'),
                fit: BoxFit.cover,
              ),
            ),
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
                        // MusicService.sfxButton2Click();
                        showPopupOverlay(
                          context,
                          InfoPopup(
                            title: "Rangkuman",
                            summaryList: activeLevel.summary!,
                            variant: InfoPopupVariant.summary,
                            onClose: () {
                              // MusicService.sfxNegativeClick();
                              closePopupOverlay();
                            },
                          ),
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
                        // MusicService.sfxSelectClick();

                        // Gunakan StoryController untuk mengakhiri permainan
                        final storyController = ref.read(
                          storyControllerProvider.notifier,
                        );
                        storyController.endStory();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
