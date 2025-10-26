import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/widgets/star_display.dart';

class MatrixLevelCard extends StatelessWidget {
  final int levelNumber;
  final int starCount; 
  final bool isUnlocked;
  final VoidCallback? onTap;

  const MatrixLevelCard({
    super.key,
    required this.levelNumber,
    required this.starCount,
    required this.isUnlocked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final VoidCallback? effectiveOnTap = isUnlocked ? onTap : null;

    return GestureDetector(
      onTap: effectiveOnTap, 
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: const [
            BoxShadow( 
              color: AppColors.black1,
              offset: Offset(0, 4), 
              blurRadius: 0,
            ),
          ],
          border: Border.all(
            width: 2.w,
            color: isUnlocked ? AppColors.technoBlue : AppColors.secondaryText,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isUnlocked) ...[
              Text(
                levelNumber.toString(),
                style: AppTypography.heading2(color: AppColors.primaryText),
              ),
              SizedBox(height: 8.h),
                StarDisplay(
                    starCount: starCount,
                    size: 18.sp, 
                  ),
            ] else
              _buildLockIcon(), 
          ],
        ),
      ),
    );
  }

  Widget _buildLockIcon() {
    final iconSize = 60.sp;
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.lock, color: AppColors.secondaryText, size: iconSize + 4), 
        Positioned(child: Icon(Icons.lock, color: AppColors.black2, size: iconSize)),
      ],
    );
  }
}