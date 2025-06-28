import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:timetocode/components/card.dart';
import 'package:timetocode/components/popups/info_popup.dart';
import 'package:timetocode/games/backend/providers/current_level_provider.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/games/backend/providers/visual_novel/daftar_level_provider.dart';
import 'package:timetocode/games/backend/providers/visual_novel/story_level_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/overlay_utils.dart';

class DaftarLevelPage extends ConsumerWidget {
  const DaftarLevelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyAsync = ref.watch(storyLevelProvider);
    final completedLevel = ref.watch(completedLevelProvider);
    final soundEffect = ref.read(soundEffectServiceProvider.notifier);

    return storyAsync.when(
      loading:
          () => const Scaffold(
            backgroundColor: AppColors.darkBackground,
            body: Center(child: CircularProgressIndicator()),
          ),
      error:
          (error, stack) => Scaffold(
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
              preferredSize: Size.fromHeight(1),
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
                        image: 'assets/background/${level.background}.webp',
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
                                  soundEffect.playSelectClick();
                                  ref
                                      .read(currentLevelIndexProvider.notifier)
                                      .state = index;
                                  context.go('/pembelajaran/level');
                                },

                        onInfoPressed: () {
                          soundEffect.playSelectClick();
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
