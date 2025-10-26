import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/popups/menu_popup.dart';
import 'package:timetocode/app/data/providers/popup_visibility_provider.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/features/0_core/widgets/code_box.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/controllers/matrix_game_controller.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/providers/matrix_level_provider.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/presentation/widgets/game_result_popup.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/presentation/widgets/matrix_game_appbar.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/presentation/widgets/pointer_grid.dart';

class MatrixPointerPage extends ConsumerWidget {
  final int levelNumber;

  const MatrixPointerPage({super.key, required this.levelNumber});

  void _showMenuPopup(BuildContext context, WidgetRef ref) {
    final gameController = ref.read(
      matrixGameControllerProvider(levelNumber).notifier,
    );
    ref.read(soundEffectServiceProvider.notifier).playButtonClick2();

    showPopupOverlay(
      context,
      MenuPopup(
        onRestart: () {
          closePopupOverlay(ref);
          ref.invalidate(matrixScoreProvider); 
          ref.invalidate(matrixGameControllerProvider(levelNumber));
        },
        onExit: () {
          closePopupOverlay(ref);
          gameController.exitGame(); 
        },
        onClose: () => closePopupOverlay(ref), 
        onGoBack: () => goBackToPreviousOverlay(
          context,
          ref,
        ), 
      ),
      ref,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameController = ref.read(
      matrixGameControllerProvider(levelNumber).notifier,
    );
    final gameState = ref.watch(matrixGameControllerProvider(levelNumber));

    ref.listen<MatrixGameState>(matrixGameControllerProvider(levelNumber), (
      previous,
      next,
    ) {
      if (previous?.status == next.status) return;

      switch (next.status) {
        case GameStatus.questionWon:
          showPopupOverlay(
            context,
            GameResultPopup(
              isCorrect: true,
              onPrimaryAction: () {
                closePopupOverlay(ref);
                gameController.nextQuestion();
              },
            ),
            ref,
          );
          break;

        case GameStatus.levelWon:
          final finalScore = ref.read(matrixScoreProvider);
          showPopupOverlay(
            context,
            GameResultPopup(
              isCorrect: true,
              onPrimaryAction: () {
                closePopupOverlay(ref);
                context.pushReplacement(
                  '/minigames/matriks/end/$levelNumber/$finalScore',
                );
              },
            ),
            ref,
          );
          break;

        case GameStatus.incorrectMove:
          showPopupOverlay(
            context,
            GameResultPopup(
              isCorrect: false,
              onPrimaryAction: () {
                closePopupOverlay(ref);
                gameController.retryCurrentQuestion();
              },
              onSecondaryAction: () {
                closePopupOverlay(ref);
                gameController.skipQuestion();
              },
            ),
            ref,
          );
          break;
        case GameStatus.questionFailed:
          showPopupOverlay(
            context,
            GameResultPopup(
              isCorrect: false,
              isGameOver: true,
              onPrimaryAction: () {
                closePopupOverlay(ref);
                gameController.skipQuestion();
              },
            ),
            ref,
          );
          break;
        case GameStatus.levelLost:
          showPopupOverlay(
            context,
            GameResultPopup(
              isCorrect: false,
              isGameOver: true,
              onPrimaryAction: () {
                closePopupOverlay(ref);
                final finalScore = ref.read(matrixScoreProvider);
                context.pushReplacement(
                  '/minigames/matriks/end/$levelNumber/$finalScore',
                );
              },
            ),
            ref,
          );
          break;
        default:
          break;
      }
    });

    if (gameState.status == GameStatus.loading ||
        gameState.currentQuestion == null) {
      return const Scaffold(
        backgroundColor: AppColors.darkBackground,
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;

        final isPopupVisible = ref.read(popupVisibilityProvider);
        if (isPopupVisible) {
          closePopupOverlay(ref);
        } else {
          _showMenuPopup(context, ref);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
        appBar: MatrixGameAppBar(
          progress:
              'Soal ${gameState.currentQuestionIndex + 1}/${gameState.questions.length}',
          score: ref.watch(matrixScoreProvider),
          onMenuPressed: () => _showMenuPopup(context, ref),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInstruction(),
              SizedBox(height: 24.h),
              CodeBox(code: gameState.currentQuestion!.questionCode),
              SizedBox(height: 24.h),
              PointerGrid(
                level: gameState.currentQuestion!,
                levelNumber: levelNumber,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInstruction() {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        style: AppTypography.normal(),
        children: [
          const TextSpan(text: 'Arahkan pointer '),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Container(
              width: 16.sp,
              height: 16.sp,
              decoration: const BoxDecoration(
                color: AppColors.rewardYellow,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const TextSpan(text: ' sesuai dengan loop yang ada!'),
        ],
      ),
    );
  }
}