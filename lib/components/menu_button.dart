import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/popups/menu_popup.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:timetocode/SFX/music_service.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback onRestart;
  final VoidCallback onExit;

  const MenuButton({super.key, required this.onRestart, required this.onExit});

  void _openMenuPopup(BuildContext context) {
    showPopupOverlay(
      context,
      MenuPopup(
        onRestart: onRestart,
        onExit: onExit,
        onClose: closePopupOverlay,
        onGoBack: () => goBackToPreviousOverlay(context),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: AppColors.darkBackground,
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(0),
        right: Radius.circular(100.r),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MusicService.sfxButtonClick();
        _openMenuPopup(context);
      }, 
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: _buildDecoration(),
        child: Icon(Icons.menu, color: AppColors.primaryText, size: 32.sp),
      ),
    );
  }
}
