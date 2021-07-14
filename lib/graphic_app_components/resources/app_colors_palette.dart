import 'dart:ui';
import 'package:flutter/material.dart';

class AppColorsPalette {

  const AppColorsPalette._();

  static const _Main main = _Main._();
  static const _Background background = _Background._();
  static const _AccentColors accents = _AccentColors._();
  static const _GrayScale grayScale = _GrayScale._();
}

class _Main {

  const _Main._();

  Color get darker => Color(0x46351D);
  Color get mediumDark => Color(0x202C59);
  Color get medium => Color(0x5386E4);
  Color get mediumClear => Color(0xF5D547);
  Color get clearer => Color(0xFFD9DA);
}

class _Background {

  const _Background._();

  Color get dark => Color(0xFAF3DD);
  Color get medium => Color(0xEDFFEC);
  Color get clear => Color(0x8D909B);
}

class _AccentColors {
  const _AccentColors._();

  Color get lightSeaGreen => Color(0xFF21A6AD);
  Color get mediumSeaGreen => Color(0xFF39B54A);
  Color get lightningYellow => Color(0xFFF79A1D);
  Color get carmine => Color(0xFF9E0B0F);
  Color get scarlet => Color(0xFFFF1C00);
}

class _GrayScale {
  const _GrayScale._();

  Color get black => Color(0xFF000000);
  Color get codGray => Color(0xFF191919);
  Color get mineShaft => Color(0xFF333333);
  Color get doveGray => Color(0xFF666666);
  Color get silver => Color(0xFFC2C2C2);
  Color get alto => Color(0xFFD9D9D9);
  Color get seashell => Color(0xFFF1F1F1);
  Color get alabaster => Color(0xFFF9F9F9);
  Color get white => Color(0xFFFFFFFF);
}