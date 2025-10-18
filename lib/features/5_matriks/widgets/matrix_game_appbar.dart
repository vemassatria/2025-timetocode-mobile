import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class MatrixGameAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String progress;
  final int score;
  final VoidCallback onMenuPressed;

  const MatrixGameAppBar({
    super.key,
    required this.progress,
    required this.score,
    required this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkBackground,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: AppColors.primaryText),
        onPressed: onMenuPressed,
      ),
      actions: [
        Row(
          children: [
            const Icon(Icons.book, color: AppColors.primaryText),
            SizedBox(width: 4.w),
            Text(progress, style: AppTypography.normal()),
            SizedBox(width: 16.w),
            const Icon(Icons.check, color: AppColors.rewardYellow),
            SizedBox(width: 4.w),
            Text(score.toString(), style: AppTypography.normal()),
            SizedBox(width: 16.w),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}