import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../app/config/theme/colors.dart';
import '../../../../../../app/config/theme/typography.dart';

class MinigamesSelectionCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback? onTap;

  const MinigamesSelectionCard({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 2.w),
          boxShadow: const [
            BoxShadow(color: AppColors.black1, offset: Offset(0, 6)),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 124.h,
              width: double.infinity,
              child: Image.asset(image, fit: BoxFit.contain),
            ),

            SizedBox(height: 16.h),

            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: AppTypography.heading6(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
