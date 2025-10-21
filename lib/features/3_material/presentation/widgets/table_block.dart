import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class TableBlock extends StatefulWidget {
  final List<List<String>> headers;
  final List<List<String>> rows;

  const TableBlock({super.key, required this.headers, required this.rows});

  @override
  State<TableBlock> createState() => _TableBlockState();
}

class _TableBlockState extends State<TableBlock> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cols = widget.headers.isNotEmpty ? widget.headers.first : <String>[];

    final headerStyle = AppTypography.smallNormalBold(
      color: AppColors.primaryText,
    );
    final cellStyle = AppTypography.small();
    const borderColor = AppColors.gray1;
    const headerBgColor = AppColors.blueTransparent;

    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: DataTableTheme(
          data: DataTableThemeData(
            headingTextStyle: headerStyle,
            dataTextStyle: cellStyle,
            headingRowColor: const WidgetStatePropertyAll(headerBgColor),
            dividerThickness: 0,
          ),
          child: DataTable(
            columnSpacing: 24.w,
            horizontalMargin: 16.w,
            columns: [
              for (final h in cols)
                DataColumn(label: Text(h, style: headerStyle)),
            ],
            rows: [
              for (final r in widget.rows)
                DataRow(
                  cells: [
                    for (int c = 0; c < cols.length; c++)
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 96.w),
                          child: Text(
                            c < r.length ? r[c] : '',
                            style: cellStyle,
                          ),
                        ),
                      ),
                  ],
                ),
            ],
            dataRowMinHeight: 40.h,
            dataRowMaxHeight: 64.h,
            border: TableBorder.all(color: borderColor, width: 1.w),
          ),
        ),
      ),
    );
  }
}
