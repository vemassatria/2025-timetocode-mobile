import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_gameplay_controller.dart';

class AdaptiveTextWidget extends ConsumerStatefulWidget {
  const AdaptiveTextWidget({super.key});

  @override
  ConsumerState<AdaptiveTextWidget> createState() => _AdaptiveTextWidgetState();
}

class _AdaptiveTextWidgetState extends ConsumerState<AdaptiveTextWidget> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 5), () {
      final storyController = ref.read(storyControllerProvider.notifier);
      final activeLevel = ref.read(storyControllerProvider).activeLevel;
      if (activeLevel != null) {
        storyController.navigateMode(activeLevel.typeStart, activeLevel.start);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.black1),
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: DefaultTextStyle(
          style: AppTypography.heading5(
            color: AppColors.primaryText,
          ).copyWith(decoration: TextDecoration.none),
          child: AnimatedTextKit(
            animatedTexts: [
              FadeAnimatedText(
                'Game ini beradaptasi dengan pilihan yang kamu buat. Cerita akan dibentuk oleh caramu bermain.',
                textAlign: TextAlign.center,
                duration: const Duration(seconds: 5),
              ),
            ],
            isRepeatingAnimation: false,
            totalRepeatCount: 1,
          ),
        ),
      ),
    );
  }
}
