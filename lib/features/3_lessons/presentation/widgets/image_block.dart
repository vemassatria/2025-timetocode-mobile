import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/features/3_lessons/data/models/data/content_block_data.dart';

class ImageBlock extends StatelessWidget {
  const ImageBlock({super.key, required this.data});

  final ImageData data;

  bool _isNetworkUrl(String url) =>
      url.startsWith('http://') || url.startsWith('https://');

  String _normalizeAssetPath(String rawPath) {
    return 'assets/images/${rawPath.trim().replaceFirst(RegExp(r'^\./'), '').replaceFirst(RegExp(r'^assets/images/'), '')}';
  }

  Future<bool> _assetExists(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rawUrl = data.url.trim();
    final isNetwork = _isNetworkUrl(rawUrl);
    final assetPath = _normalizeAssetPath(rawUrl);

    debugPrint('raw url: ${data.url}');
    debugPrint('isNetwork: $isNetwork');
    debugPrint('assetPath: $assetPath');

    final imageWidget = isNetwork
        ? _buildNetworkImage(rawUrl, context)
        : _buildAssetImage(assetPath, context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: imageWidget,
        ),
        if ((data.caption ?? '').isNotEmpty) ...[
          SizedBox(height: 8.h),
          _buildCaption(data.caption!),
        ],
      ],
    );
  }

  Widget _buildNetworkImage(String url, BuildContext context) {
    return Image.network(
      url,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) =>
          _buildErrorBox(context, 'Gagal memuat URL:\n$url'),
    );
  }

  Widget _buildAssetImage(String assetPath, BuildContext context) {
    return FutureBuilder<bool>(
      future: _assetExists(assetPath),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return _buildSkeleton();
        }
        if (snapshot.data != true) {
          return _buildErrorBox(context, 'Asset tidak ditemukan:\n$assetPath');
        }
        return Image.asset(
          assetPath,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget _buildCaption(String caption) {
    return Text(
      caption,
      textAlign: TextAlign.center,
      style: AppTypography.verySmall(
        color: AppColors.gray1,
      ).copyWith(fontStyle: FontStyle.italic),
    );
  }

  Widget _buildErrorBox(BuildContext context, String message) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.dangerRed,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.dangerRed),
      ),
      child: Text(
        message,
        style: AppTypography.normal(color: AppColors.primaryText),
      ),
    );
  }

  Widget _buildSkeleton() {
    return Container(
      width: double.infinity,
      height: 160.h,
      decoration: BoxDecoration(
        color: AppColors.black3,
        borderRadius: BorderRadius.circular(16.r),
      ),
    );
  }
}
