import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/base_popup.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/themes/typography.dart';

class ConfirmPopup extends ConsumerWidget {
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

  Widget _buildButton(WidgetRef ref) {
    final audioService = ref.read(soundEffectServiceProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            label: confirmLabel,
            onPressed: () {
              audioService.playButtonClick1();
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
              audioService.playNegativeClick();
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
  Widget build(BuildContext context, WidgetRef ref) {
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
          _buildButton(ref),
        ],
      ),
    );
  }
}
