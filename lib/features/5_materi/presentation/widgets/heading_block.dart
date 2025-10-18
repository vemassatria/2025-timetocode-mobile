import 'package:flutter/material.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/features/5_materi/data/models/data/content_block_data.dart';

class HeadingBlock extends StatelessWidget {
  const HeadingBlock({super.key, required this.data});
  final HeadingData data;

  @override
  Widget build(BuildContext context) {
    final style = switch (data.headingType) {
      HeadingType.h1 => AppTypography.heading1(color: AppColors.white),
      HeadingType.h2 => AppTypography.heading2(color: AppColors.white),
      HeadingType.h3 => AppTypography.heading3(color: AppColors.white),
      HeadingType.h4 => AppTypography.heading4(color: AppColors.white),
      HeadingType.h5 => AppTypography.heading5(color: AppColors.white),
      HeadingType.h6 => AppTypography.heading6(color: AppColors.white),
    };
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(data.text, style: style),
    );
  }
}
