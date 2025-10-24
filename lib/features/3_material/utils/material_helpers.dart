import 'package:timetocode/features/3_material/data/models/material_model.dart';
import 'package:timetocode/features/3_material/data/models/data/content_block_data.dart';

class MaterialHelpers {
  /// Ambil URL gambar pertama dari content blocks
  static String? firstImageUrl(MaterialModel m) {
    for (final b in m.content) {
      final url = b.data.maybeWhen(
        image: (url, caption) => url,
        orElse: () => null,
      );
      if (url != null && url.isNotEmpty) return url;
    }
    return null;
  }

  /// Ambil paragraf/text pertama
  static String? firstParagraph(MaterialModel m) {
    for (final b in m.content) {
      final text = b.data.maybeWhen(text: (body) => body, orElse: () => null);
      if (text != null && text.trim().isNotEmpty) return text.trim();
    }
    return null;
  }

  /// Gabungkan beberapa paragraf menjadi deskripsi panjang
  static String longDescription(MaterialModel m, {int maxChars = 1000}) {
    final buf = StringBuffer();
    for (final b in m.content) {
      final piece = b.data.maybeWhen(
        text: (body) => body.trim(),
        orElse: () => null,
      );
      if (piece != null && piece.isNotEmpty) {
        if (buf.isNotEmpty) buf.write('\n\n');
        buf.write(piece);
        if (buf.length > maxChars) break;
      }
    }
    final result = buf.toString();
    return result.isEmpty ? m.title : result;
  }

  /// (Opsional) cari link YouTube dari blok teks yang mengandung URL
  static String? firstYouTubeLink(MaterialModel m) {
    // Cocokkan https://youtu.be/... atau https://www.youtube.com/...
    final re = RegExp(
      r'(https?:\/\/(?:www\.)?(?:youtube\.com|youtu\.be)\/[^\s)]+)',
      caseSensitive: false,
    );

    for (final b in m.content) {
      final text = b.data.maybeWhen(text: (body) => body, orElse: () => null);
      if (text == null) continue;

      final match = re.firstMatch(text);
      if (match != null) {
        // bersihkan tanda baca penutup yang sering nempel
        var url = match.group(1)!;
        url = url.replaceAll(RegExp(r'[)\].,;!?]+$'), '');
        return url;
      }
    }
    return null;
  }
}
