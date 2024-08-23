import 'package:flutter/material.dart';

class ResponsiveRekening {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  static late double rekeningStringTitleFontSize;
  static late double rekeningStringSimpananFontSize;
  static late double rekeningStringSimpananBerjangkaFontSize;
  static late double rekeningStringPembayaranFontSize;
  static late double rekeningPreferedSizeHeight;
  static late double rekeningContainerTabBarWidth;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (with bottom navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      rekeningStringTitleFontSize = 12 * textScaleFactor;
      rekeningStringSimpananFontSize = 10 * textScaleFactor;
      rekeningStringSimpananBerjangkaFontSize = 10 * textScaleFactor;
      rekeningStringPembayaranFontSize = 10 * textScaleFactor;
      rekeningPreferedSizeHeight = screenHeight * 0.04;
      rekeningContainerTabBarWidth = screenWidth * 0.9;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      rekeningStringTitleFontSize = 12 * textScaleFactor;
      rekeningStringSimpananFontSize = 10 * textScaleFactor;
      rekeningStringSimpananBerjangkaFontSize = 10 * textScaleFactor;
      rekeningStringPembayaranFontSize = 10 * textScaleFactor;
      rekeningPreferedSizeHeight = screenHeight * 0.04;
      rekeningContainerTabBarWidth = screenWidth * 0.9;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      rekeningStringTitleFontSize = 14 * textScaleFactor;
      rekeningStringSimpananFontSize = 10 * textScaleFactor;
      rekeningStringSimpananBerjangkaFontSize = 10 * textScaleFactor;
      rekeningStringPembayaranFontSize = 10 * textScaleFactor;
      rekeningPreferedSizeHeight = screenHeight * 0.04;
      rekeningContainerTabBarWidth = screenWidth * 0.9;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      rekeningStringTitleFontSize = 14 * textScaleFactor;
      rekeningStringSimpananFontSize = 10 * textScaleFactor;
      rekeningStringSimpananBerjangkaFontSize = 10 * textScaleFactor;
      rekeningStringPembayaranFontSize = 10 * textScaleFactor;
      rekeningPreferedSizeHeight = screenHeight * 0.04;
      rekeningContainerTabBarWidth = screenWidth * 0.9;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      rekeningStringTitleFontSize = 14 * textScaleFactor;
      rekeningStringSimpananFontSize = 12 * textScaleFactor;
      rekeningStringSimpananBerjangkaFontSize = 12 * textScaleFactor;
      rekeningStringPembayaranFontSize = 12 * textScaleFactor;
      rekeningPreferedSizeHeight = screenHeight * 0.04;
      rekeningContainerTabBarWidth = screenWidth * 0.92;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      rekeningStringTitleFontSize = 14 * textScaleFactor;
      rekeningStringSimpananFontSize = 12 * textScaleFactor;
      rekeningStringSimpananBerjangkaFontSize = 12 * textScaleFactor;
      rekeningStringPembayaranFontSize = 12 * textScaleFactor;
      rekeningPreferedSizeHeight = screenHeight * 0.04;
      rekeningContainerTabBarWidth = screenWidth * 0.92;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      rekeningStringTitleFontSize = 14 * textScaleFactor;
      rekeningStringSimpananFontSize = 12 * textScaleFactor;
      rekeningStringSimpananBerjangkaFontSize = 12 * textScaleFactor;
      rekeningStringPembayaranFontSize = 12 * textScaleFactor;
      rekeningPreferedSizeHeight = screenHeight * 0.04;
      rekeningContainerTabBarWidth = screenWidth * 0.9;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      rekeningStringTitleFontSize = 14 * textScaleFactor;
      rekeningStringSimpananFontSize = 12 * textScaleFactor;
      rekeningStringSimpananBerjangkaFontSize = 12 * textScaleFactor;
      rekeningStringPembayaranFontSize = 12 * textScaleFactor;
      rekeningPreferedSizeHeight = screenHeight * 0.04;
      rekeningContainerTabBarWidth = screenWidth * 0.9;

    } else {
      rekeningStringTitleFontSize = 14 * textScaleFactor;
      rekeningStringSimpananFontSize = 12 * textScaleFactor;
      rekeningStringSimpananBerjangkaFontSize = 12 * textScaleFactor;
      rekeningStringPembayaranFontSize = 12 * textScaleFactor;
      rekeningPreferedSizeHeight = screenHeight * 0.04;
      rekeningContainerTabBarWidth = screenWidth * 0.92;
    }
  }
}