import 'package:flutter/material.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/features/5_materi/data/models/data/content_block_data.dart';

class ParagraphBlock extends StatelessWidget {
  const ParagraphBlock({super.key, required this.data, this.textStyle});

  final TextData data;
  final TextStyle? textStyle;

  static final _ytRe = RegExp(
    r'(https?:\/\/(?:www\.)?(?:youtube\.com|youtu\.be)\/[^\s)]+)',
    caseSensitive: false,
  );

  static String _stripYoutubeUrls(String input) {
    var out = input.replaceAll(_ytRe, '');
    out = out.replaceAll(RegExp(r'[ ]{2,}'), ' ');
    out = out.replaceAll(RegExp(r'\n{3,}'), '\n\n').trim();
    return out;
  }

  @override
  Widget build(BuildContext context) {
    final display = _stripYoutubeUrls(data.text);
    if (display.isEmpty) return const SizedBox.shrink();

    return Text(
      display,
      textAlign: TextAlign.justify,
      style: (textStyle ?? AppTypography.normal()).copyWith(
        color: AppColors.white,
      ),
    );
  }
}
