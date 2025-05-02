import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/confirm_popup.dart';
import 'package:timetocode/games/models/choices_model.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:timetocode/utils/screen_utils.dart';

class ChoicesBox extends StatelessWidget {
  final List<ChoicesModel> choices;
  final ValueChanged<int> onPressed;

  const ChoicesBox({super.key, required this.choices, required this.onPressed});

  Widget _buildChoiceButton(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: CustomButton(
        label: choices[index].text,
        widthMode: ButtonWidthMode.fill,
        type: ButtonType.outline,
        onPressed: () {
          showPopupOverlay(
            context,
            ConfirmPopup(
              title: "Yakin ingin menjawab?",
              description:
                  "Kamu bisa mencoba lagi jika jawabannya belum tepat.",
              confirmLabel: "Yakin",
              onPrimaryButtonPressed: () {
                closePopupOverlay();
                onPressed(index);
              },
              onGoBack: closePopupOverlay,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context);

    return Container(
      width: 1.sw,
      height: 295.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundTransparent,
        border: Border(top: BorderSide(color: AppColors.white, width: 2.w)),
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
