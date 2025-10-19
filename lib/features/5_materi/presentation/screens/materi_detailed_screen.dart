import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ⬇️ tambah ini
import 'package:timetocode/features/5_materi/utils/materi_helpers.dart';

import '../../data/models/materi_model.dart';
import '../widgets/content_block_card.dart';
import 'package:timetocode/app/config/theme/colors.dart';

class MateriDetailedScreen extends StatelessWidget {
  const MateriDetailedScreen({super.key, required this.materi});
  final MateriModel materi;

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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Gagal membuka link video')));
    }
  }

  @override
  Widget build(BuildContext context) {
    const bgNavy = AppColors.darkBackground;

    final String? youtubeUrl = MateriHelpers.firstYouTubeLink(materi);

    return Scaffold(
      backgroundColor: bgNavy,
      appBar: AppBar(
        backgroundColor: bgNavy,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          materi.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 22,
            letterSpacing: .2,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          itemCount: materi.content.length,
          itemBuilder: (_, i) => ContentBlockCard(block: materi.content[i]),
          separatorBuilder: (_, __) => const SizedBox(height: 16),
        ),
      ),

      // ⬇️ tombol ungu ala figma, hanya tampil jika link ditemukan
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
                      backgroundColor: const Color(0xFF7B61FF), // ungu lembut
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
