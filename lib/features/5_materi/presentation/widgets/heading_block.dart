import 'package:flutter/material.dart';
import 'package:timetocode/features/5_materi/data/models/data/content_block_data.dart';

class HeadingBlock extends StatelessWidget {
  const HeadingBlock({super.key, required this.data});
  final HeadingData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    final style = switch (data.headingType) {
      HeadingType.h1 => theme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
      HeadingType.h2 => theme.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      HeadingType.h3 => theme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.white70,
      ),
      _ => theme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.white70,
      ),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(data.text, style: style),
    );
  }
}
