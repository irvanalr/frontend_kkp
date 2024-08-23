import 'package:flutter/material.dart';

class ResponsiveSplashScreen {
  static late double screenWidth;
  static late double screenHeight;

  // SplashScreen
  static late double splashScreenBmtdigiScale;

    static void init(BuildContext context) {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;

      // 720 x 1280 (with bottom navigation bar)
      if (screenWidth == 360.0 && screenHeight == 592.0) {
        splashScreenBmtdigiScale = 5;

        // 720 x 1280 (with gesture detector)
      } else if(screenWidth == 360.0 && screenHeight == 616.0) {
        splashScreenBmtdigiScale = 5;

        // 1080 x 1920 (with bottom navigation bar)
      } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
        splashScreenBmtdigiScale = 5;

        // 1080 x 1920 (with bottom navigation bar)
      } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
        splashScreenBmtdigiScale = 5;

        // 1080 x 2400 (with bottom navigation bar)
      } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
        splashScreenBmtdigiScale = 5;

        // 1080 x 2400 (with gesture detector)
      } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
        splashScreenBmtdigiScale = 5;

        // 1440 x 3120
      } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
        splashScreenBmtdigiScale = 5;

      }else {
        splashScreenBmtdigiScale = 5;

      }
    }
  }