import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/games/backend/services/sound_effect_service.dart';

class TypewriterEffectBox extends ConsumerStatefulWidget {
  final String text;
  final ValueKey textKey;
  final TextStyle textStyle;
  final VoidCallback onFinished;
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
  SoundEffectService? _soundNotifier;

  @override
  void initState() {
    super.initState();
    _soundNotifier = ref.read(soundEffectServiceProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _soundNotifier?.playTyping();
    });
  }

  @override
  void dispose() {
    _soundNotifier?.pauseTyping();
    super.dispose();
  }

  void _handleAnimationEnd() {
    _soundNotifier?.pauseTyping();
    if (mounted) {
      widget.onFinished();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      key: widget.textKey,
      animatedTexts: [
        TypewriterAnimatedText(
          widget.text,
          textStyle: widget.textStyle,
          speed: const Duration(milliseconds: 20),
          cursor: '_',
        ),
      ],
      isRepeatingAnimation: false,
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
      onTap: _handleAnimationEnd,
      onFinished: _handleAnimationEnd,
      pause: Duration.zero,
    );
  }
}
