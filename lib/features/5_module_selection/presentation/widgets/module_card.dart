import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class ModuleCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isCompleted;
  final VoidCallback? onTap;

  const ModuleCard({
    super.key,
    required this.title,
    required this.description,
    required this.isCompleted,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Card tapped: $title');
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: AppColors.black2,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.small(color: AppColors.primaryText),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      description,
                      style: AppTypography.verySmall(
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                isCompleted ? Icons.check_circle : Icons.arrow_forward_ios,
                color: isCompleted ? AppColors.skyByte : AppColors.primaryText,
                size: 24.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
