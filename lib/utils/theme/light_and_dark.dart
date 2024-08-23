import 'package:flutter/material.dart';

class LightAndDarkMode {
  static Color primaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0xFF1B3E5F) : const Color(0xFF5D5C58);
  }
  static Color teksLinked(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0xFF196AB4): const Color(0xFFFFFEFD);
  }
  static Color teksRead(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white;
  }
  static Color teksRead2(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0xFF1B3E5F) : Colors.white;
  }
    static Color teksRead3(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0xFF1B3E5F) : const Color(0xFF196AB4);
  }
  static Color buttonGantiAkun(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0xFF1B3E5F) : const Color(0xFF959396);
  }
  static Color backgroundSplashScreen(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0xFF1B3E5F) : Colors.black;
  }
  static Color bottomNavBar(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0xFF1B3E5F) : Theme.of(context).scaffoldBackgroundColor;
  }
  static Color appBarBackgroundCostumerServices(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0xFF196AB4) : const Color(0xFF959396);
  }
  static Color border(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white;
  }
  static Color cardColor1(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0xFF155087) : const Color(0xFF959396);
  }
  static Color cardColor2(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0xFF2B7ECA) : const Color(0xFF5D5C58);
  }
  static Color cardColor3(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0xFF155087) : const Color(0xFF5D5C58);
  }
  static Color cardColor4(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0xFF2B7ECA) : const Color(0xFF5D5C58);
  }
  static Color cardColor5(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0xFF155087) : const Color(0xFF959396);
  }
  static Color cardColor6(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? Colors.white: Colors.black;
  }
  static Color cardColor7(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? Colors.white: const Color(0xFF959396);
  }
  static Color cardColor8(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0xFF4EA4F3) : const Color(0xFFF5F1F1);
  }
  static Color lineSvgColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? Colors.grey.withOpacity(0.5) : Colors.white;
  }
  static Color navbarBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? const Color(0XFF2B94F5) : Colors.black;
  }
}