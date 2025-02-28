import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {

  static const double fontSizeExtraSmall = 8.0;
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 16.0;
  static const double fontSizeLarge = 20.0;
  static const double fontSizeExtraLarge = 24.0;

  // static const String fontFamilyPrimary = 'Roboto';
  static const String fontFamilySecondary = 'Rosario';
  static const String fontFamilyFun = 'Nunito';

  static const TextStyle headline1 = TextStyle(
    fontSize: fontSizeExtraLarge,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: fontSizeMedium,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle caption = TextStyle(
    fontSize: fontSizeSmall,
    fontWeight: FontWeight.w300,
    color: Colors.black45,

  );

  static TextStyle button = GoogleFonts.roboto(
    fontSize: fontSizeSmall,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static TextStyle question = GoogleFonts.roboto(
      fontSize: fontSizeLarge,
      fontWeight: FontWeight.bold,
      color: Colors.black87
  );
}