import 'package:flutter/material.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/answer_popup.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/utils/overlay_utils.dart';

class ChoicesBox extends StatelessWidget {
  final int correctAnswerIndex;
  final List<String> choices;
  final VoidCallback? onCorrect;
  final VoidCallback? onWrong;

  const ChoicesBox({
    super.key,
    required this.correctAnswerIndex,
    required this.choices,
    this.onCorrect,
    this.onWrong,
  });

  Widget _buildChoiceButton(BuildContext context, int index) {
    final isCorrect = index == correctAnswerIndex;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CustomButton(
        label: choices[index],
        widthMode: ButtonWidthMode.fill,
        type: ButtonType.outline,
        onPressed: () => _onChoicePressed(context, isCorrect),
      ),
    );
  }

  void _onChoicePressed(BuildContext context, bool isCorrect) {
    showPopupOverlay(
      context,
      AnswerPopup(
        isCorrect: isCorrect,
        onPrimaryButtonPressed: () {
          if (isCorrect) {
            onCorrect?.call();
          } else {
            onWrong?.call();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 306,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundTransparent,
        border: const Border(top: BorderSide(color: AppColors.white, width: 2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(choices.length, (index) {
          return _buildChoiceButton(context, index);
        }),
      ),
    );
  }
}
