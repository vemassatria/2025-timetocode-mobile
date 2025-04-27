import 'package:flutter/material.dart';
import 'package:timetocode/components/popups/menu_popup.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/utils/overlay_utils.dart';

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
    return const BoxDecoration(
      color: AppColors.darkBackground,
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(0),
        right: Radius.circular(100),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openMenuPopup(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: _buildDecoration(),
        child: const Icon(Icons.menu, color: AppColors.primaryText, size: 32),
      ),
    );
  }
}
