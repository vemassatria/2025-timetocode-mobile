import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';

class AppTypography {
  static const String _fontFamily = 'Comic Neue';

  // === Heading ===
  static TextStyle heading1({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 56.sp,
    height: 61.6.h / 56.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading2({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 48.sp,
    height: 52.8.h / 48.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading3({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 40.sp,
    height: 44.h / 40.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading4({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 32.sp,
    height: 35.2.h / 32.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading5({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 24.sp,
    height: 26.4.h / 24.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading6({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 20.sp,
    height: 22.h / 20.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  // === Body (Bold) ===
  static TextStyle largeBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 20.sp,
    height: 28.h / 20.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle mediumBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 18.sp,
    height: 25.2.h / 18.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle normalBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 16.sp,
    height: 22.4.h / 16.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle smallBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 14.sp,
    height: 19.6.h / 14.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle verySmallBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 12.sp,
    height: 16.h / 12.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  // === Body ===
  static TextStyle large({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 20.sp,
    height: 28.h / 20.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle medium({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 18.sp,
    height: 25.2.h / 18.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle normal({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 16.sp,
    height: 22.4.h / 16.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle small({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 14.sp,
    height: 19.6.h / 14.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle verySmall({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 12.sp,
    height: 16.h / 12.sp,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );
}
