import 'package:flutter/material.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/features/3_material/data/models/data/content_block_data.dart';

class HeadingBlock extends StatelessWidget {
  const HeadingBlock({super.key, required this.data});
  final HeadingData data;

  @override
  Widget build(BuildContext context) {
    final style = switch (data.headingType) {
      HeadingType.mainTitle => AppTypography.heading2(),
      HeadingType.topicTitle => AppTypography.heading4(),
      HeadingType.subTopicTitle => AppTypography.heading5(),
    };
    return Text(data.text, style: style);
  }
}
