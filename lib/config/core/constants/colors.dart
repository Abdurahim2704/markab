import 'package:flutter/material.dart';

sealed class CustomColors {
  static const primaryBlueColor = Color(0xFF2F80ED);
  static const titleBlue = Color(0xFF366AD2);
  static const grey = Color(0xFFA0A0A0);
  static const scaffoldBackground = Color(0xFFFCFCFE);
  static const black = Color(0xFF1E1E1E);
  static const cA0A0A0 = Color(0xFFA0A0A0);
  static const textfieldBorder = Color(0xFFB2D3FF);
  static const textfieldGrey = Color(0xFFF0F0F0);
  static const gradientColor1 = Color(0xffFCFCFE);
  static const gradientColor2 = Color(0xffA3BFF3);

  // credit card's colors
  static const cardBlue = Color(0xFF2F80ED);
  static const cardGreen = Color(0xFF4DB85E);
  static const cardRed = Color(0xFFEE5353);

  static List<Color> cardColors = [
    cardBlue,
    cardGreen,
    cardRed,
  ];
}
