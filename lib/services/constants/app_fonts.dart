import 'package:flutter/material.dart';

class AppFonts {
  static const String poppins = "Poppins";

  static TextStyle poppinsBlackItalic({double? fontSize, Color? color, FontStyle? fontStyle}) {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontFamily: poppins,
      fontStyle: fontStyle,
      color: color,
      fontSize: fontSize,
    );
  }
}