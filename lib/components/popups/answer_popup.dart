import 'package:flutter/material.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/base_popup.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/SFX/music_service.dart';

class AnswerPopup extends StatelessWidget {
  final bool isCorrect;
  final VoidCallback onPressed;

  const AnswerPopup({
    super.key,
    required this.isCorrect,
    required this.onPressed,
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
    return CustomButton(
      label: "Lanjutkan",
      onPressed: () {
              MusicService.sfxButtonClick();
              onPressed();
            },
      widthMode: ButtonWidthMode.fill,
      color: isCorrect ? ButtonColor.green : ButtonColor.red,
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
