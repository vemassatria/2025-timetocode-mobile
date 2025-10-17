import 'package:flutter/material.dart';

class ParagraphBlock extends StatelessWidget {
  const ParagraphBlock({super.key, required this.body});
  final String body;

  @override
  Widget build(BuildContext context) => SelectableText(
    body,
    style: Theme.of(context).textTheme.bodyLarge,
    textAlign: TextAlign.start,
  );
}
