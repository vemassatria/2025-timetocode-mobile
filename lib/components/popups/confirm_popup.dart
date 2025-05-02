import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/base_popup.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/SFX/music_service.dart';
import 'package:timetocode/utils/screen_utils.dart';

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
            onPressed: () {
              MusicService.sfxButtonClick();
              onPrimaryButtonPressed();
            },
            widthMode: ButtonWidthMode.fill,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: CustomButton(
            label: "Batal",
            onPressed: () {
              MusicService.sfxNegativeClick();
              onGoBack();
            },
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
    initScreenUtil(context);

    return BasePopup(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitle(),
          SizedBox(height: 8.h),
          Divider(thickness: 3.w),
          SizedBox(height: 32.h),
          _buildDescription(),
          SizedBox(height: 32.h),
          _buildButton(),
        ],
      ),
    );
  }
}
