import 'package:flutter/material.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = "lightCode";

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // App Colors
  Color get white_A700 => Color(0xFFFFFFFF);
  Color get gray_400 => Color(0xFFB3B3B3);
  Color get gray_900 => Color(0xFF260F06);
  Color get gray_200 => Color(0xFFF0ECEB);
  Color get gray_900_01 => Color(0xFF0A1315);
  Color get gray_900_02 => Color(0xFF041816);
  Color get gray_500 => Color(0xFFA2A2A2);
  Color get black_900 => Color(0xFF000000);
  Color get gray_100 => Color(0xFFF7F5F4);

  // Additional Colors
  Color get transparentCustom => Colors.transparent;
  Color get whiteCustom => Colors.white;
  Color get greyCustom => Colors.grey;
  Color get color00F7F5 => Color(0x00F7F5F4);
  Color get color99F7F5 => Color(0x99F7F5F4);
  Color get color15000A => Color(0x15000A13);
  Color get color15E50A => Color(0x15E50A13);

  // New Color Constants
  Color get gray_700 => Color(0xFF515151);
  Color get gray_700_CC => Color(0xCC515151);
  Color get gray_600 => Color(0xFFA4A4A4);
  Color get color0C0000 => Color(0x0C000000);
  Color get red_300 => Color(0xFFE57373);
  Color get gray_800 => Color(0xFF737373);
  Color get amber_600 => Color(0xFFFFB800);
  Color get brown_600 => Color(0xFF7C412E);
  Color get gray_300 => Color(0xFFD9D9D9);
  Color get blue_500 => Color(0xFF2196F3);
  Color get gray_300_02 => Color(0xFFC3C3C3);
  Color get gray_300_03 => Color(0xFFBCBCBC);
  Color get greenCustom => Colors.green;
  Color get redCustom => Colors.red;

  // Color Shades - Each shade has its own dedicated constant
  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
  Color get grey300 => Colors.grey[300]!;
  Color get grey400 => Colors.grey[400]!;

  // Additional New Colors
  Color get brown_100 => Color(0xFFB5804F);
  Color get gray_650 => Color(0xFF888888);
  Color get gray_300_66 => Color(0x66D9D9D9);
  Color get color14000000 => Color(0x14000000);
  Color get gray_750 => Color(0xFF939393);
  Color get white_FA => Color(0xFFFAFAFA);
  Color get green_400 => Color(0xFF4CAF50);
  Color get gray_650_88 => Color(0x88888888);
  Color get white_FA_99 => Color(0x99FAFAFA);
  Color get orangeCustom => Colors.orange;
  Color get blackCustom => Colors.black;
}
