import 'package:flutter/material.dart';

class MateriCard extends StatelessWidget {
  const MateriCard({
    super.key,
    required this.title,
    required this.thumbnailUrl,
    required this.snippet,
    required this.onTap,
  });

  final String title;
  final String? thumbnailUrl;
  final String snippet;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
          color: cs.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: (thumbnailUrl != null && thumbnailUrl!.isNotEmpty)
                    ? Image.network(
                        thumbnailUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Container(
                          color: cs.surface,
                          alignment: Alignment.center,
                          child: const Icon(Icons.image_not_supported_outlined),
                        ),
                      )
                    : Container(
                        color: cs.surface,
                        alignment: Alignment.center,
                        child: const Icon(Icons.image_outlined),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    snippet,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
