import 'package:flutter/material.dart';

class TableBlock extends StatelessWidget {
  const TableBlock({super.key, required this.headers, required this.rows});
  final List<List<String>> headers;
  final List<List<String>> rows;

  @override
  Widget build(BuildContext context) {
    final cols = headers.isNotEmpty ? headers.first : <String>[];
    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            for (final h in cols)
              DataColumn(
                label: Text(
                  h,
                  style: const TextStyle(fontWeight: FontWeight.w700),
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
                        child: Text(cell),
                      ),
                    ),
                ],
              ),
          ],
          headingRowColor: WidgetStatePropertyAll(
            Theme.of(context).colorScheme.surfaceContainerHigh,
          ),
          dataRowMinHeight: 44,
          dataRowMaxHeight: 64,
          border: TableBorder.all(
            color: Theme.of(context).dividerColor.withOpacity(.2),
          ),
          dividerThickness: .0,
        ),
      ),
    );
  }
}
