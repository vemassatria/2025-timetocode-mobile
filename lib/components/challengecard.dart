import 'package:flutter/material.dart';
import '../themes/colors.dart';
import 'star_display.dart';

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
            boxShadow: [
              BoxShadow(
                color: AppColors.black1,
                offset: const Offset(2, 6),
                spreadRadius: 6,
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isUnlocked) ...[
                Text(
                  levelNumber.toString(),
                  style: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                ),
                const SizedBox(height: 12),
              ],
              // Star display & Lock
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
        // Border putih untuk lock
        Icon(Icons.lock, color: AppColors.primaryText, size: 96),
        Positioned(child: Icon(Icons.lock, color: AppColors.black1, size: 94)),
      ],
    );
  }
}
