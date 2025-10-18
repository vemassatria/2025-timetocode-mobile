import 'package:flutter/material.dart';
import 'package:timetocode/features/5_materi/data/models/data/content_block_data.dart';

class ListBlock extends StatelessWidget {
  const ListBlock({super.key, required this.data});
  final ListData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (data.head.isNotEmpty)
            Text(
              data.head,
              style: theme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
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
                style: theme.bodyMedium?.copyWith(
                  fontSize: 15,
                  color: Colors.white70,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
