import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/base_popup.dart';
import 'package:timetocode/components/popups/confirm_popup.dart';
import 'package:timetocode/components/popups/setting_popup.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/overlay_utils.dart';
// import 'package:timetocode/SFX/music_service.dart';
import 'package:timetocode/utils/screen_utils.dart';

class MenuPopup extends StatelessWidget {
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

  Widget _buildMenuButtons(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          label: "Lanjutkan",
          onPressed: () {
            // MusicService.sfxNegativeClick();
            onClose();
          },
          widthMode: ButtonWidthMode.fill,
        ),
        SizedBox(height: 8.h),
        CustomButton(
          label: "Mulai Ulang",
          onPressed: () {
            // MusicService.sfxSelectClick();
            showPopupOverlay(
              context,
              ConfirmPopup(
                title: "Mulai Ulang?",
                description:
                    "Progress hilang dan permainan dimulai dari awal sekarang.",
                confirmLabel: "Mulai Ulang",
                onPrimaryButtonPressed: () {
                  // MusicService.sfxButtonClick();
                  onRestart();
                },
                onGoBack: () {
                  // MusicService.sfxNegativeClick();
                  onGoBack();
                },
              ),
            );
          },
          widthMode: ButtonWidthMode.fill,
        ),
        SizedBox(height: 8.h),
        CustomButton(
          label: "Pengaturan",
          onPressed: () {
            // MusicService.sfxSelectClick();
            showPopupOverlay(
              context,
              SettingPopup(
                onGoBack: () {
                  // MusicService.sfxNegativeClick();
                  onGoBack();
                },
              ),
            );
          },
          widthMode: ButtonWidthMode.fill,
        ),
        SizedBox(height: 8.h),
        CustomButton(
          label: "Keluar",
          onPressed: () {
            // MusicService.sfxSelectClick();
            showPopupOverlay(
              context,
              ConfirmPopup(
                title: "Keluar?",
                description:
                    "Progress akan hilang dan level diulang dari awal saat dimainkan kembali.",
                confirmLabel: "Tetap Keluar",
                onPrimaryButtonPressed: () {
                  // MusicService.sfxButtonClick();
                  onExit();
                },
                onGoBack: () {
                  // MusicService.sfxNegativeClick();
                  onGoBack();
                },
              ),
            );
          },
          widthMode: ButtonWidthMode.fill,
          color: ButtonColor.purple,
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
          _buildMenuButtons(context),
        ],
      ),
    );
  }
}
