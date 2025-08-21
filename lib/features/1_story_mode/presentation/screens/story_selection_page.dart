import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/widgets/card/card.dart';
import 'package:timetocode/app/widgets/popups/info_popup.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_progress_controller.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_gameplay_controller.dart';
import 'package:timetocode/features/1_story_mode/data/providers/story_level_provider.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';

class StorySelectionPage extends ConsumerWidget {
  const StorySelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyAsync = ref.watch(storyLevelProvider);
    final completedLevel = ref.watch(storyProgressProvider);
    final soundEffectService = ref.read(soundEffectServiceProvider.notifier);

    return storyAsync.when(
      loading:
          () => const Scaffold(
            backgroundColor: AppColors.darkBackground,
            body: Center(child: CircularProgressIndicator()),
          ),
      error:
          (error, stack) => const Scaffold(
            backgroundColor: AppColors.darkBackground,
            body: Center(child: Text('Error loading levels')),
          ),
      data: (levels) {
        return Scaffold(
          backgroundColor: AppColors.darkBackground,
          appBar: AppBar(
            title: Text('Konsep Pemrograman', style: AppTypography.heading6()),
            toolbarHeight: 56.h,
            elevation: 0,
            backgroundColor: AppColors.surfaceDark,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: CircularStepProgressIndicator(
                  circularDirection: CircularDirection.counterclockwise,
                  totalSteps: levels.length,
                  currentStep: completedLevel,
                  stepSize: 4,
                  selectedColor: AppColors.xpGreen,
                  unselectedColor: AppColors.gray1,
                  height: 40.h,
                  width: 40.w,
                  child: Center(
                    child: Text(
                      '$completedLevel/${levels.length}',
                      style: AppTypography.smallBold(),
                    ),
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(height: 1, color: AppColors.black1),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView.builder(
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  final level = levels[index];
                  final isLocked = index > completedLevel;
                  final isFirst = index == 0;
                  final isLast = index == levels.length - 1;

                  return Column(
                    children: [
                      if (isFirst) SizedBox(height: 16.h),
                      LevelCard(
                        image:
                            'assets/images/background/${level.background}.webp',
                        title: level.title,
                        status:
                            isLocked
                                ? CardStatus.locked
                                : (index < completedLevel
                                    ? CardStatus.completed
                                    : CardStatus.unlocked),
                        onStartPressed:
                            isLocked
                                ? null
                                : () {
                                  soundEffectService.playSelectClick();
                                  ref
                                      .read(storyControllerProvider.notifier)
                                      .initLevel(level);
                                  context.go('/pembelajaran/level');
                                },
                        onInfoPressed: () {
                          soundEffectService.playSelectClick();
                          showPopupOverlay(
                            context,
                            InfoPopup(
                              title: level.title,
                              description: level.description,
                              onClose: () => closePopupOverlay(ref),
                            ),
                            ref,
                          );
                        },
                      ),
                      SizedBox(height: 8.h),
                      if (isLast) SizedBox(height: 16.h),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
