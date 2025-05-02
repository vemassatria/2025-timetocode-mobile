import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/providers/game_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/screen_utils.dart';

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
    _setupDialog();
  }

  @override
  void didUpdateWidget(covariant DialogBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currentIndex = 0;
    _displayedText = '';
    _charIndex = 0;
    _isTextComplete = false;
    _setupDialog();
  }

  void _setupDialog() {
    game.loadCharacter(game.character1Path![0], game.character2Path![0]);
    game.character1ActivePath = 0;
    game.character2ActivePath = 0;
    _applyCharacterState();
    _startTyping();
  }

  void _applyCharacterState() {
    final dialogs = game.currentDialogs!;
    final idx = dialogs.getCharacterIndex(_currentIndex);
    final react = dialogs.getReactionIndex(_currentIndex);

    if (idx == 1) {
      if (game.character1ActivePath != react) {
        game.changeCharacter(1, game.character1Path![react]);
        game.character1ActivePath = react;
      }
      game.normalColorCharacter(1);
      game.normalSizeCharacter(2);
      game.enhancedSizeCharacter(1);
      game.blackCharacter(2);
    } else {
      if (game.character2ActivePath != react) {
        game.changeCharacter(2, game.character2Path![react]);
        game.character2ActivePath = react;
      }
      game.normalColorCharacter(2);
      game.normalSizeCharacter(1);
      game.enhancedSizeCharacter(2);
      game.blackCharacter(1);
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
    final fullText = game.currentDialogs?.getTextDialog(_currentIndex);
    if (_charIndex < fullText!.length) {
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
        _displayedText = game.currentDialogs!.getTextDialog(_currentIndex);
        _isTextComplete = true;
      });
    } else {
      _advanceDialog();
    }
  }

  void _advanceDialog() {
    final dialogs = game.currentDialogs;
    if (_currentIndex < dialogs!.getDialogLength() - 1) {
      setState(() => _currentIndex++);
      _applyCharacterState();
      _startTyping();
    } else {
      game.removeDialog();
      if (dialogs.nextType == 'soal') {
        game.setCurrentQuestion(dialogs.next);
      } else {
        game.overlays.remove('StoryMenu');
        game.overlays.add('EndGame');
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
    final lvl = game.levels[game.activeLevel];
    final name =
        game.currentDialogs!.getCharacterIndex(_currentIndex) == 1
            ? lvl.character1
            : lvl.character2;
    final boxColor =
        game.currentDialogs!.getCharacterIndex(_currentIndex) == 1
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
                    _displayedText,
                    style: AppTypography.large(),
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  if (_isTextComplete)
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
          ),
          Positioned(
            top: -20,
            left: 16,
            child: Container(
              width: 150,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: boxColor,
                border: Border.all(color: AppColors.white, width: 2),
              ),
              child: Text(
                name,
                style: AppTypography.heading6(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
