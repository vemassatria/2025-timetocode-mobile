import 'package:flutter/material.dart';
import 'package:timetocode/themes/colors.dart';

class AppTypography {
  static const String _fontFamily = 'Comic Neue';

  // === Heading ===
  static TextStyle heading1({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 56,
    height: 61.6 / 56,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading2({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 48,
    height: 52.8 / 48,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading3({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 40,
    height: 44 / 40,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading4({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 32,
    height: 35.2 / 32,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading5({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    height: 26.4 / 24,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle heading6({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    height: 22 / 20,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  // === Body (Bold) ===
  static TextStyle largeBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    height: 28 / 20,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle mediumBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    height: 25.2 / 18,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle normalBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    height: 22.4 / 16,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle smallBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    height: 19.6 / 14,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  // === Body ===
  static TextStyle large({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 20,
    height: 28 / 20,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle medium({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 18,
    height: 25.2 / 18,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle normal({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    height: 22.4 / 16,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );

  static TextStyle small({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 19.6 / 14,
    letterSpacing: 0.0,
    color: color ?? AppColors.primaryText,
  );
}
