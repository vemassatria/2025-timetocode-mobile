import 'package:flutter/material.dart';
import 'package:timetocode/features/5_materi/data/models/content_block_model.dart';
import 'package:timetocode/features/5_materi/data/models/data/content_block_data.dart';
import 'package:timetocode/features/5_materi/presentation/widgets/heading_block.dart';
import 'package:timetocode/features/5_materi/presentation/widgets/paragraph_block.dart';
import 'package:timetocode/features/5_materi/presentation/widgets/image_block.dart';
import 'package:timetocode/features/5_materi/presentation/widgets/table_block.dart';
import 'package:timetocode/features/5_materi/presentation/widgets/list_block.dart';

class ContentBlockCard extends StatelessWidget {
  const ContentBlockCard({super.key, required this.block});
  final ContentBlockModel block;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(.4),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: _render(block.data),
    );
  }

  Widget _render(ContentBlockData data) {
    return data.when(
      heading: (head, type) => HeadingBlock(head: head, type: type),
      text: (body) => ParagraphBlock(body: body),
      image: (url, caption) => ImageBlock(url: url, caption: caption),
      table: (headers, rows) => TableBlock(headers: headers, rows: rows),
      list: (head, listType, items) =>
          ListBlock(head: head, listType: listType, items: items),
    );
  }
}
