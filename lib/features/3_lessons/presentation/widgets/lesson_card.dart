import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class LessonCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const LessonCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.darkBackground,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.black1, width: 2.w),
          boxShadow: const [
            BoxShadow(color: AppColors.black1, offset: Offset(0, 6)),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.largeBold(
                      color: AppColors.primaryText,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.small(color: AppColors.secondaryText),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.primaryText,
            ),
          ],
        ),
      ),
    );
  }
}
