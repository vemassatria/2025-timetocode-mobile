import 'package:flutter/material.dart';

class AppTypography {
  static const String _fontFamily = 'Comic Neue';

  // === Heading ===
  static const TextStyle heading1 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 56,
    height: 61.6 / 56,
    letterSpacing: 0.0,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 48,
    height: 52.8 / 48,
    letterSpacing: 0.0,
  );

  static const TextStyle heading3 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 40,
    height: 44 / 40,
    letterSpacing: 0.0,
  );

  static const TextStyle heading4 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 32,
    height: 35.2 / 32,
    letterSpacing: 0.0,
  );

  static const TextStyle heading5 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    height: 26.4 / 24,
    letterSpacing: 0.0,
  );

  static const TextStyle heading6 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    height: 22 / 20,
    letterSpacing: 0.0,
  );

  // === Body (Bold) ===
  static const TextStyle largeBold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    height: 28 / 20,
    letterSpacing: 0.0,
  );

  static const TextStyle mediumBold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    height: 25.2 / 18,
    letterSpacing: 0.0,
  );

  static const TextStyle normalBold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    height: 22.4 / 16,
    letterSpacing: 0.0,
  );

  static const TextStyle smallBold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    height: 19.6 / 14,
    letterSpacing: 0.0,
  );

  // === Body ===
  static const TextStyle large = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 20,
    height: 28 / 20,
    letterSpacing: 0.0,
  );

  static const TextStyle medium = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 18,
    height: 25.2 / 18,
    letterSpacing: 0.0,
  );

  static const TextStyle normal = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    height: 22.4 / 16,
    letterSpacing: 0.0,
  );

  static const TextStyle small = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 19.6 / 14,
    letterSpacing: 0.0,
  );
}
