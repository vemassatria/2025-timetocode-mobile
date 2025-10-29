import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/widgets/star_display.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/controllers/matrix_progress_controller.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/providers/matrix_level_provider.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/presentation/widgets/matrix_end_level_button.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/presentation/widgets/matrix_level_banner.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/presentation/widgets/matrix_score_box.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';

class MatrixEndLevelPage extends ConsumerStatefulWidget {
  final int levelNumber;
  final int correctAnswers;

  const MatrixEndLevelPage({
    super.key,
    required this.levelNumber,
    required this.correctAnswers,
  });

  @override
  ConsumerState<MatrixEndLevelPage> createState() => _MatrixEndLevelPageState();
}

class _MatrixEndLevelPageState extends ConsumerState<MatrixEndLevelPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _saveProgress();
    });
  }

  void _saveProgress() {
    final int stars = widget.correctAnswers; 
    if (stars > 0) {
      ref
          .read(matrixProgressProvider.notifier)
          .setCompletedLevel(widget.levelNumber, stars);
    }
    final bool isSuccess = stars >= 2; 
    if (isSuccess) {
      ref.read(soundEffectServiceProvider.notifier).playVictory();
    } else {
      ref.read(soundEffectServiceProvider.notifier).playDefeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    const int totalQuestions = 3;
    final int stars = widget.correctAnswers; 
    final double accuracy = totalQuestions > 0
        ? (widget.correctAnswers / totalQuestions) * 100
        : 0.0;
    final bool isSuccess = stars >= 2;
    final bool isLastLevel = widget.levelNumber >= 5; 

    void goToHome() {
      ref.read(soundEffectServiceProvider.notifier).playButtonClick1();
      context.go('/minigames/matriks');
    }

    void restartLevel() {
      ref.read(soundEffectServiceProvider.notifier).playButtonClick1();
      ref.invalidate(matrixScoreProvider);
      context.pushReplacement(
        '/minigames/matriks/level',
        extra: widget.levelNumber, 
      );
    }

    void nextLevel() {
      ref.read(soundEffectServiceProvider.notifier).playSelectClick();
      ref.invalidate(matrixScoreProvider);
      if (isLastLevel) {
        context.go('/minigames/matriks');
      } else {
        context.pushReplacement(
          '/minigames/matriks/level',
          extra: widget.levelNumber + 1, 
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
              StarDisplay(starCount: stars, size: 50.r, isCentered: true),
              SizedBox(height: 18.h),
              MatrixLevelBanner(
                levelNumber: widget.levelNumber, 
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
              MatrixScoreBox(accuracy: accuracy, isSuccess: isSuccess),
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
                    onPressed: (isSuccess && !isLastLevel) ? nextLevel : null,
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