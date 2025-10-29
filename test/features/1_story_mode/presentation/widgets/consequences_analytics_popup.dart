import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class ConsequencesAnalyticsPopup extends StatelessWidget {
  final int statLevel;
  final Map<String, int>? consequences;

  const ConsequencesAnalyticsPopup({
    super.key,
    required this.statLevel,
    required this.consequences,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 610.h,
      width: 300.w,
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.white, width: 1.w),
      ),
      child: Column(
        children: [
          Text(
            'Analisis Konsekuensi - Level $statLevel',
            style: AppTypography.heading6(color: AppColors.white),
          ),
          const Divider(color: Colors.white, thickness: 2.0),
          const SizedBox(height: 16.0),
          Expanded(
            child: consequences == null || consequences!.isEmpty
                ? Center(
                    child: Text(
                      'Tidak ada data konsekuensi tersedia.',
                      style: AppTypography.mediumBold(color: AppColors.white),
                    ),
                  )
                : ListView.builder(
                    itemCount: consequences!.length,
                    itemBuilder: (context, index) {
                      final entry = consequences!.entries.elementAt(index);
                      return ListTile(
                        title: Text(
                          entry.key,
                          style: AppTypography.normalBold(
                            color: AppColors.white,
                          ),
                        ),
                        trailing: Text(
                          entry.value.toString(),
                          style: AppTypography.normalBold(
                            color: AppColors.white,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
