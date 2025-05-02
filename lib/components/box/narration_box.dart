import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/screen_utils.dart';

class NarrationBox extends StatefulWidget {
  final String narrationText;
  final VoidCallback onTap;
  const NarrationBox({
    super.key,
    required this.narrationText,
    required this.onTap,
  });
  @override
  NarrationBoxState createState() => NarrationBoxState();
}

class NarrationBoxState extends State<NarrationBox> {
  String displayedText = '';
  int charIndex = 0;
  bool isTextComplete = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTypingEffect();
  }

  void _startTypingEffect() {
    _timer = Timer(const Duration(milliseconds: 20), _updateText);
  }

  void _updateText() {
    if (charIndex < widget.narrationText.length) {
      setState(() {
        displayedText += widget.narrationText[charIndex];
        charIndex++;
      });
      _startTypingEffect();
    } else {
      setState(() {
        isTextComplete = true;
      });
    }
  }

  void _handleTap() {
    if (!isTextComplete) {
      _timer?.cancel();
      setState(() {
        displayedText = widget.narrationText;
        isTextComplete = true;
      });
    } else {
      widget.onTap();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context);

    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        height: 250.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        width: 328.w,
        decoration: BoxDecoration(
          color: AppColors.backgroundTransparent,
          border: Border.all(color: AppColors.white),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  displayedText,
                  style: AppTypography.normal().copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            if (isTextComplete)
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
