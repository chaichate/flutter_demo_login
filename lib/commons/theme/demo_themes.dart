import 'package:flutter/material.dart';
import '../../constants/styles.dart';

class DemoThemes {
  static final darkTheme = ThemeData(
      textTheme: TextTheme(
        headlineLarge: Styles.h1.copyWith(color: Styles.whiteColor),
        headlineMedium: Styles.h2.copyWith(color: Styles.whiteColor),
        headlineSmall: Styles.h3.copyWith(color: Styles.whiteColor),
        titleLarge: Styles.h4.copyWith(color: Styles.whiteColor),
        titleMedium: Styles.h5.copyWith(color: Styles.whiteColor),
        titleSmall: Styles.h6.copyWith(color: Styles.whiteColor),
        labelLarge: Styles.bodyL.copyWith(color: Styles.whiteColor),
        labelMedium: Styles.bodyM.copyWith(color: Styles.whiteColor),
        labelSmall: Styles.bodyS.copyWith(color: Styles.whiteColor),
        bodyLarge: Styles.bodyL.copyWith(color: Styles.whiteColor),
        bodyMedium: Styles.bodyM.copyWith(color: Styles.whiteColor),
        bodySmall: Styles.bodyS.copyWith(color: Styles.whiteColor),
      ),
      primaryColor: Styles.primaryColor,
      hintColor: Styles.whiteColor,
      scaffoldBackgroundColor: Colors.grey.shade900,
      colorScheme: const ColorScheme.dark(),
      fontFamily: 'Prompt');
  static final lightTheme = ThemeData(
      textTheme: TextTheme(
        headlineLarge: Styles.h1,
        headlineMedium: Styles.h2,
        headlineSmall: Styles.h3,
        titleLarge: Styles.h4,
        titleMedium: Styles.h5,
        titleSmall: Styles.h6,
        labelLarge: Styles.bodyL,
        labelMedium: Styles.bodyM,
        labelSmall: Styles.bodyS,
        bodyLarge: Styles.bodyL,
        bodyMedium: Styles.bodyM,
        bodySmall: Styles.bodyS,
      ),
      primaryColor: Styles.primaryColor,
      hintColor: Styles.greyColor500,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      fontFamily: 'Prompt');
}
