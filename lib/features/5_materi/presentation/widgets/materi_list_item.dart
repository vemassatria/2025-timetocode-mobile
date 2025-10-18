import 'package:flutter/material.dart';

class MateriListItem extends StatelessWidget {
  const MateriListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.completed,
    required this.enabled,
    this.onTap,
    // styling injeck—biar gampang samain figma dari screen
    required this.background,
    required this.borderColor,
    required this.titleColor,
    required this.subtitleColor,
    required this.accentBlue,
    required this.accentGreen,
  });

  final String title;
  final String subtitle;
  final bool completed;
  final bool enabled;
  final VoidCallback? onTap;

  // colors
  final Color background;
  final Color borderColor;
  final Color titleColor;
  final Color subtitleColor;
  final Color accentBlue;
  final Color accentGreen;

  @override
  Widget build(BuildContext context) {
    // ketebalan & radius sesuai figma look
    const radius = 14.0;

    return Opacity(
      opacity: enabled ? 1 : 0.6,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: borderColor, width: 1),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                offset: Offset(0, 6),
              ),
            ],
          ),
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // chip label kecil ala figma
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: accentBlue.withOpacity(0.14),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: accentBlue.withOpacity(0.26)),
                ),
                child: Text(
                  'Materi',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: accentBlue,
                    letterSpacing: .2,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // title & subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: titleColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: subtitleColor,
                        height: 1.35,
                        fontSize: 12.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              Icon(
                !enabled
                    ? Icons.lock_outline
                    : (completed
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked),
                size: 24,
                color: !enabled
                    ? subtitleColor
                    : (completed ? accentGreen : accentBlue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
