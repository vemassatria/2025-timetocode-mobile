import 'package:flutter/material.dart';

class ImageBlock extends StatelessWidget {
  const ImageBlock({super.key, required this.url, this.caption});
  final String url;
  final String? caption;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(12);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: radius,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              url,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: Theme.of(context).colorScheme.surface,
                alignment: Alignment.center,
                child: const Icon(Icons.broken_image_outlined),
              ),
            ),
          ),
        ),
        if (caption != null && caption!.trim().isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(caption!, style: Theme.of(context).textTheme.bodySmall),
        ],
      ],
    );
  }
}
