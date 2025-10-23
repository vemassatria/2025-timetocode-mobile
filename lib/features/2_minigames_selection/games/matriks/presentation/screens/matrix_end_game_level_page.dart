import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/widgets/star_display.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/providers/matrix_level_provider.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/presentation/widgets/matrix_end_level_button.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/presentation/widgets/matrix_level_banner.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/presentation/widgets/matrix_score_box.dart';

class MatrixEndLevelPage extends ConsumerWidget {
  final int levelNumber;
  final int correctAnswers;

  const MatrixEndLevelPage({
    super.key,
    required this.levelNumber,
    required this.correctAnswers,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const int totalQuestions = 3;
    final int stars = correctAnswers;
    final double accuracy =
        totalQuestions > 0 ? (correctAnswers / totalQuestions) * 100 : 0.0;
    final bool isSuccess = stars > 0 && accuracy >= 50;
    final bool isLastLevel = levelNumber >= 5;

    void goToHome() {
      context.go('/minigames/matriks');
    }

    void restartLevel() {
      ref.invalidate(matrixScoreProvider);
      context.pushReplacement(
        '/minigames/matriks/level',
        extra: levelNumber,
      );
    }

    void nextLevel() {
      if (isLastLevel) {
        context.go('/minigames/matriks');
      } else {
        ref.invalidate(matrixScoreProvider);
        context.pushReplacement(
          '/minigames/matriks/level',
          extra: levelNumber + 1,
        );
      }
    }

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 1),
              StarDisplay(
                starCount: stars,
                size: 50.sp,
                isCentered: true,
              ),
              SizedBox(height: 18.h),
              MatrixLevelBanner(
                levelNumber: levelNumber,
                isSuccess: isSuccess,
              ),
              SizedBox(height: 12.h),
              Text(
                isSuccess
                    ? "BRAVO! Kamu berhasil menyelesaikan\nlevel ini"
                    : "Tetap semangat dan terus belajar 🥀🥀🥀",
                textAlign: TextAlign.center,
                style: AppTypography.medium(),
              ),
              SizedBox(height: 96.h),
              Text(
                'Skor Kamu:',
                textAlign: TextAlign.center,
                style: AppTypography.heading5(),
              ),
              SizedBox(height: 24.h),
              MatrixScoreBox(
                accuracy: accuracy,
                isSuccess: isSuccess,
              ),
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MatrixEndLevelButton(
                    icon: Icons.home_rounded,
                    onPressed: goToHome,
                  ),
                  MatrixEndLevelButton(
                    icon: Icons.replay_rounded,
                    onPressed: restartLevel,
                  ),
                  MatrixEndLevelButton(
                    icon: Icons.arrow_forward_rounded,
                    onPressed: isSuccess ? nextLevel : null,
                    isPrimary: true,
                  ),
                ],
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
