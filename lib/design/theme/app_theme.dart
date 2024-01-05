import 'package:bloc_auth/design/theme/app_color.dart';
import 'package:bloc_auth/design/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorSchemeSeed: AppColors.primaryColor,

  textTheme: AppFonts.lightTextTheme,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  // Define the rest of your theme data
);

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  colorSchemeSeed: AppColors.primaryColor,
  textTheme: AppFonts.darkTextTheme,
  // Define the rest of your theme data
);
