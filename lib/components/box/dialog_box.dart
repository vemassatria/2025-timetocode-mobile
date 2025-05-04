// Semua import tetap seperti sebelumnya...
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/providers/game_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/screen_utils.dart';
import 'package:timetocode/SFX/music_service.dart';

class DialogBox extends ConsumerStatefulWidget {
  const DialogBox({super.key});

  @override
  ConsumerState<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends ConsumerState<DialogBox> {
  int _currentIndex = 0;
  String _displayedText = '';
  int _charIndex = 0;
  bool _isTextComplete = false;
  Timer? _timer;
  late GameEngine game;

  @override
  void initState() {
    super.initState();
    game = ref.read(gameEngineProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
  }

  void _initialize() async {
    if (game.storyCharacters == null) {
      await game.loadCharacter(
        game.character1Path![0],
        game.character2Path![0],
      );
      game.character1ActivePath = 0;
      game.character2ActivePath = 0;
    }

    _applyInitialState();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _startTyping();
      }
    });
  }

  void _applyInitialState() {
    final dialogs = game.currentDialogs!;
    final idx = dialogs.getCharacterIndex(_currentIndex);
    final react = dialogs.getReactionIndex(_currentIndex);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (idx == 1) {
        if (game.character1ActivePath != react) {
          await game.changeCharacter(1, game.character1Path![react]);
          game.character1ActivePath = react;
        }
        await game.normalColorCharacter(1);
        await game.normalSizeCharacter(2);
        await game.enhancedSizeCharacter(1);
        await game.blackCharacter(2);
      } else {
        if (game.character2ActivePath != react) {
          await game.changeCharacter(2, game.character2Path![react]);
          game.character2ActivePath = react;
        }
        await game.normalColorCharacter(2);
        await game.normalSizeCharacter(1);
        await game.enhancedSizeCharacter(2);
        await game.blackCharacter(1);
      }
    });
  }

  void _startTyping() {
    _timer?.cancel();
    _displayedText = '';
    _charIndex = 0;
    _isTextComplete = false;
    _timer = Timer(const Duration(milliseconds: 20), _updateText);
  }

  void _updateText() async {
    final fullText = game.currentDialogs?.getTextDialog(_currentIndex);
    if (_charIndex < fullText!.length) {
      setState(() {
        _displayedText += fullText[_charIndex];

        if (_charIndex == 0) {
          MusicService.playTypingSfx();
        }

        _charIndex++;
      });

      _timer = Timer(const Duration(milliseconds: 20), _updateText);
    } else {
      await MusicService.stopTypingSfx();
      setState(() => _isTextComplete = true);
    }
  }

  void _handleTap() {
    if (!_isTextComplete) {
      _timer?.cancel();
      setState(() {
        _displayedText = game.currentDialogs!.getTextDialog(_currentIndex);
        _isTextComplete = true;
      });
      MusicService.stopTypingSfx(); // stop typing sound when user skips
    } else {
      _advanceDialog();
    }
  }

  void _advanceDialog() async {
    final dialogs = game.currentDialogs;
    if (_currentIndex < dialogs!.getDialogLength() - 1) {
      setState(() {
        _currentIndex++;
        _displayedText = '';
        _isTextComplete = false;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final idx = dialogs.getCharacterIndex(_currentIndex);
        final react = dialogs.getReactionIndex(_currentIndex);

        if (idx == 1) {
          if (game.character1ActivePath != react) {
            await game.changeCharacter(1, game.character1Path![react]);
            game.character1ActivePath = react;
          }
          await game.normalColorCharacter(1);
          await game.normalSizeCharacter(2);
          await game.enhancedSizeCharacter(1);
          await game.blackCharacter(2);
        } else {
          if (game.character2ActivePath != react) {
            await game.changeCharacter(2, game.character2Path![react]);
            game.character2ActivePath = react;
          }
          await game.normalColorCharacter(2);
          await game.normalSizeCharacter(1);
          await game.enhancedSizeCharacter(2);
          await game.blackCharacter(1);
        }

        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) {
            _startTyping();
          }
        });
      });
    } else {
      game.removeDialog();
      if (dialogs.nextType == 'soal') {
        game.setCurrentQuestion(dialogs.next);
      } else {
        game.overlays.remove('StoryMenu');
        game.changeScene('default');
        game.overlays.add('EndGame');
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    MusicService.stopTypingSfx();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context);

    final lvl = game.levels[game.activeLevel];
    final name = game.currentDialogs!.getCharacterIndex(_currentIndex) == 1
        ? lvl.character1
        : lvl.character2;
    final boxColor = game.currentDialogs!.getCharacterIndex(_currentIndex) == 1
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
              height: 295.h,
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
