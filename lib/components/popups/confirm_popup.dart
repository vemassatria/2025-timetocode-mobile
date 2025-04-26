import 'package:flutter/material.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/base_popup.dart';
import 'package:timetocode/themes/typography.dart';

class ConfirmPopup extends StatelessWidget {
  final String title;
  final String description;
  final String confirmLabel;
  final VoidCallback onPrimaryButtonPressed;
  final VoidCallback onGoBack;

  const ConfirmPopup({
    super.key,
    required this.title,
    required this.description,
    required this.confirmLabel,
    required this.onPrimaryButtonPressed,
    required this.onGoBack,
  });

  Widget _buildTitle() {
    return Text(
      title,
      style: AppTypography.heading4(),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescription() {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: AppTypography.small(),
    );
  }

  Widget _buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            label: confirmLabel,
            onPressed: onPrimaryButtonPressed,
            widthMode: ButtonWidthMode.fill,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomButton(
            label: "Batal",
            onPressed: onGoBack,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitle(),
          const SizedBox(height: 8),
          const Divider(thickness: 3),
          const SizedBox(height: 32),
          _buildDescription(),
          const SizedBox(height: 32),
          _buildButton(),
        ],
      ),
    );
  }
}
