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
            boxShadow: isUnlocked
                ? [
                    BoxShadow(
                      color: AppColors.black1.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Level number
              Text(
                levelNumber.toString(),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: isUnlocked ? Colors.white : Colors.white.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 16),
              // Star display
              isUnlocked
                  ? StarDisplay(starCount: starCount)
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        const StarDisplay(starCount: 0),
                        if (!isUnlocked)
                          Icon(
                            Icons.lock,
                            color: Colors.white.withOpacity(0.7),
                            size: 24,
                          ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}