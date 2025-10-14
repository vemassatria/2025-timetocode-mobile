import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class ModuleCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isCompleted;

  const ModuleCard({
    super.key,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.black2,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.w),
        title: Text(
          title,
          style: AppTypography.small(color: AppColors.primaryText),
        ),
        subtitle: Text(
          description,
          style: AppTypography.verySmall(color: AppColors.secondaryText),
        ),
        trailing: Icon(
          isCompleted ? Icons.check_circle : Icons.arrow_forward_ios,
          color: isCompleted ? AppColors.skyByte : AppColors.primaryText,
          size: 24.sp,
        ),
        onTap: () {
          // Handle navigation to module detail
        },
      ),
    );
  }
}
