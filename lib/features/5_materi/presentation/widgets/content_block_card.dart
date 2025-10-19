import 'package:flutter/material.dart';
import 'package:timetocode/features/5_materi/data/models/content_block_model.dart';
import 'package:timetocode/features/5_materi/data/models/data/content_block_data.dart';
import 'heading_block.dart';
import 'paragraph_block.dart';
import 'list_block.dart';
import 'image_block.dart';
import 'table_block.dart';

/// Menampilkan widget blok konten sesuai tipe datanya.
/// Data diambil dari model [ContentBlockModel] yang sudah diparse dari JSON.
class ContentBlockCard extends StatelessWidget {
  final ContentBlockModel block;

  const ContentBlockCard({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    final data = block.data;

    // Cek tipe data-nya untuk menentukan widget yang digunakan
    switch (data.runtimeType) {
      case HeadingData:
        return HeadingBlock(data: data as HeadingData);

      case TextData:
        return ParagraphBlock(data: data as TextData);

      case ListData:
        return ListBlock(data: data as ListData);

      case ImageData:
        return ImageBlock(data: data as ImageData);

      case TableData:
        final d = data as TableData;
        return TableBlock(headers: [d.headers], rows: d.rows);

      default:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '⚠️ Tidak dapat menampilkan tipe blok: ${block.type}',
            style: const TextStyle(color: Colors.redAccent),
          ),
        );
    }
  }
}
