import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/config/theme/colors.dart';
import '../../../../app/widgets/star_display.dart';
import '../../../../app/config/theme/typography.dart';

class ChallengeCard extends StatelessWidget {
  final int levelNumber;
  final int starCount;
  final bool isUnlocked;
  final VoidCallback? onTap;

  const ChallengeCard({
    super.key,
    required this.levelNumber,
    required this.starCount,
    required this.isUnlocked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: const [
            BoxShadow(
              color: AppColors.black1,
              offset: Offset(0, 6),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
          border: Border.all(width: 2.w),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isUnlocked) ...[
              Text(
                levelNumber.toString(),
                style: AppTypography.heading1(color: AppColors.primaryText),
              ),
              SizedBox(height: 2.h),
              StarDisplay(starCount: starCount),
            ] else
              _buildLockWithBorder(),
          ],
        ),
      ),
    );
  }

  Widget _buildLockWithBorder() {
    return const Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.lock, color: AppColors.primaryText, size: 96),
        Positioned(child: Icon(Icons.lock, color: AppColors.black1, size: 94)),
      ],
    );
  }
}
