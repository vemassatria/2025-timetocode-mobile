import 'package:flutter/material.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';

class SettingItem extends StatelessWidget {
  final Icon icon;
  final String label;
  final bool value;
  final Function(bool) onChanged;

  const SettingItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: AppColors.surfaceDark,
      ),
      child: Row(
        children: [
          _buildIcon(),
          const SizedBox(width: 16),
          _buildLabel(),
          _buildSwitch(),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(icon.icon, color: AppColors.primaryText, size: 32);
  }

  Widget _buildLabel() {
    return Expanded(child: Text(label, style: AppTypography.normal()));
  }

  Widget _buildSwitch() {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 52,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: value ? AppColors.technoBlue : AppColors.secondaryText,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 150),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: _buildSwitchThumb(),
        ),
      ),
    );
  }

  Widget _buildSwitchThumb() {
    return Container(
      width: 24,
      height: 24,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
