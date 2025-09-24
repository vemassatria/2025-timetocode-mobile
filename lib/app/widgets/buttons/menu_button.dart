import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/widgets/popups/menu_popup.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';

class MenuButton extends ConsumerWidget {
  final VoidCallback onRestart;
  final VoidCallback onExit;

  const MenuButton({super.key, required this.onRestart, required this.onExit});

  void _openMenuPopup(BuildContext context, WidgetRef ref) {
    showPopupOverlay(
      context,
      MenuPopup(
        onRestart: onRestart,
        onExit: onExit,
        onClose: () => closePopupOverlay(ref),
        onGoBack: () => goBackToPreviousOverlay(context, ref),
      ),
      ref,
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: AppColors.darkBackground,
      borderRadius: BorderRadius.horizontal(
        left: const Radius.circular(0),
        right: Radius.circular(100.r),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(soundEffectServiceProvider.notifier).playButtonClick2();
        _openMenuPopup(context, ref);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: _buildDecoration(),
        child: Icon(Icons.menu, color: AppColors.primaryText, size: 32.sp),
      ),
    );
  }
}
