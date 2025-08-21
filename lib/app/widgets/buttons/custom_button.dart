import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

enum ButtonType { filled, icon, outline, iconLabel }

enum ButtonColor { purple, yellow, blue, green, red, none }

enum ButtonWidthMode { fill, hug, fixed }

enum ButtonTextAlign { left, center, right }

class CustomButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonColor color;
  final Widget? icon;
  final bool isDisabled;
  final double? width;
  final double? height;
  final ButtonWidthMode widthMode;
  final ButtonTextAlign textAlign;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = ButtonType.filled,
    this.color = ButtonColor.blue,
    this.icon,
    this.isDisabled = false,
    this.width,
    this.height,
    this.widthMode = ButtonWidthMode.hug,
    this.textAlign = ButtonTextAlign.center, // Default to center
  });

  Color _getFillBgColor(ButtonColor color) {
    switch (color) {
      case ButtonColor.purple:
        return AppColors.softViolet;
      case ButtonColor.yellow:
        return AppColors.rewardYellow;
      case ButtonColor.green:
        return AppColors.lightGreen;
      case ButtonColor.red:
        return AppColors.dangerRed;
      case ButtonColor.none:
        return Colors.transparent;
      case ButtonColor.blue:
        return AppColors.skyByte;
    }
  }

  Color _getOutlineBgColor(ButtonColor color) {
    switch (color) {
      case ButtonColor.yellow:
        return AppColors.transparentYellow;
      case ButtonColor.green:
        return AppColors.greenTransparent;
      case ButtonColor.red:
        return AppColors.redTransparent;
      case ButtonColor.none:
        return Colors.transparent;
      case ButtonColor.blue:
        return AppColors.blueTransparent;
      case ButtonColor.purple:
        return Colors.purple;
    }
  }

  Color _getBorderColor(ButtonColor color) {
    switch (color) {
      case ButtonColor.purple:
        return AppColors.cyberPurple;
      case ButtonColor.yellow:
        return AppColors.challengeOrange;
      case ButtonColor.green:
        return AppColors.xpGreen;
      case ButtonColor.red:
        return AppColors.darkRed;
      case ButtonColor.none:
        return AppColors.primaryText;
      case ButtonColor.blue:
        return AppColors.technoBlue;
    }
  }

  ButtonStyle _buttonStyle(Color mainColor, Color fgColor, double minWidth) {
    final Color borderColor = _getBorderColor(color);
    final BorderSide borderSide = BorderSide(color: borderColor, width: 2.w);

    return TextButton.styleFrom(
      backgroundColor: mainColor,
      foregroundColor: fgColor,
      minimumSize: Size(minWidth, height ?? 42.w),
      padding: type == ButtonType.icon
          ? EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h)
          : EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      textStyle: AppTypography.smallBold(color: AppColors.black1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: type == ButtonType.outline ? borderSide : BorderSide.none,
      ),
    );
  }

  Widget _buildChild(Color fgColor, MainAxisSize mainAxisSize) {
    switch (type) {
      case ButtonType.icon:
        if (icon is Icon) {
          return Icon((icon as Icon).icon, size: 26.sp, color: fgColor);
        }
        if (icon is SvgPicture) {
          return icon as SvgPicture;
        }
        return const SizedBox();
      case ButtonType.filled:
      case ButtonType.outline:
        return Text(label ?? '', textAlign: _getTextAlignment());
      case ButtonType.iconLabel:
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

  // Add these helper methods
  TextAlign _getTextAlignment() {
    switch (textAlign) {
      case ButtonTextAlign.left:
        return TextAlign.left;
      case ButtonTextAlign.right:
        return TextAlign.right;
      case ButtonTextAlign.center:
        return TextAlign.center;
    }
  }

  MainAxisAlignment _getMainAxisAlignment() {
    switch (textAlign) {
      case ButtonTextAlign.left:
        return MainAxisAlignment.start;
      case ButtonTextAlign.right:
        return MainAxisAlignment.end;
      case ButtonTextAlign.center:
        return MainAxisAlignment.center;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool disabled = isDisabled || onPressed == null;
    final Color mainColor = disabled
        ? AppColors.gray1
        : (type == ButtonType.outline
              ? _getOutlineBgColor(color)
              : _getFillBgColor(color));

    final Color fgColor = disabled
        ? AppColors.secondaryText
        : (color == ButtonColor.red || type == ButtonType.outline
              ? AppColors.primaryText
              : Colors.black);

    final double minWidth;
    final MainAxisSize mainAxisSize;
    switch (widthMode) {
      case ButtonWidthMode.fill:
        minWidth = double.infinity;
        mainAxisSize = MainAxisSize.max;
        break;
      case ButtonWidthMode.fixed:
        minWidth = width ?? 36.w;
        mainAxisSize = MainAxisSize.min;
        break;
      case ButtonWidthMode.hug:
        minWidth = 0;
        mainAxisSize = MainAxisSize.min;
        break;
    }

    final ButtonStyle style = _buttonStyle(mainColor, fgColor, minWidth);

    return Container(
      decoration: (type != ButtonType.outline && !disabled)
          ? BoxDecoration(
              color: mainColor,
              border: Border(
                right: BorderSide(color: _getBorderColor(color), width: 2.w),
                bottom: BorderSide(color: _getBorderColor(color), width: 2.w),
              ),
              borderRadius: BorderRadius.circular(8.r),
            )
          : null,
      child: TextButton(
        onPressed: disabled ? null : onPressed,
        style: style,
        child: _buildChild(fgColor, mainAxisSize),
      ),
    );
  }
}
