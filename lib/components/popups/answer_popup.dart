import 'package:flutter/material.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/base_popup.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';

class AnswerPopup extends StatelessWidget {
  final bool isCorrect;
  final VoidCallback onPrimaryButtonPressed;
  final VoidCallback? onSecondaryButtonPressed;

  const AnswerPopup({
    super.key,
    required this.isCorrect,
    required this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
  });

  Color get _color => isCorrect ? AppColors.xpGreen : AppColors.dangerRed;

  Widget _buildIcon() {
    return Icon(
      isCorrect ? Icons.check_circle : Icons.cancel,
      color: _color,
      size: 32,
    );
  }

  Widget _buildTitle() {
    return Text(
      isCorrect ? "Benar" : "Salah",
      style: AppTypography.heading4(color: _color),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildIconWithTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_buildIcon(), const SizedBox(width: 16), _buildTitle()],
    );
  }

  Widget _buildButton() {
    return isCorrect
        ? CustomButton(
          label: "Lanjutkan",
          onPressed: onPrimaryButtonPressed,
          widthMode: ButtonWidthMode.fill,
          color: ButtonColor.green,
        )
        : Row(
          children: [
            Expanded(
              child: CustomButton(
                label: "Coba Lagi",
                onPressed: onPrimaryButtonPressed,
                widthMode: ButtonWidthMode.fill,
                color: ButtonColor.red,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                label: "Ulangi Materi",
                onPressed: onSecondaryButtonPressed ?? () {},
                widthMode: ButtonWidthMode.fill,
                type: ButtonType.outline,
                color: ButtonColor.none,
              ),
            ),
          ],
        );
  }

  @override
  Widget build(BuildContext context) {
    return BasePopup(
      borderColor: _color,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildIconWithTitleRow(),
          const SizedBox(height: 32),
          _buildButton(),
        ],
      ),
    );
  }
}
