import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/popups/confirm_popup.dart';
import 'package:timetocode/features/0_core/models/choices_model.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';

class ChoicesBox extends ConsumerWidget {
  final List<ChoicesModel> choices;
  final ValueChanged<int> onPressed;

  const ChoicesBox({super.key, required this.choices, required this.onPressed});

  Widget _buildChoiceButton(BuildContext context, int index, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: CustomButton(
        label: choices[index].text,
        widthMode: ButtonWidthMode.fill,
        type: ButtonType.outline,

        onPressed: () {
          ref.read(soundEffectServiceProvider.notifier).playSelectClick();
          showPopupOverlay(
            context,
            ConfirmPopup(
              title: "Yakin ingin menjawab?",
              description:
                  "Kamu bisa mencoba lagi jika jawabannya belum tepat.",
              confirmLabel: "Yakin",
              onPrimaryButtonPressed: () {
                closePopupOverlay(ref);
                onPressed(index);
              },
              onGoBack: () {
                closePopupOverlay(ref);
              },
            ),
            ref,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 1.sw,
      height: 295.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundTransparent,
        border: Border(top: BorderSide(color: AppColors.white, width: 2.w)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(choices.length, (index) {
            return _buildChoiceButton(context, index, ref);
          }),
        ),
      ),
    );
  }
}
