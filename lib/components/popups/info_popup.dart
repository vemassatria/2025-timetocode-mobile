import 'package:flutter/material.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/base_popup.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/SFX/music_service.dart';

class InfoPopup extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onClose;

  const InfoPopup({
    super.key,
    required this.title,
    required this.description,
    required this.onClose,
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
      textAlign: TextAlign.justify,
      style: AppTypography.small(),
    );
  }

  Widget _buildCloseButton() {
    return CustomButton(
      label: "Tutup",
      onPressed: () {
        MusicService.sfxNegativeClick();
        onClose();
      },
      widthMode: ButtonWidthMode.fill,
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
          _buildCloseButton(),
        ],
      ),
    );
  }
}
