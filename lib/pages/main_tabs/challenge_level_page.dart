import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/components/challengecard.dart';
import 'package:timetocode/games/backend/providers/challenge/challenge_level_provider.dart';
import 'package:timetocode/games/backend/providers/challenge/daftar_challenge_provider.dart';
import 'package:timetocode/games/backend/providers/current_level_provider.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';

class ChallengePage extends ConsumerWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelCompleted = ref.watch(completedChallengeProvider);
    final levelNotifier = ref.read(completedChallengeProvider.notifier);
    final challengeAsync = ref.watch(challengeLevelProvider);

    return challengeAsync.when(
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

                return ChallengeCard(
                  levelNumber: levelNumber,
                  starCount: levelNotifier.getCompletedChallengeStars(
                    levelNumber,
                  ),
                  isUnlocked: isUnlocked,
                  onTap:
                      isUnlocked
                          ? () {
                            ref
                                .read(soundEffectServiceProvider.notifier)
                                .playSelectClick();
                            ref.read(currentLevelIndexProvider.notifier).state =
                                index;
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
