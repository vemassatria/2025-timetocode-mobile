// lib/pages/visual_novel/component/intro_box_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/box/typewriter_effect_box.dart';
import 'package:timetocode/games/backend/controllers/visual_novel/story_gameplay_controller.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/games/backend/models/visual_novel/predialog_model.dart';
import 'package:timetocode/themes/typography.dart';

class IntroBoxWidget extends ConsumerStatefulWidget {
  final PreDialogModel preDialog;
  const IntroBoxWidget({super.key, required this.preDialog});

  @override
  ConsumerState<IntroBoxWidget> createState() => _IntroBoxWidgetState();
}

class _IntroBoxWidgetState extends ConsumerState<IntroBoxWidget> {
  bool _isAnimationComplete = false;

  @override
  void initState() {
    super.initState();
    _isAnimationComplete = false;
  }

  @override
  void didUpdateWidget(covariant IntroBoxWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.preDialog.id != oldWidget.preDialog.id && mounted) {
      setState(() => _isAnimationComplete = false);
    }
  }

  void _handleTap() {
    if (!_isAnimationComplete) {
      setState(() => _isAnimationComplete = true);
      return;
    }
    ref.read(storyControllerProvider.notifier).nextPreDialog();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTypography.normal().copyWith(
      decoration: TextDecoration.none,
    );

    return GestureDetector(
      onTap: _handleTap,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Container(
          height: 250.h,
          width: 328.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.backgroundTransparent,
            border: Border.all(color: AppColors.white),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child:
                    _isAnimationComplete
                        ? Text(widget.preDialog.text, style: textStyle)
                        : TypewriterEffectBox(
                          text: widget.preDialog.text,
                          textStyle: textStyle,
                          onFinished: () {
                            if (mounted && !_isAnimationComplete) {
                              setState(() => _isAnimationComplete = true);
                            }
                          },
                        ),
              ),
              if (_isAnimationComplete)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.keyboard_double_arrow_right_rounded,
                    size: 32.sp,
                    color: AppColors.primaryText,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
