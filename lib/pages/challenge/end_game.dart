import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/game_stats.dart';
import 'package:timetocode/games/backend/providers/challenge_provider.dart';
import 'package:timetocode/games/backend/providers/daftar_challenge_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:timetocode/utils/screen_utils.dart';
// import 'package:timetocode/SFX/music_service.dart';
import 'package:timetocode/components/popups/popscope_popups.dart';

// Import StoryController provider

class EndGameChallenge extends ConsumerWidget {
  const EndGameChallenge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initScreenUtil(context);

    // Watch story state
    final challengeStateAsync = ref.watch(challengeControllerProvider);
    final levelChallengeNotifier = ref.read(
      completedChallengeProvider.notifier,
    );

    return challengeStateAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      data: (challengeState) {
        final correctAnswer = challengeState.correctAnswer ?? 0;
        final wrongAnswer = challengeState.wrongAnswer ?? 0;

        final indexLevel = challengeState.currentLevel!.id;
        levelChallengeNotifier.setCompletedChallenge(indexLevel, correctAnswer);
        final maxLevel = challengeState.challenge.levels.length;

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (PopscopePopups.isPopScopeActive()) {
              endChallengePopup(context, ref);
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

                    Text(
                      'Level $indexLevel Selesai',
                      style: AppTypography.heading4().copyWith(
                        decoration: TextDecoration.none,
                      ),
                    ),

                    SizedBox(height: 120.h),

                    GameStats(
                      correct: correctAnswer,
                      wrong: wrongAnswer,
                      total: 3,
                    ),

                    SizedBox(height: 64.h),

                    CustomButton(
                      label: "Lanjutkan",
                      widthMode: ButtonWidthMode.fill,
                      onPressed: () {
                        // MusicService.sfxSelectClick();

                        // Gunakan ChallengeController untuk mengakhiri permainan
                        final challengeController = ref.read(
                          challengeControllerProvider.notifier,
                        );
                        challengeController.endChallenge();
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
