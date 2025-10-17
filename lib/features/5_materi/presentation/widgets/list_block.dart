import 'package:flutter/material.dart';
import 'package:timetocode/features/5_materi/data/models/data/content_block_data.dart';

class ListBlock extends StatelessWidget {
  const ListBlock({
    super.key,
    required this.head,
    required this.listType,
    required this.items,
  });
  final String head;
  final ListType listType;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(
      context,
    ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (head.trim().isNotEmpty) ...[
          Text(head, style: titleStyle),
          const SizedBox(height: 8),
        ],
        ...List.generate(items.length, (i) {
          final marker = listType == ListType.ordered ? '${i + 1}.' : '•';
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 24, child: Text(marker)),
                const SizedBox(width: 8),
                Expanded(child: Text(items[i])),
              ],
            ),
          );
        }),
      ],
    );
  }
}
