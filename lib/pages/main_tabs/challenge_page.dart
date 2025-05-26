import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/challengecard.dart';
import 'package:timetocode/games/backend/providers/challenge_provider.dart';
import 'package:timetocode/games/backend/providers/daftar_challenge_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
//import 'package:timetocode/games/backend/controllers/challenge_controller.dart';

class ChallengePage extends ConsumerWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelCompleted = ref.watch(completedChallengeProvider);
    final notifier = ref.read(completedChallengeProvider.notifier);
    final storyState = ref.watch(challengeControllerProvider);

    return storyState.when(
      loading:
          () => const Scaffold(
            backgroundColor: AppColors.darkBackground,
            body: Center(child: CircularProgressIndicator()),
          ),
      error:
          (error, stackTrace) => Scaffold(
            backgroundColor: AppColors.darkBackground,
            body: Center(
              child: Text(
                'Error loading challenges',
                style: AppTypography.normal(color: AppColors.primaryText),
              ),
            ),
          ),
      data: (data) {
        return Scaffold(
          backgroundColor: AppColors.darkBackground,
          appBar: AppBar(
            backgroundColor: AppColors.surfaceDark,
            elevation: 0,
            title: Text(
              data.challenge.title,
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
              itemCount: data.challenge.levels.length,
              itemBuilder: (context, index) {
                final level = data.challenge.levels[index];
                final levelNumber = level.id;
                final isUnlocked = levelCompleted <= levelNumber + 1;

                return ChallengeCard(
                  levelNumber: levelNumber,
                  starCount: notifier.getCompletedChallengeStars(levelNumber),
                  isUnlocked: isUnlocked,
                  onTap:
                      isUnlocked
                          ? () {
                            // Navigasi ke halaman challenge detail ketika card diklik
                            _navigateToChallenge(context, levelNumber);
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

  void _navigateToChallenge(BuildContext context, int levelNumber) {
    // Untuk sementara, tampilkan dialog sebagai placeholder
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              'Level $levelNumber',
              style: AppTypography.heading5(color: AppColors.primaryText),
            ),
            content: Text(
              'Halaman detail untuk Level $levelNumber akan ditampilkan di sini.',
              style: AppTypography.normal(color: AppColors.primaryText),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Tutup',
                  style: AppTypography.normalBold(color: AppColors.primaryText),
                ),
              ),
            ],
          ),
    );
  }
}
