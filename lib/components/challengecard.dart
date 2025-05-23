import 'package:flutter/material.dart';
import '../themes/colors.dart';
import 'star_display.dart';
import '../themes/typography.dart';

class ChallengeCard extends StatelessWidget {
  final int levelNumber;
  final int starCount;
  final bool isUnlocked;
  final VoidCallback? onTap;

  const ChallengeCard({
    Key? key,
    required this.levelNumber,
    required this.starCount,
    required this.isUnlocked,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isUnlocked ? onTap : null,
      child: Opacity(
        opacity: isUnlocked ? 1.0 : 0.6,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius: BorderRadius.circular(12),
            border: Border(
              left: BorderSide(color: AppColors.black1, width: 3),
              top: BorderSide(color: AppColors.black1, width: 3),
              right: BorderSide(color: AppColors.black1, width: 3),
              bottom: BorderSide(color: AppColors.black1, width: 10),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isUnlocked) ...[
                Text(
                  levelNumber.toString(),
                  style: AppTypography.heading1(color: AppColors.primaryText),
                ),
                const SizedBox(height: 12),
              ],
              isUnlocked
                  ? StarDisplay(starCount: starCount)
                  : _buildLockWithBorder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLockWithBorder() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.lock, color: AppColors.primaryText, size: 96),
        Positioned(child: Icon(Icons.lock, color: AppColors.black1, size: 94)),
      ],
    );
  }
}
