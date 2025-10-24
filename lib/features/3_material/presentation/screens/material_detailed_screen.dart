import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // <--- tambahkan ini
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/features/3_material/utils/material_helpers.dart';
import '../../data/models/material_model.dart';
import '../widgets/content_block_card.dart';

class MaterialDetailedScreen extends ConsumerStatefulWidget {
  final MaterialModel material;

  const MaterialDetailedScreen({super.key, required this.material});

  @override
  ConsumerState<MaterialDetailedScreen> createState() =>
      _MaterialDetailedScreenState();
}

class _MaterialDetailedScreenState
    extends ConsumerState<MaterialDetailedScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _openYouTube(String url) async {
    final uri = Uri.tryParse(url);
    if (url.trim().isEmpty) {
      _showMessage('Link video tidak tersedia');
    } else if (uri == null) {
      _showMessage('URL tidak valid');
    } else if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      _showMessage('Gagal membuka link video');
    }
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final youtubeUrl = MaterialHelpers.firstYouTubeLink(widget.material);

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Materi", style: AppTypography.heading6()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryText),
          onPressed: () {
            ref.read(soundEffectServiceProvider.notifier).playButtonClick1();
            Navigator.maybePop(context);
          },
        ),
        toolbarHeight: 56.h,
        backgroundColor: AppColors.surfaceDark,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.black1),
        ),
      ),
      body: SafeArea(
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: false,
          thickness: 4,
          radius: Radius.circular(8.r),
          child: ListView.separated(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            itemCount: widget.material.content.length,
            itemBuilder: (_, i) =>
                ContentBlockCard(block: widget.material.content[i]),
            separatorBuilder: (_, _) => SizedBox(height: 24.h),
          ),
        ),
      ),
      bottomNavigationBar: youtubeUrl == null
          ? null
          : SafeArea(
              top: false,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  border: Border(
                    top: BorderSide(color: AppColors.black1, width: 1.w),
                  ),
                ),
                child: CustomButton(
                  label: 'Tonton Video Penjelasan',
                  color: ButtonColor.purple,
                  onPressed: () => _openYouTube(youtubeUrl),
                ),
              ),
            ),
    );
  }
}
