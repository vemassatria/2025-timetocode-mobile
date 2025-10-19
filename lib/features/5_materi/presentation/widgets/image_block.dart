import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:timetocode/features/5_materi/data/models/data/content_block_data.dart';

class ImageBlock extends StatelessWidget {
  const ImageBlock({super.key, required this.data});
  final ImageData data;

  bool _isNetwork(String s) =>
      s.startsWith('http://') || s.startsWith('https://');

  String _normalizeAssetPath(String raw) {
    var s = raw.trim();
    s = s.replaceFirst(RegExp(r'^\./'), '');
    s = s.replaceFirst(RegExp(r'^assets/images/'), '');
    return 'assets/images/$s';
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
    final raw = data.url.trim();
    final isNet = _isNetwork(raw);
    final assetPath = _normalizeAssetPath(raw);

    debugPrint('raw url: ${data.url}');
    debugPrint('isNetwork: $isNet');
    debugPrint('assetPath: $assetPath');

    Widget img;
    if (isNet) {
      img = Image.network(
        raw,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            _errorBox(context, 'Gagal memuat URL:\n$raw'),
      );
    } else {
      img = FutureBuilder<bool>(
        future: _assetExists(assetPath),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return _skeleton(context);
          }
          if (snap.data != true) {
            return _errorBox(context, 'Asset tidak ditemukan:\n$assetPath');
          }
          return Image.asset(
            assetPath,
            width: double.infinity,
            fit: BoxFit.cover,
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(12), child: img),
        if ((data.caption ?? '').isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            data.caption!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white70,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ],
    );
  }

  Widget _errorBox(BuildContext context, String msg) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.red.withOpacity(.12),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.red.withOpacity(.35)),
    ),
    child: Text(msg, style: const TextStyle(color: Colors.redAccent)),
  );

  Widget _skeleton(BuildContext context) => Container(
    width: double.infinity,
    height: 160,
    decoration: BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
