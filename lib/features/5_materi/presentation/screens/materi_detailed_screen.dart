import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MateriDetailedScreen extends StatelessWidget {
  const MateriDetailedScreen({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    this.videoUrl,
  });

  final String title;
  final String imageUrl;
  final String description;
  final String? videoUrl;

  // fungsi buka link YouTube
  Future<void> _openYouTube(BuildContext context) async {
    final urlStr = videoUrl;
    if (urlStr == null || urlStr.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Link video tidak tersedia')),
      );
      return;
    }
    final Uri url = Uri.parse(urlStr);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Gagal membuka link video')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(title: Text(title), centerTitle: true, elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ... image + description
              if (videoUrl != null && videoUrl!.trim().isNotEmpty)
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    // ...
                    onPressed: () => _openYouTube(context),
                    child: const Text('Tonton Video Penjelasan'),
                  ),
                ),
              const SizedBox(height: 20),

              // --- Deskripsi panjang ---
              Text(
                description,
                style: textTheme.bodyLarge?.copyWith(height: 1.6),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 40),

              // --- Tombol ke video YouTube ---
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => _openYouTube(context),
                  child: const Text(
                    'Tonton Video Penjelasan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
