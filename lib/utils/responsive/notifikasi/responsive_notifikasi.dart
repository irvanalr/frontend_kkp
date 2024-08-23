
import 'package:flutter/material.dart';

class ResponsiveNotifikasi {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  static late double notifikasiStringTitleFontSize;
  static late double notifikasiStringTidakAdaNotifikasiFontSize;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (with bottom navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      notifikasiStringTitleFontSize = 12 * textScaleFactor;
      notifikasiStringTidakAdaNotifikasiFontSize = 10 * textScaleFactor;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      notifikasiStringTitleFontSize = 12 * textScaleFactor;
      notifikasiStringTidakAdaNotifikasiFontSize = 10 * textScaleFactor;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      notifikasiStringTitleFontSize = 14 * textScaleFactor;
      notifikasiStringTidakAdaNotifikasiFontSize = 12 * textScaleFactor;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      notifikasiStringTitleFontSize = 14 * textScaleFactor;
      notifikasiStringTidakAdaNotifikasiFontSize = 12 * textScaleFactor;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      notifikasiStringTitleFontSize = 14 * textScaleFactor;
      notifikasiStringTidakAdaNotifikasiFontSize = 12 * textScaleFactor;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      notifikasiStringTitleFontSize = 14 * textScaleFactor;
      notifikasiStringTidakAdaNotifikasiFontSize = 12 * textScaleFactor;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      notifikasiStringTitleFontSize = 14 * textScaleFactor;
      notifikasiStringTidakAdaNotifikasiFontSize = 12 * textScaleFactor;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      notifikasiStringTitleFontSize = 14 * textScaleFactor;
      notifikasiStringTidakAdaNotifikasiFontSize = 12 * textScaleFactor;

    }else {
      notifikasiStringTitleFontSize = 14 * textScaleFactor;
      notifikasiStringTidakAdaNotifikasiFontSize = 14 * textScaleFactor;
    }
  }
}