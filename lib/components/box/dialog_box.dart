import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/screen_utils.dart';

class DialogBox extends StatefulWidget {
  final GameEngine game;

  const DialogBox({super.key, required this.game});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  int _currentIndex = 0;
  String _displayedText = '';
  int _charIndex = 0;
  bool _isTextComplete = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _setupDialog();
  }

  @override
  void didUpdateWidget(covariant DialogBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.game.currentDialogs != widget.game.currentDialogs) {
      setState(() {
        _currentIndex = 0;
        _displayedText = '';
        _charIndex = 0;
        _isTextComplete = false;
      });
      _setupDialog();
    }
  }

  void _setupDialog() {
    widget.game.loadCharacter(
      widget.game.character1Path[0],
      widget.game.character2Path[0],
    );
    widget.game.character1ActivePath = 0;
    widget.game.character2ActivePath = 0;
    _applyCharacterState();
    _startTyping();
  }

  void _applyCharacterState() {
    final idx = widget.game.currentDialogs.getCharacterIndex(_currentIndex);
    final react = widget.game.currentDialogs.getReactionIndex(_currentIndex);

    if (idx == 1) {
      if (widget.game.character1ActivePath != react) {
        widget.game.changeCharacter(1, widget.game.character1Path[react]);
        widget.game.character1ActivePath = react;
      }
      widget.game.normalColorCharacter(1);
      widget.game.normalSizeCharacter(2);
      widget.game.enhancedSizeCharacter(1);
      widget.game.blackCharacter(2);
    } else {
      if (widget.game.character2ActivePath != react) {
        widget.game.changeCharacter(2, widget.game.character2Path[react]);
        widget.game.character2ActivePath = react;
      }
      widget.game.normalColorCharacter(2);
      widget.game.normalSizeCharacter(1);
      widget.game.enhancedSizeCharacter(2);
      widget.game.blackCharacter(1);
    }
  }

  void _startTyping() {
    _timer?.cancel();
    _displayedText = '';
    _charIndex = 0;
    _isTextComplete = false;
    _timer = Timer(const Duration(milliseconds: 20), _updateText);
  }

  void _updateText() {
    final fullText = widget.game.currentDialogs.getTextDialog(_currentIndex);
    if (_charIndex < fullText.length) {
      setState(() {
        _displayedText += fullText[_charIndex];
        _charIndex++;
      });
      _timer = Timer(const Duration(milliseconds: 20), _updateText);
    } else {
      setState(() => _isTextComplete = true);
    }
  }

  void _handleTap() {
    if (!_isTextComplete) {
      _timer?.cancel();
      setState(() {
        _displayedText = widget.game.currentDialogs.getTextDialog(
          _currentIndex,
        );
        _isTextComplete = true;
      });
    } else {
      _advanceDialog();
    }
  }

  void _advanceDialog() {
    final dialogs = widget.game.currentDialogs;
    if (_currentIndex < dialogs.getDialogLength() - 1) {
      setState(() => _currentIndex++);
      _applyCharacterState();
      _startTyping();
    } else {
      widget.game.removeDialog();
      if (dialogs.nextType == 'soal') {
        widget.game.setCurrentQuestion(dialogs.next);
      } else {
        widget.game.overlays.remove('Story');
        widget.game.overlays.add('EndGame');
      }
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

    final lvl = widget.game.levels[widget.game.activeLevel];
    final name =
        widget.game.currentDialogs.getCharacterIndex(_currentIndex) == 1
            ? lvl.character1
            : lvl.character2;
    final boxColor =
        widget.game.currentDialogs.getCharacterIndex(_currentIndex) == 1
            ? AppColors.challengeOrange
            : AppColors.deepTealGlow;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: _handleTap,
            child: Container(
              padding: EdgeInsets.fromLTRB(16.w, 36.h, 16.w, 16.h),
              width: 1.sw,
              height: 285.h,
              decoration: BoxDecoration(
                color: AppColors.backgroundTransparent,
                border: Border(
                  top: BorderSide(color: AppColors.white, width: 2.w),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _displayedText,
                    style: AppTypography.large().copyWith(
                      decoration: TextDecoration.none,
                    ),
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  if (_isTextComplete)
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
          Positioned(
            top: -20,
            left: 16,
            child: Container(
              width: 150.w,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                color: boxColor,
                border: Border.all(color: AppColors.white, width: 2.w),
              ),
              child: Text(
                name,
                style: AppTypography.heading6().copyWith(
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
