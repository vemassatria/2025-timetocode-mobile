import 'package:flutter/material.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class TableBlock extends StatelessWidget {
  const TableBlock({super.key, required this.headers, required this.rows});

  final List<String> headers;
  final List<List<String>> rows;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            for (final h in headers)
              DataColumn(
                label: Text(
                  h,
                  style: AppTypography.normalBold(color: AppColors.primaryText),
                ),
              ),
          ],
          rows: [
            for (final r in rows)
              DataRow(
                cells: [
                  for (final cell in r)
                    DataCell(
                      ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 96),
                        child: Text(
                          cell,
                          style: AppTypography.small(
                            color: AppColors.primaryText,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
          ],
          headingRowColor: const WidgetStatePropertyAll(AppColors.surfaceDark),
          dataRowMinHeight: 44,
          dataRowMaxHeight: 64,
          border: TableBorder.all(color: AppColors.gray1, width: 1),
          dividerThickness: .0,
        ),
      ),
    );
  }
}
