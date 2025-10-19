import 'package:flutter/material.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class MateriListItem extends StatelessWidget {
  const MateriListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.completed, // tetap ada biar kompatibel, tidak dipakai
    required this.enabled,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final bool completed; // tidak dipakai (disengaja)
  final bool enabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const radius = 14.0;
    final cs = Theme.of(context).colorScheme;

    final border = cs.outlineVariant.withValues(alpha: 0.5);

    final titleStyle = AppTypography.normalBold(color: AppColors.primaryText);
    final subtitleStyle = AppTypography.small(color: AppColors.secondaryText);

    return Opacity(
      opacity: enabled ? 1 : 0.6,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.blueTransparent,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: border, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.black1.withValues(alpha: 0.35),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: titleStyle,
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: subtitleStyle.copyWith(height: 1.35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
