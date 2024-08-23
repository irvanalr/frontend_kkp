import 'package:flutter/material.dart';

class ResponsiveAlert {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// alert
  static late double alertTitleInformasiFontSize;
  static late double alertContentFontSize;
  static late double alertActionOkFontSize;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (Small Phone (API 29 & VanillaIceCream))
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      alertTitleInformasiFontSize = 13 * textScaleFactor;
      alertContentFontSize = 12 * textScaleFactor;
      alertActionOkFontSize = 15 * textScaleFactor;

      // 1080 x 1920 (pixel 2 API 29)
    } else if (screenWidth == 411.4 && screenHeight == 683.4) {
      alertTitleInformasiFontSize = 15 * textScaleFactor;
      alertContentFontSize = 12 * textScaleFactor;
      alertActionOkFontSize = 17 * textScaleFactor;

      // 1080 x 2340 (pixel 5 API 29)
    } else if (screenWidth == 392.7 && screenHeight == 802.9) {
      alertTitleInformasiFontSize = 15 * textScaleFactor;
      alertContentFontSize = 12 * textScaleFactor;
      alertActionOkFontSize = 17 * textScaleFactor;

      // 1080 x 2400 (Medium Phone & pixel 6 & pixel 6a
      // & pixel 7 & pixel 7a & pixel 8 API VanillaIceCream)
    } else if (screenWidth == 411.4 && screenHeight == 890.3) {
      alertTitleInformasiFontSize = 17 * textScaleFactor;
      alertContentFontSize = 12 * textScaleFactor;
      alertActionOkFontSize = 19 * textScaleFactor;

      // 1440 x 3120 (pixel 7pro API 29)
    } else if (screenWidth == 411.4 && screenHeight == 843.4) {
      alertTitleInformasiFontSize = 18 * textScaleFactor;
      alertContentFontSize = 12 * textScaleFactor;
      alertActionOkFontSize = 21 * textScaleFactor;
    }else {
      alertTitleInformasiFontSize = 20 * textScaleFactor;
      alertContentFontSize = 12 * textScaleFactor;
      alertActionOkFontSize = 18 * textScaleFactor;
    }
  }
}