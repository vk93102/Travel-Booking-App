import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Display Styles
  // Large text styles for prominent headings

  TextStyle get display40BoldPoppins => TextStyle(
        fontSize: 40.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
        color: appTheme.gray_900_02,
      );

  TextStyle get display32BoldPlusJakartaSans => TextStyle(
        fontSize: 32.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Plus Jakarta Sans',
        color: appTheme.gray_900_02,
      );

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline24BoldSyne => TextStyle(
        fontSize: 24.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Syne',
        color: appTheme.white_A700,
      );

  TextStyle get headline24SemiBoldPoppins => TextStyle(
        fontSize: 24.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        color: appTheme.gray_900_02,
      );

  TextStyle get headline24BoldPlusJakartaSans => TextStyle(
        fontSize: 24.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Plus Jakarta Sans',
        color: appTheme.gray_900_02,
      );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title18BoldSyne => TextStyle(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Syne',
        color: appTheme.gray_900_02,
      );

  TextStyle get title18Bold => TextStyle(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );

  TextStyle get title18SemiBoldPoppins => TextStyle(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        color: appTheme.gray_900_02,
      );

  TextStyle get title16MediumPoppins => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      );

  TextStyle get title16SemiBoldSyne => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Syne',
      );

  TextStyle get title16BoldPoppins => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
        color: appTheme.gray_900_02,
      );

  TextStyle get title16SemiBoldPoppins => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        color: appTheme.gray_900_02,
      );

  TextStyle get title16SemiBoldPlusJakartaSans => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Plus Jakarta Sans',
        color: appTheme.gray_900_01,
      );

  TextStyle get title15RegularPlusJakartaSans => TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Plus Jakarta Sans',
        color: appTheme.black_900,
      );

  TextStyle get title15SemiBoldPoppins => TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        color: appTheme.gray_900_02,
      );

  TextStyle get title15BoldPoppins => TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
        color: appTheme.gray_900_02,
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body14RegularPoppins => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        color: appTheme.black_900,
      );

  TextStyle get body14SemiBoldSyne => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Syne',
      );

  TextStyle get body14MediumPoppins => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      );

  TextStyle get body14MediumSyne => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Syne',
      );

  TextStyle get body14RegularPlusJakartaSans => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Plus Jakarta Sans',
      );

  TextStyle get body14SemiBoldPoppins => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        color: appTheme.gray_600,
      );

  TextStyle get body14SemiBoldPlusJakartaSans => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Plus Jakarta Sans',
        color: appTheme.gray_900_01,
      );

  TextStyle get body14MediumPlusJakartaSans => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Plus Jakarta Sans',
        color: appTheme.gray_900_01,
      );

  TextStyle get body14BoldPoppins => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      );

  TextStyle get body13RegularPoppins => TextStyle(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        color: appTheme.gray_500,
      );

  TextStyle get body13SemiBoldPoppins => TextStyle(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
      );

  TextStyle get body13MediumPoppins => TextStyle(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      );

  TextStyle get body12RegularPoppins => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
      );

  TextStyle get body12MediumPoppins => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        color: appTheme.gray_700,
      );

  TextStyle get body12RegularPlusJakartaSans => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Plus Jakarta Sans',
        color: appTheme.gray_800,
      );
}
