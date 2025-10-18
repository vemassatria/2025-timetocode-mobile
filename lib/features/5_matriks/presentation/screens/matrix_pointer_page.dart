import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/popups/menu_popup.dart';
import 'package:timetocode/features/0_core/widgets/code_box.dart';
import 'package:timetocode/features/5_matriks/data/controllers/matrix_game_controller.dart';
import 'package:timetocode/features/5_matriks/data/models/matrix_level_model.dart';
import 'package:timetocode/features/5_matriks/data/providers/matrix_level_provider.dart';
import 'package:timetocode/features/5_matriks/widgets/game_result_popup.dart';
import 'package:timetocode/features/5_matriks/widgets/matrix_game_appbar.dart';
import 'package:timetocode/features/5_matriks/widgets/pointer_grid.dart';

class MatrixPointerPage extends ConsumerWidget {
  final MatrixLevelModel level;

  const MatrixPointerPage({super.key, required this.level});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameController = ref.read(matrixGameControllerProvider(level).notifier);
    final gameState = ref.watch(matrixGameControllerProvider(level));

    ref.listen<MatrixGameState>(matrixGameControllerProvider(level), (previous, next) {
      if (previous?.status == next.status) return;

      switch (next.status) {
        case GameStatus.levelWon:
          showPopupOverlay(context, GameResultPopup(isCorrect: true, onPrimaryAction: () {
              closePopupOverlay(ref);
              gameController.nextLevel();
            },), ref,);
          break;
        case GameStatus.incorrectMove:
          showPopupOverlay(context, GameResultPopup(isCorrect: false, onPrimaryAction: () {
              closePopupOverlay(ref);
              gameController.retryLevelAfterMistake();
            }, onSecondaryAction: () {
              closePopupOverlay(ref);
              gameController.nextLevel();
            },), ref,);
          break;
        case GameStatus.levelLost:
          showPopupOverlay(context, GameResultPopup(
            isCorrect: false,
            isGameOver: true,
             onPrimaryAction: () {
              closePopupOverlay(ref);
              gameController.nextLevel();
            },
          ), ref,);
          break;
        default:
          break;
      }
    });

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: MatrixGameAppBar(
        progress: '${gameState.level.levelId}/${ref.watch(matrixLevelsProvider).asData?.value.length ?? ''}',
        score: 0,
        onMenuPressed: () {
          showPopupOverlay(context, MenuPopup(
              onRestart: () {
                closePopupOverlay(ref);
                gameController.restartLevel();
              },
              onExit: () {
                closePopupOverlay(ref);
                gameController.exitGame();
              },
              onClose: () => closePopupOverlay(ref),
              onGoBack: () => goBackToPreviousOverlay(context, ref),
            ), ref,);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CodeBox(code: gameState.level.code),
            SizedBox(height: 24.h),
            PointerGrid(level: level),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}