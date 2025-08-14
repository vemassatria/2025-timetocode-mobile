import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

enum BorderedButtonType { iconLabel }

enum BorderedButtonColor { transparent }

enum BorderedButtonWidthMode { fill, hug, fixed }

enum BorderedButtonTextAlign { left, center, right }

class BorderedButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final BorderedButtonType type;
  final BorderedButtonColor color;
  final Widget? icon;
  final bool isDisabled;
  final double? width;
  final double? height;
  final BorderedButtonWidthMode widthMode;
  final BorderedButtonTextAlign textAlign;

  const BorderedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = BorderedButtonType.iconLabel,
    this.color = BorderedButtonColor.transparent,
    this.icon,
    this.isDisabled = false,
    this.width,
    this.height,
    this.widthMode = BorderedButtonWidthMode.hug,
    this.textAlign = BorderedButtonTextAlign.center,
  });

  Color _getBorderColor(BorderedButtonColor color) {
    switch (color) {
      case BorderedButtonColor.transparent:
        return Colors.white;
    }
  }

  Color _getFillBgColor(BorderedButtonColor color) {
    switch (color) {
      case BorderedButtonColor.transparent:
        return Colors.transparent;
    }
  }

  Widget _buildChild(Color fgColor, MainAxisSize mainAxisSize) {
    switch (type) {
      case BorderedButtonType.iconLabel:
        return Row(
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: _getMainAxisAlignment(),
          children: [
            if (icon is Icon)
              Icon((icon as Icon).icon, size: 26.sp, color: fgColor),
            if (icon is SvgPicture) icon as SvgPicture,
            if (icon != null) SizedBox(width: 8.w),
            Flexible(child: Text(label ?? '', textAlign: _getTextAlignment())),
          ],
        );
    }
  }

  TextAlign _getTextAlignment() {
    switch (textAlign) {
      case BorderedButtonTextAlign.left:
        return TextAlign.left;
      case BorderedButtonTextAlign.right:
        return TextAlign.right;
      case BorderedButtonTextAlign.center:
        return TextAlign.center;
    }
  }

  MainAxisAlignment _getMainAxisAlignment() {
    switch (textAlign) {
      case BorderedButtonTextAlign.left:
        return MainAxisAlignment.start;
      case BorderedButtonTextAlign.right:
        return MainAxisAlignment.end;
      case BorderedButtonTextAlign.center:
        return MainAxisAlignment.center;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool disabled = isDisabled || onPressed == null;

    final Color mainColor = disabled ? AppColors.gray1 : _getFillBgColor(color);
    final Color fgColor = disabled
        ? AppColors.secondaryText
        : AppColors.primaryText;
    final Color borderColor = disabled
        ? AppColors.gray1
        : _getBorderColor(color);

    final double minWidth;
    final MainAxisSize mainAxisSize;
    switch (widthMode) {
      case BorderedButtonWidthMode.fill:
        minWidth = double.infinity;
        mainAxisSize = MainAxisSize.max;
        break;
      case BorderedButtonWidthMode.fixed:
        minWidth = width ?? 36.w;
        mainAxisSize = MainAxisSize.min;
        break;
      case BorderedButtonWidthMode.hug:
        minWidth = 0;
        mainAxisSize = MainAxisSize.min;
        break;
    }

    return TextButton(
      onPressed: disabled ? null : onPressed,
      style:
          TextButton.styleFrom(
            backgroundColor: mainColor,
            foregroundColor: fgColor,
            minimumSize: Size(minWidth, height ?? 42.w),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            textStyle: AppTypography.smallBold(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
              side: BorderSide(color: borderColor, width: 2.w),
            ),
            disabledForegroundColor: AppColors.secondaryText,
            disabledBackgroundColor: AppColors.gray1,
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.hovered)) {
                return fgColor.withValues(alpha: 0.04);
              }
              if (states.contains(WidgetState.pressed)) {
                return fgColor.withValues(alpha: 0.12);
              }
              return null;
            }),
          ),
      child: _buildChild(fgColor, mainAxisSize),
    );
  }
}
