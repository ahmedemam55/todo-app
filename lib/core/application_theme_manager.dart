import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static const Color primaryColor = Color(0xFF5D9CEC);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Color(0xFFDFECDB),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      toolbarHeight: 140,
      titleTextStyle: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      selectedIconTheme: IconThemeData(color: primaryColor, size: 35),
      unselectedIconTheme: IconThemeData(size: 28),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      displayLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Color(0xFF060E1E),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      toolbarHeight: 140,
      titleTextStyle: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      selectedIconTheme: IconThemeData(color: primaryColor, size: 35),
      unselectedIconTheme: IconThemeData(size: 28, color: Colors.white),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      displayLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
  );
}
