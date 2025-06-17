import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/challengecard.dart';
import 'package:timetocode/games/backend/providers/challenge_provider.dart';
import 'package:timetocode/games/backend/providers/daftar_challenge_provider.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';

class ChallengePage extends ConsumerWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelCompleted = ref.watch(completedChallengeProvider);
    final notifier = ref.read(completedChallengeProvider.notifier);
    final challengeAsync = ref.watch(challengeControllerProvider);

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
              challengeState.challenge.title,
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
              itemCount: challengeState.challenge.levels.length,
              itemBuilder: (context, index) {
                final level = challengeState.challenge.levels[index];
                final levelNumber = level.id;
                final isUnlocked = (levelCompleted + 1) >= levelNumber;

                return ChallengeCard(
                  levelNumber: levelNumber,
                  starCount: notifier.getCompletedChallengeStars(levelNumber),
                  isUnlocked: isUnlocked,
                  onTap:
                      isUnlocked
                          ? () {
                            ref
                                .read(soundEffectServiceProvider.notifier)
                                .playSelectClick();
                            ref
                                .read(challengeControllerProvider.notifier)
                                .startChallenge(index);
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
