import 'package:flutter/material.dart';

class ResponsiveAkun {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// Akun
  static late double akunStringTitleFontSize;
  static late double akunSizedBoxedCircleShapeWidth;
  static late double akunSizedBoxedCircleShapeHeight;
  static late double akunStringInitialNameFontSize;
  static late double akunStringAllTextAfterShapeFontSize;
  /// CardAkun
  static late double cardAkunStringAllFontSize;
  static late double cardAkunContainerWidth;
  static late double cardAkunPaddingBottomContainerLast;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

      // 720 x 1280 (with bottom navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// akun
      akunStringTitleFontSize = 12 * textScaleFactor;
      akunSizedBoxedCircleShapeWidth = 60;
      akunSizedBoxedCircleShapeHeight = 60;
      akunStringInitialNameFontSize = 16 * textScaleFactor;
      akunStringAllTextAfterShapeFontSize = 12 * textScaleFactor;

      /// cardAkun
      cardAkunStringAllFontSize = 12 * textScaleFactor;
      cardAkunContainerWidth = screenWidth * 0.95;
      cardAkunPaddingBottomContainerLast = 10;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      /// akun
      akunStringTitleFontSize = 12 * textScaleFactor;
      akunSizedBoxedCircleShapeWidth = 60;
      akunSizedBoxedCircleShapeHeight = 60;
      akunStringInitialNameFontSize = 16 * textScaleFactor;
      akunStringAllTextAfterShapeFontSize = 12 * textScaleFactor;

      /// cardAkun
      cardAkunStringAllFontSize = 12 * textScaleFactor;
      cardAkunContainerWidth = screenWidth * 0.95;
      cardAkunPaddingBottomContainerLast = 10;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// akun
      akunStringTitleFontSize = 14 * textScaleFactor;
      akunSizedBoxedCircleShapeWidth = 60;
      akunSizedBoxedCircleShapeHeight = 60;
      akunStringInitialNameFontSize = 20 * textScaleFactor;
      akunStringAllTextAfterShapeFontSize = 14 * textScaleFactor;

      /// cardAkun
      cardAkunStringAllFontSize = 12 * textScaleFactor;
      cardAkunContainerWidth = screenWidth * 0.95;
      cardAkunPaddingBottomContainerLast = 10;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// akun
      akunStringTitleFontSize = 14 * textScaleFactor;
      akunSizedBoxedCircleShapeWidth = 60;
      akunSizedBoxedCircleShapeHeight = 60;
      akunStringInitialNameFontSize = 20 * textScaleFactor;
      akunStringAllTextAfterShapeFontSize = 14 * textScaleFactor;

      /// cardAkun
      cardAkunStringAllFontSize = 12 * textScaleFactor;
      cardAkunContainerWidth = screenWidth * 0.95;
      cardAkunPaddingBottomContainerLast = 10;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// akun
      akunStringTitleFontSize = 18 * textScaleFactor;
      akunSizedBoxedCircleShapeWidth = 70;
      akunSizedBoxedCircleShapeHeight = 70;
      akunStringInitialNameFontSize = 22 * textScaleFactor;
      akunStringAllTextAfterShapeFontSize = 16 * textScaleFactor;

      /// cardAkun
      cardAkunStringAllFontSize = 14 * textScaleFactor;
      cardAkunContainerWidth = screenWidth * 0.95;
      cardAkunPaddingBottomContainerLast = 10;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// akun
      akunStringTitleFontSize = 18 * textScaleFactor;
      akunSizedBoxedCircleShapeWidth = 70;
      akunSizedBoxedCircleShapeHeight = 70;
      akunStringInitialNameFontSize = 22 * textScaleFactor;
      akunStringAllTextAfterShapeFontSize = 16 * textScaleFactor;

      /// cardAkun
      cardAkunStringAllFontSize = 14 * textScaleFactor;
      cardAkunContainerWidth = screenWidth * 0.95;
      cardAkunPaddingBottomContainerLast = 10;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// akun
      akunStringTitleFontSize = 18 * textScaleFactor;
      akunSizedBoxedCircleShapeWidth = 80;
      akunSizedBoxedCircleShapeHeight = 80;
      akunStringInitialNameFontSize = 22 * textScaleFactor;
      akunStringAllTextAfterShapeFontSize = 16 * textScaleFactor;

      /// cardAkun
      cardAkunStringAllFontSize = 14 * textScaleFactor;
      cardAkunContainerWidth = screenWidth * 0.95;
      cardAkunPaddingBottomContainerLast = 10;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      /// akun
      akunStringTitleFontSize = 18 * textScaleFactor;
      akunSizedBoxedCircleShapeWidth = 80;
      akunSizedBoxedCircleShapeHeight = 80;
      akunStringInitialNameFontSize = 22 * textScaleFactor;
      akunStringAllTextAfterShapeFontSize = 16 * textScaleFactor;

      /// cardAkun
      cardAkunStringAllFontSize = 14 * textScaleFactor;
      cardAkunContainerWidth = screenWidth * 0.95;
      cardAkunPaddingBottomContainerLast = 10;

    }else {
      /// akun
      akunStringTitleFontSize = 18 * textScaleFactor;
      akunSizedBoxedCircleShapeWidth = 70;
      akunSizedBoxedCircleShapeHeight = 70;
      akunStringInitialNameFontSize = 18 * textScaleFactor;
      akunStringAllTextAfterShapeFontSize = 16 * textScaleFactor;

      /// cardAkun
      cardAkunStringAllFontSize = 12 * textScaleFactor;
      cardAkunContainerWidth = screenWidth * 0.95;
      cardAkunPaddingBottomContainerLast = 15;
    }
  }
}