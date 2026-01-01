import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
      // textTheme: TextTheme(
      //   headlineMedium: AppStyles.bold16White
      //
      // )
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.black,
        centerTitle: true,
        iconTheme: IconThemeData(
            color: AppColors.primaryColor
        ),
      )
  );
}
