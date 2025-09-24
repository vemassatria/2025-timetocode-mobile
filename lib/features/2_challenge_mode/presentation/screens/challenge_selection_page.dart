import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/features/2_challenge_mode/presentation/widgets/challenge_card.dart';
import 'package:timetocode/features/2_challenge_mode/data/controllers/challenge_gameplay_controller.dart';
import 'package:timetocode/features/2_challenge_mode/data/controllers/challenge_progress_controller.dart';
import 'package:timetocode/features/2_challenge_mode/data/providers/challenge_level_provider.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class ChallengeSelectionPage extends ConsumerWidget {
  const ChallengeSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelCompletedState = ref.watch(challengeProgressProvider);
    final levelCompleted =
        levelCompletedState.isNotEmpty ? levelCompletedState.last.level : 0;
    final challengeAsync = ref.watch(challengeLevelProvider);

    return challengeAsync.when(
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
      data: (challengeState) {
        return Scaffold(
          backgroundColor: AppColors.darkBackground,
          appBar: AppBar(
            backgroundColor: AppColors.surfaceDark,
            elevation: 0,
            title: Text(
              challengeState.title,
              style: AppTypography.heading6(color: AppColors.white),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 24.w,
                childAspectRatio: 1,
              ),
              itemCount: challengeState.levels.length,
              itemBuilder: (context, index) {
                final level = challengeState.levels[index];
                final levelNumber = level.id;
                final isUnlocked = (levelCompleted + 1) >= levelNumber;
                int starCount = 0;
                final completedChallenge = levelCompletedState.where(
                  (c) => c.level == levelNumber,
                );
                if (completedChallenge.isNotEmpty) {
                  starCount = completedChallenge.first.stars;
                }

                return ChallengeCard(
                  levelNumber: levelNumber,
                  starCount: starCount,
                  isUnlocked: isUnlocked,
                  onTap:
                      isUnlocked
                          ? () {
                            ref
                                .read(soundEffectServiceProvider.notifier)
                                .playSelectClick();
                            ref
                                .read(challengeControllerProvider.notifier)
                                .initializeChallenge(level);
                            context.go('/tantangan/level');
                          }
                          : null,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
