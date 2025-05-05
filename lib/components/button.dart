import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/screen_utils.dart';

enum ButtonType { filled, icon, outline, iconLabel }

enum ButtonColor { purple, yellow, blue, green, red, none }

enum ButtonWidthMode { fill, hug, fixed }

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

  ButtonStyle _buttonStyle(
    Color mainColor,
    Color fgColor,
    BorderSide? border,
    double minWidth,
  ) {
    return TextButton.styleFrom(
      backgroundColor: mainColor,
      foregroundColor: fgColor,
      minimumSize: Size(minWidth, height ?? 48.h),
      padding:
          type == ButtonType.icon
              ? EdgeInsets.symmetric(horizontal: 11.w, vertical: 8.h)
              : EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      textStyle: AppTypography.normalBold(color: AppColors.black1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side:
            type == ButtonType.outline
                ? border ?? BorderSide.none
                : BorderSide.none,
      ),
    );
  }

  Widget _buildChild(Color fgColor, MainAxisSize mainAxisSize) {
    switch (type) {
      case ButtonType.icon:
        if (icon is Icon) {
          return Icon((icon as Icon).icon, size: 26.sp, color: fgColor);
        }
        return SizedBox();
      case ButtonType.filled:
      case ButtonType.outline:
        return Text(label ?? '');
      case ButtonType.iconLabel:
        return Row(
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon is Icon)
              Icon((icon as Icon).icon, size: 26.sp, color: fgColor),
            if (icon != null) SizedBox(width: 8.w),
            Text(label ?? ''),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context);

    final bool disabled = isDisabled || onPressed == null;
    final Color mainColor =
        disabled
            ? AppColors.gray1
            : type == ButtonType.outline
            ? _getOutlineBgColor(color)
            : _getFillBgColor(color);

    final Color fgColor =
        disabled
            ? AppColors.secondaryText
            : (color == ButtonColor.red || type == ButtonType.outline
                ? AppColors.primaryText
                : Colors.black);

    final BorderSide border =
        disabled
            ? BorderSide(color: AppColors.gray1, width: 2.w)
            : BorderSide(
              color: _getBorderColor(color),
              width: type == ButtonType.outline ? 2.w : 3.w,
            );

    final double minWidth;
    final MainAxisSize mainAxisSize;
    switch (widthMode) {
      case ButtonWidthMode.fill:
        minWidth = double.infinity;
        mainAxisSize = MainAxisSize.max;
        break;
      case ButtonWidthMode.fixed:
        minWidth = width ?? 42.w;
        mainAxisSize = MainAxisSize.min;
        break;
      case ButtonWidthMode.hug:
        minWidth = 0;
        mainAxisSize = MainAxisSize.min;
        break;
    }

    final ButtonStyle style = _buttonStyle(
      mainColor,
      fgColor,
      border,
      minWidth,
    );

    return type != ButtonType.outline
        ? Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11.r),
            border: disabled ? null : Border(right: border, bottom: border),
          ),
          child: TextButton(
            onPressed: disabled ? null : onPressed,
            style: style,
            child: _buildChild(fgColor, mainAxisSize),
          ),
        )
        : TextButton(
          onPressed: disabled ? null : onPressed,
          style: style,
          child: _buildChild(fgColor, mainAxisSize),
        );
  }
}
