import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class LessonListItem extends StatelessWidget {
  const LessonListItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.showChevron = true, // set false kalau mau tanpa ikon
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.black1, width: 2.w),
          boxShadow: const [
            BoxShadow(
              color: AppColors.black1,
              offset: Offset(0, 6),
            ), // bayangan bawah
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Teks
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.normalBold(
                      color: AppColors.primaryText,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.small(
                      color: AppColors.secondaryText,
                    ).copyWith(height: 1.35),
                  ),
                ],
              ),
            ),

            if (showChevron) ...[
              SizedBox(width: 12.w),
              Icon(
                Icons.chevron_right_rounded,
                size: 24.w,
                color: AppColors.primaryText,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
