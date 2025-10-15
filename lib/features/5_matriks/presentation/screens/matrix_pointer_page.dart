import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/features/0_core/widgets/code_box.dart';
import 'package:timetocode/features/5_matriks/data/controllers/matrix_game_controller.dart';
import 'package:timetocode/features/5_matriks/widgets/game_result_popup.dart';
import 'package:timetocode/features/5_matriks/widgets/matrix_game_appbar.dart';
import 'package:timetocode/features/5_matriks/widgets/pointer_grid.dart';

class MatrixPointerPage extends ConsumerWidget {
  const MatrixPointerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<MatrixGameState>(matrixGameControllerProvider, (previous, next) {
      final gameController = ref.read(matrixGameControllerProvider.notifier);

      if (next.status == GameStatus.levelWon) {
        showPopupOverlay(
          context,
          GameResultPopup(
            isCorrect: true,
            onPrimaryAction: () {
              closePopupOverlay(ref);
              gameController.nextLevel();
            },
          ),
          ref,
        );
      }
      else if (next.status == GameStatus.incorrectMove && next.lives > 0) {
        showPopupOverlay(
          context,
          GameResultPopup(
            isCorrect: false,
            onPrimaryAction: () {
              closePopupOverlay(ref);
              gameController.retryLevelAfterMistake();
            },
            onSecondaryAction: () {
              closePopupOverlay(ref);
              gameController.nextLevel();
            },
          ),
          ref,
        );
      }
      else if (next.status == GameStatus.levelLost) {
         print("NYAWA HABIS, LEVEL GAGAL");
         gameController.nextLevel();
      }
    });

    final code = ref.watch(matrixGameControllerProvider.select((s) => s.level.code));

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: const MatrixGameAppBar(
        progress: '1/15',
        score: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CodeBox(code: code),
            SizedBox(height: 24.h),
            const PointerGrid(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}