import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData light = ThemeData(
      primaryColor: AppColors.whiteCoffee,
      primaryColorLight: AppColors.white,
      primaryColorDark: AppColors.black,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: AppColors.black, fontSize: 14),
        bodyMedium: TextStyle(color: AppColors.black, fontSize: 18),
        bodyLarge: TextStyle(color: AppColors.black, fontSize: 20),
      ),
      appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.whiteCoffee),
          titleTextStyle: TextStyle(
              fontSize: 30,
              color: AppColors.whiteCoffee,
              fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.whiteCoffee,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
      ));
  static ThemeData dark = ThemeData(
      primaryColor: Colors.brown,
      primaryColorLight: AppColors.white,
      primaryColorDark: AppColors.black,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: AppColors.white, fontSize: 14),
        bodyMedium: TextStyle(color: AppColors.white, fontSize: 18),
        bodyLarge: TextStyle(color: AppColors.white, fontSize: 20),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.brown,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
      ));
}
