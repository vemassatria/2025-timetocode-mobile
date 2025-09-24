import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/popups/base_popup.dart';
import 'package:timetocode/app/widgets/popups/confirm_popup.dart';
import 'package:timetocode/app/widgets/popups/setting_popup.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';

class MenuPopup extends ConsumerWidget {
  final VoidCallback onRestart;
  final VoidCallback onExit;
  final VoidCallback onClose;
  final VoidCallback onGoBack;

  const MenuPopup({
    super.key,
    required this.onRestart,
    required this.onExit,
    required this.onClose,
    required this.onGoBack,
  });

  Widget _buildTitle() {
    return Text(
      "Menu",
      style: AppTypography.heading4(),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildMenuButtons(BuildContext context, WidgetRef ref) {
    final audioService = ref.read(soundEffectServiceProvider.notifier);
    return Column(
      children: [
        CustomButton(
          label: "Lanjutkan",
          onPressed: () {
            audioService.playNegativeClick();
            onClose();
          },
          widthMode: ButtonWidthMode.fill,
        ),
        SizedBox(height: 8.h),
        CustomButton(
          label: "Mulai Ulang",
          onPressed: () {
            audioService.playSelectClick();
            showPopupOverlay(
              context,
              ConfirmPopup(
                title: "Mulai Ulang?",
                description:
                    "Progress permainan hilang dan permainan dimulai dari awal sekarang.",
                confirmLabel: "Mulai Ulang",
                onPrimaryButtonPressed: () {
                  onRestart();
                },
                onGoBack: () {
                  onGoBack();
                },
              ),
              ref,
            );
          },
          widthMode: ButtonWidthMode.fill,
        ),
        SizedBox(height: 8.h),
        CustomButton(
          label: "Pengaturan",
          onPressed: () {
            audioService.playSelectClick();
            showPopupOverlay(
              context,
              SettingPopup(
                onGoBack: () {
                  audioService.playNegativeClick();
                  onGoBack();
                },
              ),
              ref,
            );
          },
          widthMode: ButtonWidthMode.fill,
        ),
        SizedBox(height: 8.h),
        CustomButton(
          label: "Keluar",
          onPressed: () {
            audioService.playSelectClick();
            showPopupOverlay(
              context,
              ConfirmPopup(
                title: "Keluar?",
                description:
                    "Progress permainan akan hilang dan level diulang dari awal saat dimainkan kembali.",
                confirmLabel: "Tetap Keluar",
                onPrimaryButtonPressed: () {
                  onExit();
                },
                onGoBack: () {
                  onGoBack();
                },
              ),
              ref,
            );
          },
          widthMode: ButtonWidthMode.fill,
          color: ButtonColor.purple,
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
          _buildMenuButtons(context, ref),
        ],
      ),
    );
  }
}
