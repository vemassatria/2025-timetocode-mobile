import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/features/3_material/data/models/data/content_block_data.dart';

class ListBlock extends StatelessWidget {
  const ListBlock({super.key, required this.data});

  final ListData data;

  bool get _hasHeader => data.head.trim().isNotEmpty;
  bool get _isOrdered => data.listType == ListType.ordered;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_hasHeader)
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              data.head,
              style: AppTypography.mediumBold(color: AppColors.primaryText),
            ),
          ),
        ...data.items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final marker = _isOrdered ? '${index + 1}.' : '•';

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20.w,
                child: Text(
                  marker,
                  style: AppTypography.normal(color: AppColors.primaryText),
                ),
              ),
              Expanded(
                child: Text(
                  item,
                  style: AppTypography.normal(color: AppColors.primaryText),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
