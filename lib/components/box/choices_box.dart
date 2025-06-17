import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/confirm_popup.dart';
import 'package:timetocode/games/backend/models/choices_model.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:timetocode/utils/screen_utils.dart';
// import 'package:timetocode/SFX/music_service.dart';

class ChoicesBox extends ConsumerWidget {
  final List<ChoicesModel> choices;
  final ValueChanged<int> onPressed;

  const ChoicesBox({super.key, required this.choices, required this.onPressed});

  Widget _buildChoiceButton(BuildContext context, int index, VoidCallback sfx) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: CustomButton(
        label: choices[index].text,
        widthMode: ButtonWidthMode.fill,
        type: ButtonType.outline,

        onPressed: () {
          sfx();
          showPopupOverlay(
            context,
            ConfirmPopup(
              title: "Yakin ingin menjawab?",
              description:
                  "Kamu bisa mencoba lagi jika jawabannya belum tepat.",
              confirmLabel: "Yakin",
              onPrimaryButtonPressed: () {
                // MusicService.sfxSelectClick();
                closePopupOverlay();
                onPressed(index);
              },
              onGoBack: () {
                // MusicService.sfxNegativeClick();
                closePopupOverlay();
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initScreenUtil(context);
    final soundEffectService = ref.watch(soundEffectServiceProvider.notifier);

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
            return _buildChoiceButton(
              context,
              index,
              soundEffectService.playSelectClick,
            );
          }),
        ),
      ),
    );
  }
}
