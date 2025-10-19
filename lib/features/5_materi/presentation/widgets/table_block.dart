import 'package:flutter/material.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class TableBlock extends StatelessWidget {
  const TableBlock({super.key, required this.headers, required this.rows});

  /// Expect: [["Col1","Col2",...]]
  final List<List<String>> headers;

  /// Expect: [["r1c1","r1c2",...], ["r2c1","r2c2",...], ...]
  final List<List<String>> rows;

  @override
  Widget build(BuildContext context) {
    // ambil baris header pertama sebagai daftar kolom
    final List<String> cols = headers.isNotEmpty
        ? headers.first
        : const <String>[];

    // style khusus pakai AppTypography + AppColors
    final headerStyle = AppTypography.smallNormalBold(
      color: AppColors.primaryText,
    );
    final cellStyle = AppTypography.small(color: AppColors.white);
    final borderColor = AppColors.white.withOpacity(.12);
    final headerBgColor = AppColors.blueTransparent.withOpacity(.18);

    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTableTheme(
          data: DataTableThemeData(
            headingTextStyle: headerStyle,
            dataTextStyle: cellStyle,
            headingRowColor: WidgetStatePropertyAll(headerBgColor),
            dataRowColor: WidgetStatePropertyAll(
              AppColors.white.withOpacity(.05),
            ),
            dividerThickness: 0.0,
          ),
          child: DataTable(
            columnSpacing: 20,
            horizontalMargin: 12,
            columns: [
              for (final h in cols)
                DataColumn(label: Text(h, style: headerStyle)),
            ],
            rows: [
              for (final r in rows)
                DataRow(
                  cells: [
                    for (int c = 0; c < cols.length; c++)
                      DataCell(
                        ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 96),
                          child: Text(
                            (c < r.length) ? r[c] : '',
                            style: cellStyle,
                          ),
                        ),
                      ),
                  ],
                ),
            ],
            dataRowMinHeight: 44,
            dataRowMaxHeight: 64,
            border: TableBorder.all(color: borderColor, width: 1),
          ),
        ),
      ),
    );
  }
}
