import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/screen_utils.dart';

class DialogBox extends StatefulWidget {
  final String dialogText;
  final String characterName;
  final VoidCallback onTap;
  final Color nameBoxColor;

  const DialogBox({
    super.key,
    required this.dialogText,
    required this.characterName,
    required this.onTap,
    required this.nameBoxColor,
  });

  @override
  State<DialogBox> createState() => DialogBoxState();
}

class DialogBoxState extends State<DialogBox> {
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
    if (charIndex < widget.dialogText.length) {
      setState(() {
        displayedText += widget.dialogText[charIndex];
        charIndex++;
      });
      _startTypingEffect();
    } else {
      setState(() => isTextComplete = true);
    }
  }

  void _handleTap() {
    if (!isTextComplete) {
      _timer?.cancel();
      setState(() {
        displayedText = widget.dialogText;
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

  Widget _buildDialogContent(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 36, 16, 16),
        width: ScreenUtils.screenWidth(context),
        height: 306,
        decoration: BoxDecoration(
          color: AppColors.backgroundTransparent,
          border: const Border(
            top: BorderSide(color: AppColors.white, width: 2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              displayedText,
              style: AppTypography.large(),
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            if (isTextComplete)
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.keyboard_double_arrow_right_rounded,
                  size: 32,
                  color: AppColors.primaryText,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameBox() {
    return Positioned(
      top: -20,
      left: 16,
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: widget.nameBoxColor,
          border: Border.all(color: AppColors.white, width: 2),
        ),
        child: Text(
          widget.characterName,
          style: AppTypography.heading6(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [_buildDialogContent(context), _buildNameBox()],
    );
  }
}
