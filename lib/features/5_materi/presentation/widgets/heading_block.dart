import 'package:flutter/material.dart';
import 'package:timetocode/features/5_materi/data/models/data/content_block_data.dart';

class HeadingBlock extends StatelessWidget {
  const HeadingBlock({super.key, required this.head, required this.type});
  final String head;
  final HeadingType type;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final style = switch (type) {
      HeadingType.h1 => t.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
      HeadingType.h2 => t.titleLarge?.copyWith(fontWeight: FontWeight.w800),
      HeadingType.h3 => t.titleMedium?.copyWith(fontWeight: FontWeight.w800),
      HeadingType.h4 => t.titleSmall?.copyWith(fontWeight: FontWeight.w800),
      HeadingType.h5 => t.bodyLarge?.copyWith(fontWeight: FontWeight.w800),
      HeadingType.h6 => t.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
    };
    return Text(head, style: style);
  }
}
