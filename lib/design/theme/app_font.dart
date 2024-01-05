import 'package:flutter/material.dart';

class AppFonts {
  const AppFonts._();
  static const TextTheme lightTextTheme = TextTheme(
    titleLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 24,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      fontSize: 18,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
  );

  static const TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(color: Colors.white),
    bodyLarge: TextStyle(color: Colors.white),
  );
}
