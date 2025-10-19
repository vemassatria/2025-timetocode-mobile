import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/controllers/matrix_game_controller.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/models/matrix_level_model.dart';

class PointerGrid extends ConsumerWidget {
  final MatrixLevelModel level;

  const PointerGrid({super.key, required this.level});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(matrixGameControllerProvider(level));
    final gameController = ref.read(
      matrixGameControllerProvider(level).notifier,
    );
    const minSwipeVelocity = 100;

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > minSwipeVelocity) {
          gameController.attemptMove("right");
        } else if (details.primaryVelocity! < -minSwipeVelocity) {
          gameController.attemptMove("left");
        }
      },
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! > minSwipeVelocity) {
          gameController.attemptMove("down");
        } else if (details.primaryVelocity! < -minSwipeVelocity) {
          gameController.attemptMove("up");
        }
      },
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: gameState.status == GameStatus.incorrectMove
                ? AppColors.dangerRed
                : AppColors.white,
            width: 2.w,
          ),
        ),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            final bool isActive = index == gameState.pointerPosition;

            Color outerColor = AppColors.technoBlue;
            Color innerColor = Colors.transparent;
            double innerPadding = 8.w;

            if (isActive) {
              outerColor = AppColors.deepAzure;
              innerColor = gameState.status == GameStatus.incorrectMove
                  ? AppColors.dangerRed
                  : AppColors.rewardYellow;
            } else if (gameState.status == GameStatus.levelWon) {
              outerColor = AppColors.xpGreen;
            }

            return Container(
              decoration: BoxDecoration(
                color: outerColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(innerPadding),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: innerColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
