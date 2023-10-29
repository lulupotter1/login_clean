import 'package:flutter/material.dart';
import 'package:registration_test/config/themes/theme_colors.dart';

abstract class ThemeTextManropeMedium {
  static const fontWeight = FontWeight.w500;
  static const fontFamily = "ManropeMedium";
  static const fontColor = ThemeColors.white;

  static const cmSize = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
}

abstract class ThemeTextManropeRegular {
  static const fontWeight = FontWeight.w400;
  static const fontFamily = "ManropeRegular";
  static const fontColor = ThemeColors.white;

  static const cmSize = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
}

abstract class ThemeTextManropeBold {
  static const fontWeight = FontWeight.w700;
  static const fontFamily = "ManropeBold";
  static const fontColor = ThemeColors.white;

  static const cmSize = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
}

abstract class ThemeTextManropeSemiBold {
  static const fontWeight = FontWeight.w600;
  static const fontFamily = "ManropeSemiBold";
  static const fontColor = ThemeColors.white;

  static const cmSize = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
}
