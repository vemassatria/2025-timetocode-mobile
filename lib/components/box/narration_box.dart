import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/screen_utils.dart';

class NarrationBox extends StatefulWidget {
  final String narrationText;
  final VoidCallback onTap;

  const NarrationBox({
    Key? key,
    required this.narrationText,
    required this.onTap,
  }) : super(key: key);

  @override
  State<NarrationBox> createState() => _NarrationBoxState();
}

class _NarrationBoxState extends State<NarrationBox> {
  bool _isComplete = false;

  void _handleTap() {
    if (_isComplete) {
      widget.onTap();
    }
    // otherwise: do nothing, since displayFullTextOnTap will rush it
  }

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context);

    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        height: 250.h,
        width: 328.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.backgroundTransparent,
          border: Border.all(color: AppColors.white),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    widget.narrationText,
                    textStyle: AppTypography.normal().copyWith(
                      decoration: TextDecoration.none,
                    ),
                    speed: const Duration(milliseconds: 20),
                    cursor: '',
                  ),
                ],
                isRepeatingAnimation: false,
                displayFullTextOnTap:
                    true, // rush to full text on tap :contentReference[oaicite:1]{index=1}
                stopPauseOnTap:
                    true, // if you had multiple strings, tap to skip pause :contentReference[oaicite:2]{index=2}
                onTap: () {
                  if (!_isComplete) {
                    // the kit has just rushed to full—mark complete
                    setState(() => _isComplete = true);
                  }
                },
                onFinished: () {
                  // also mark complete when the animation naturally ends
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
