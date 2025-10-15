import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/features/5_matriks/data/controllers/matrix_game_controller.dart';

class PointerGrid extends ConsumerWidget {
  const PointerGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(matrixGameControllerProvider);
    final gameController = ref.read(matrixGameControllerProvider.notifier);
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
                : Colors.transparent,
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
            Color circleColor;

            if (isActive) {
              circleColor = gameState.status == GameStatus.incorrectMove
                  ? AppColors.dangerRed
                  : AppColors.rewardYellow;
            } else {
              circleColor = gameState.status == GameStatus.levelWon
                  ? AppColors.xpGreen
                  : AppColors.technoBlue;
            }

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
              ),
            );
          },
        ),
      ),
    );
  }
}