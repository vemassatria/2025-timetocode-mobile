import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/base_popup.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';

class AnswerPopup extends ConsumerWidget {
  final bool isCorrect;
  final VoidCallback onPressed;
  final String? text;

  const AnswerPopup({
    super.key,
    required this.isCorrect,
    required this.onPressed,
    this.text,
  });

  Color get _color => isCorrect ? AppColors.xpGreen : AppColors.dangerRed;

  Widget _buildIcon() {
    return Icon(
      isCorrect ? Icons.check_circle : Icons.cancel,
      color: _color,
      size: 32.sp,
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
      children: [_buildIcon(), SizedBox(width: 16.w), _buildTitle()],
    );
  }

  Widget _buildButton(WidgetRef ref) {
    return CustomButton(
      label: "Lanjutkan",
      onPressed: () {
        final audioService = ref.read(soundEffectServiceProvider.notifier);
        audioService.playButtonClick2();
        onPressed();
      },
      widthMode: ButtonWidthMode.fill,
      color: isCorrect ? ButtonColor.green : ButtonColor.red,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioService = ref.read(soundEffectServiceProvider.notifier);
    audioService.playPopupAnswer();
    return BasePopup(
      borderColor: _color,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildIconWithTitleRow(),
          SizedBox(height: 32.h),
          if (text != null && !isCorrect) ...[
            RichText(
              text: TextSpan(
                style: AppTypography.small(color: AppColors.primaryText),
                children: [
                  TextSpan(text: "Jawaban yang "),
                  TextSpan(
                    text: "benar",
                    style: TextStyle(color: AppColors.xpGreen),
                  ),
                  TextSpan(text: ":"),
                ],
              ),
            ),
            Text(
              text!,
              style: AppTypography.largeBold(color: AppColors.primaryText),
            ),
            SizedBox(height: 32.h),
          ],
          _buildButton(ref),
        ],
      ),
    );
  }
}
