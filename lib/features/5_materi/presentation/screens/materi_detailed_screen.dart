import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timetocode/features/5_materi/utils/materi_helpers.dart';
import '../../data/models/materi_model.dart';
import '../widgets/content_block_card.dart';
import 'package:timetocode/app/config/theme/colors.dart';

class MateriDetailedScreen extends StatelessWidget {
  final MateriModel materi;

  const MateriDetailedScreen({super.key, required this.materi});

  Future<void> _openYouTube(BuildContext context, String urlStr) async {
    if (urlStr.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Link video tidak tersedia')),
      );
      return;
    }
    final ok = await launchUrl(
      Uri.parse(urlStr),
      mode: LaunchMode.externalApplication,
    );
    if (!ok) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Gagal membuka link video')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final String? youtubeUrl = MateriHelpers.firstYouTubeLink(materi);

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          "Materi",
          maxLines: 1,
          style: AppTypography.heading6(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          itemCount: materi.content.length,
          itemBuilder: (_, i) => ContentBlockCard(block: materi.content[i]),
          separatorBuilder: (_, _) => SizedBox(height: 16.h),
        ),
      ),

      bottomNavigationBar: youtubeUrl == null
          ? null
          : SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.cyberPurple,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => _openYouTube(context, youtubeUrl),
                    child: const Text(
                      'Tonton Video Penjelasan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
