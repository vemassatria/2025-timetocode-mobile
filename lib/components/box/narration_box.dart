import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/games/backend/services/sound_effect_service.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';

class NarrationBox extends ConsumerStatefulWidget {
  final String narrationText;
  final VoidCallback onTap;

  const NarrationBox({
    Key? key,
    required this.narrationText,
    required this.onTap,
  }) : super(key: key);

  @override
  ConsumerState<NarrationBox> createState() => _NarrationBoxState();
}

class _NarrationBoxState extends ConsumerState<NarrationBox> {
  bool _isComplete = false;
  late final SoundEffectService soundEffectService;

  @override
  void initState() {
    super.initState();
    soundEffectService = ref.read(soundEffectServiceProvider.notifier);
    soundEffectService.playTyping();
  }

  @override
  void dispose() {
    soundEffectService.stopTyping();
    super.dispose();
  }

  @override
  void didUpdateWidget(NarrationBox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.narrationText != oldWidget.narrationText) {
      setState(() {
        _isComplete = false;
      });
      soundEffectService.playTyping();
    }
  }

  void _handleTap() {
    if (_isComplete) {
      widget.onTap();
    }
    // otherwise: do nothing, since displayFullTextOnTap will rush it
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        height: 250.h,
        width: 328.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.backgroundTransparent,
          border: Border.all(color: AppColors.white),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AnimatedTextKit(
                key: ValueKey(widget.narrationText),
                animatedTexts: [
                  TypewriterAnimatedText(
                    widget.narrationText,
                    textStyle: AppTypography.normal().copyWith(
                      decoration: TextDecoration.none,
                    ),
                    speed: const Duration(milliseconds: 20),
                    cursor: '_',
                  ),
                ],
                isRepeatingAnimation: false,
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
                onTap: () {
                  soundEffectService.stopTyping();
                  if (!_isComplete) {
                    setState(() => _isComplete = true);
                  }
                },
                onFinished: () {
                  soundEffectService.stopTyping();
                  setState(() => _isComplete = true);
                },
              ),
            ),

            if (_isComplete)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.keyboard_double_arrow_right_rounded,
                    size: 32.sp,
                    color: AppColors.primaryText,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
