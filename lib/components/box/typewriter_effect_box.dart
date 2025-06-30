// lib/components/box/typewriter_effect_box.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';

class TypewriterEffectBox extends ConsumerStatefulWidget {
  final String text;
  final ValueKey textKey;
  final TextStyle textStyle;
  final VoidCallback
  onFinished; // Callback untuk memberitahu parent bahwa animasi selesai

  const TypewriterEffectBox({
    required this.text,
    required this.textKey,
    required this.textStyle,
    required this.onFinished,
    super.key,
  });

  @override
  ConsumerState<TypewriterEffectBox> createState() =>
      _TypewriterEffectBoxState();
}

class _TypewriterEffectBoxState extends ConsumerState<TypewriterEffectBox> {
  @override
  void initState() {
    super.initState();
    // Memulai suara saat widget pertama kali dibuat
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(soundEffectServiceProvider.notifier).playTyping();
    });
  }

  @override
  void didUpdateWidget(TypewriterEffectBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Jika teks berubah, mulai ulang suara ketikan
    if (widget.textKey != oldWidget.textKey) {
      ref.read(soundEffectServiceProvider.notifier).playTyping();
    }
  }

  @override
  void dispose() {
    // Sangat penting: Hentikan suara ketikan saat widget dihancurkan
    // untuk mencegah memory leak.
    ref.read(soundEffectServiceProvider.notifier).stopTyping();
    super.dispose();
  }

  void _handleAnimationEnd() {
    ref.read(soundEffectServiceProvider.notifier).stopTyping();
    // Hanya panggil callback jika widget masih ada di tree.
    if (mounted) {
      widget.onFinished();
    }
  }

  @override
  Widget build(BuildContext context) {
    // AnimatedTextKit akan menangani semuanya, termasuk 'displayFullTextOnTap'.
    return AnimatedTextKit(
      key:
          widget
              .textKey, // Gunakan key untuk me-reset animasi saat teks berubah
      animatedTexts: [
        TypewriterAnimatedText(
          widget.text,
          textStyle: widget.textStyle,
          speed: const Duration(milliseconds: 20),
          cursor: '_',
        ),
      ],
      isRepeatingAnimation: false,
      displayFullTextOnTap: true, // Saat ditekan, teks akan langsung lengkap
      stopPauseOnTap:
          true, // Menghentikan pause dan melanjutkan ke state 'finished'
      onTap: _handleAnimationEnd, // Panggil _handleAnimationEnd saat ditekan
      onFinished: _handleAnimationEnd,
      pause: Duration.zero,
    );
  }
}
