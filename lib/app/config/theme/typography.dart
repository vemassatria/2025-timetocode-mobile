import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';

class AppTypography {
  static const String _fontFamily = 'Comic Neue';
  static const double _headingHeight = 1.2;
  static const double _bodyHeight = 1.5;
  static const double _smallBodyHeight = 1.4;

  // === Heading ===
  static TextStyle heading1({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 56.r,
    height: _headingHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading2({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 48.r,
    height: _headingHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading3({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 40.r,
    height: _headingHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading4({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 32.r,
    height: _headingHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading5({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 24.r,
    height: _headingHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading6({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 20.r,
    height: _headingHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  // === Body (Bold) ===
  static TextStyle largeBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 20.r,
    height: _bodyHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle mediumBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 18.r,
    height: _bodyHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle normalBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 16.r,
    height: _bodyHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle smallNormalBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 15.r,
    height: _bodyHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle smallBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 14.r,
    height: _smallBodyHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle verySmallBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 12.r,
    height: _smallBodyHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  // === Body ===
  static TextStyle large({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 20.r,
    height: _bodyHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle medium({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 18.r,
    height: _bodyHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle normal({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 16.r,
    height: _bodyHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle small({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 14.r,
    height: _smallBodyHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle verySmall({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 12.r,
    height: _smallBodyHeight,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );
}
