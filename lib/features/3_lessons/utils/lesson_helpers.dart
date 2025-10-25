import 'package:timetocode/features/3_lessons/data/models/lesson_model.dart';
import 'package:timetocode/features/3_lessons/data/models/data/content_block_data.dart';

class LessonHelpers {
  static String? firstImageUrl(LessonModel m) {
    for (final b in m.content) {
      final d = b.data;
      if (d is ImageData) {
        final url = d.url;
        if (url.isNotEmpty) return url;
      }
    }
    return null;
  }

  static String? firstParagraph(LessonModel m) {
    for (final b in m.content) {
      final d = b.data;
      if (d is TextData) {
        final t = d.text.trim();
        if (t.isNotEmpty) return t;
      }
    }
    return null;
  }

  static String longDescription(LessonModel m, {int maxChars = 1000}) {
    final buf = StringBuffer();
    for (final b in m.content) {
      final d = b.data;
      if (d is TextData) {
        final piece = d.text.trim();
        if (piece.isNotEmpty) {
          if (buf.isNotEmpty) buf.write('\n\n');
          buf.write(piece);
          if (buf.length > maxChars) break;
        }
      }
    }
    final result = buf.toString();
    return result.isEmpty ? m.title : result;
  }

  static String? firstYouTubeLink(LessonModel m) {
    final urlRegex = RegExp(
      r'https?://(?:www\.)?(?:youtube\.com|youtu\.be)/[^\s)]+',
      caseSensitive: false,
    );
    for (final b in m.content) {
      final d = b.data;
      if (d is TextData) {
        final match = urlRegex.firstMatch(d.text);
        if (match != null) return match.group(0);
      }
    }
    return null;
  }
}
