import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
        primaryColor: isDarkTheme ? Colors.white : Colors.black,
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        cardColor: isDarkTheme ? Colors.grey : Colors.white);
  }
}
