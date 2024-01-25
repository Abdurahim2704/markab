import 'package:flutter/material.dart';
import 'package:markab/config/core/constants/colors.dart';

sealed class AppTheme {
  static final _appTheme = ThemeData(
    fontFamily: "ProximaNova",
  );

  static final lightTheme = _appTheme.copyWith(
      primaryColor: CustomColors.primaryBlueColor,
      scaffoldBackgroundColor: CustomColors.scaffoldBackground,
      textTheme: TextTheme(),
      colorScheme:
          ColorScheme.fromSeed(seedColor: CustomColors.primaryBlueColor));

  static const scaffoldGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        CustomColors.gradientColor1,
        CustomColors.gradientColor2,
      ]);
}
