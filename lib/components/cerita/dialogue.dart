import 'package:flutter/material.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/themes/colors.dart';

class DialogueBoxWidget extends StatefulWidget {
  final GameEngine game;
  const DialogueBoxWidget({Key? key, required this.game}) : super(key: key);

  @override
  State<DialogueBoxWidget> createState() => _DialogueBoxWidgetState();
}

class _DialogueBoxWidgetState extends State<DialogueBoxWidget> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.game.loadCharacter(
      widget.game.character1Path[0],
      widget.game.character2Path[0],
    );
    if (widget.game.currentDialogs.getCharacterIndex(_currentIndex) == 1) {
      if (widget.game.character1ActivePath !=
          widget.game.currentDialogs.getReactionIndex(_currentIndex)) {
        widget.game.changeCharacter(
          1,
          widget.game.character1Path[widget.game.currentDialogs
              .getReactionIndex(_currentIndex)],
        );
        widget.game.character1ActivePath = widget.game.currentDialogs
            .getReactionIndex(_currentIndex);
      }
      widget.game.activeCharacter(1);
    } else {
      if (widget.game.character2ActivePath !=
          widget.game.currentDialogs.getReactionIndex(_currentIndex)) {
        widget.game.changeCharacter(
          2,
          widget.game.character2Path[widget.game.currentDialogs
              .getReactionIndex(_currentIndex)],
        );
        widget.game.character2ActivePath = widget.game.currentDialogs
            .getReactionIndex(_currentIndex);
      }
      widget.game.activeCharacter(2);
    }
  }

  void _advance() {
    if (_currentIndex < widget.game.currentDialogs.getDialogLength() - 1) {
      setState(() => _currentIndex++);

      if (widget.game.currentDialogs.getCharacterIndex(_currentIndex) == 1) {
        if (widget.game.character1ActivePath !=
            widget.game.currentDialogs.getReactionIndex(_currentIndex)) {
          widget.game.changeCharacter(
            1,
            widget.game.character1Path[widget.game.currentDialogs
                .getReactionIndex(_currentIndex)],
          );
          widget.game.character1ActivePath = widget.game.currentDialogs
              .getReactionIndex(_currentIndex);
        }
        widget.game.activeCharacter(1);
      } else {
        if (widget.game.character2ActivePath !=
            widget.game.currentDialogs.getReactionIndex(_currentIndex)) {
          widget.game.changeCharacter(
            2,
            widget.game.character2Path[widget.game.currentDialogs
                .getReactionIndex(_currentIndex)],
          );
          widget.game.character2ActivePath = widget.game.currentDialogs
              .getReactionIndex(_currentIndex);
        }
        widget.game.activeCharacter(2);
      }
    } else {
      widget.game.removeDialog();
      if (widget.game.currentDialogs.nextType == 'soal') {
        widget.game.setCurrentQuestion(widget.game.currentDialogs.next);
      } else {
        widget.game.overlays.add('EndGame');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // ambil teks current
    final text = widget.game.currentDialogs.getTextDialog(_currentIndex);
    final maxHeight = MediaQuery.of(context).size.height * 0.3;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxHeight: maxHeight),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.backgroundTransparent,
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor, width: 2),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tampilkan satu baris dialog; wrap agar scroll kalau panjang
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.double_arrow, color: AppColors.white),
                onPressed: _advance,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
