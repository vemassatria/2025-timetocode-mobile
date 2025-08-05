import 'package:flutter/material.dart';
import 'package:timetocode/features/1_story_mode/data/models/dialog_choices.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';

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
    final maxHeight = MediaQuery.of(context).size.height * 0.4;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: SingleChildScrollView(
        child: Column(
          children:
              choices
                  .map(
                    (choice) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomButton(
                        label: choice.text,
                        textAlign: ButtonTextAlign.center,
                        widthMode: ButtonWidthMode.fill,
                        type: ButtonType.outline,
                        onPressed: () => onPressed(choice),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
