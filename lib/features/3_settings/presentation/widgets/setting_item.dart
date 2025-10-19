import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white, width: 2.w),
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.surfaceDark,
      ),
      child: Row(
        children: [
          _buildIcon(),
          SizedBox(width: 16.w),
          _buildLabel(),
          _buildSwitch(),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(icon.icon, color: AppColors.primaryText, size: 32.sp);
  }

  Widget _buildLabel() {
    return Expanded(child: Text(label, style: AppTypography.normal()));
  }

  Widget _buildSwitch() {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 52.w,
        height: 32.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
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
      width: 24.w,
      height: 24.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}
