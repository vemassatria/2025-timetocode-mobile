import 'package:flutter/material.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/features/5_materi/data/models/data/content_block_data.dart';

class ListBlock extends StatelessWidget {
  const ListBlock({super.key, required this.data});
  final ListData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (data.head.isNotEmpty)
            Text(
              data.head,
              style: AppTypography.normalBold(color: AppColors.white),
            ),
          const SizedBox(height: 4),
          ...List.generate(data.items.length, (index) {
            final marker = data.listType == ListType.ordered
                ? '${index + 1}.'
                : '•';
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                '$marker ${data.items[index]}',
                style: AppTypography.normal(color: AppColors.white),
              ),
            );
          }),
        ],
      ),
    );
  }
}
