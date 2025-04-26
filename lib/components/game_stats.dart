import 'package:flutter/widgets.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';

enum GameStatsType { correct, skipped, wrong }

class GameStats extends StatelessWidget {
  final int correct;
  final int skipped;
  final int wrong;
  final int total;

  const GameStats({
    super.key,
    required this.correct,
    required this.skipped,
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
      width: 104,
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: AppTypography.normalBold()),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            height: 64,
            color: secondaryColor,
            child: Center(
              child: Text('$count/$total', style: AppTypography.heading4()),
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
        const SizedBox(width: 8),
        _buildStatCard(
          title: 'Dilewati',
          count: skipped,
          total: total,
          primaryColor: AppColors.secondaryText,
          secondaryColor: AppColors.black3,
        ),
        const SizedBox(width: 8),
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
