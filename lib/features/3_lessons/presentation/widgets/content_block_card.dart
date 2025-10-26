import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/features/3_lessons/data/models/content_block_model.dart';
import 'package:timetocode/features/3_lessons/data/models/data/content_block_data.dart';
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

    switch (data.runtimeType) {
      case const (HeadingData):
        return HeadingBlock(data: data as HeadingData);

      case const (TextData):
        return ParagraphBlock(data: data as TextData);

      case const (ListData):
        return ListBlock(data: data as ListData);

      case const (ImageData):
        return ImageBlock(data: data as ImageData);

      case const (TableData):
        final d = data as TableData;
        return TableBlock(headers: d.headers, rows: d.rows);
      default:
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Text(
            '⚠️ Tidak dapat menampilkan tipe blok: ${block.type}',
            style: const TextStyle(color: Colors.redAccent),
          ),
        );
    }
  }
}
