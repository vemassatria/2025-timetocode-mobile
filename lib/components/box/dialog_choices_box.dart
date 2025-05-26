import 'package:flutter/material.dart';
import 'package:timetocode/games/backend/models/dialog_choices.dart';
import 'package:timetocode/components/button.dart';

class DialogChoicesBox extends StatelessWidget {
  final List<DialogChoices> choices;
  final ValueChanged<DialogChoices> onPressed;

  const DialogChoicesBox({
    super.key,
    required this.choices,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          choices.map((choice) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                label: choice.text,
                widthMode: ButtonWidthMode.fill,
                type: ButtonType.outline,
                onPressed: () => onPressed(choice),
              ),
            );
          }).toList(),
    );
  }
}
