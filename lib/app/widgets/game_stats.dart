import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

enum GameStatsType { correct, wrong }

class GameStats extends StatelessWidget {
  final int correct;
  final int wrong;
  final int total;

  const GameStats({
    super.key,
    required this.correct,
    required this.wrong,
    required this.total,
  });

  Widget _buildStatCard({
    required String title,
    required int count,
    required int total,
    required Color primaryColor,
    required Color secondaryColor,
  }) {
    return Container(
      width: 104.w,
      padding: EdgeInsets.fromLTRB(8.w, 4.h, 8.w, 8.h),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTypography.smallBold().copyWith(
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: 4.h),
          Container(
            width: double.infinity,
            height: 64.h,
            color: secondaryColor,
            child: Center(
              child: Text(
                '$count/$total',
                style: AppTypography.heading4().copyWith(
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStatCard(
          title: 'Tepat',
          count: correct,
          total: total,
          primaryColor: AppColors.xpGreen,
          secondaryColor: AppColors.greenStats,
        ),
        SizedBox(width: 16.w),
        _buildStatCard(
          title: 'Salah',
          count: wrong,
          total: total,
          primaryColor: AppColors.dangerRed,
          secondaryColor: AppColors.darkRed,
        ),
      ],
    );
  }
}
