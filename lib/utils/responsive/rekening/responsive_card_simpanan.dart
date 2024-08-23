import 'package:flutter/material.dart';

class ResponsiveCardSimpanan {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// CardSimpanan
  static late double cardSimpananContainerNoRekeningUtamaWidth;
  static late double cardSimpananNoRekeningUtamaFontSize;
  static late double cardSimpananHeader1FontSize;
  static late double cardSimpananNoRekeningNumFontSize;
  static late double cardSimpananContainerSaldoWidth;
  static late double cardSimpananStringSaldoFontSize;
  static late double cardSimpananStringSaldoTotalFontSize;
  static late double cardSimpananStringTransaksiSelengkapnyaFontSize;
  static late double cardSimpananIconArrowForwardWidth;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (width navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// CardSimpanan
      cardSimpananContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananNoRekeningUtamaFontSize = 12 * textScaleFactor;
      cardSimpananHeader1FontSize = 8 * textScaleFactor;
      cardSimpananNoRekeningNumFontSize = 14 * textScaleFactor;
      cardSimpananContainerSaldoWidth = screenWidth * 0.95;
      cardSimpananStringSaldoFontSize = 12 * textScaleFactor;
      cardSimpananStringSaldoTotalFontSize = 14 * textScaleFactor;
      cardSimpananStringTransaksiSelengkapnyaFontSize = 10 * textScaleFactor;
      cardSimpananIconArrowForwardWidth = screenWidth * 0.05;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      /// CardSimpanan
      cardSimpananContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananNoRekeningUtamaFontSize = 12 * textScaleFactor;
      cardSimpananHeader1FontSize = 8 * textScaleFactor;
      cardSimpananNoRekeningNumFontSize = 14 * textScaleFactor;
      cardSimpananContainerSaldoWidth = screenWidth * 0.95;
      cardSimpananStringSaldoFontSize = 12 * textScaleFactor;
      cardSimpananStringSaldoTotalFontSize = 14 * textScaleFactor;
      cardSimpananStringTransaksiSelengkapnyaFontSize = 10 * textScaleFactor;
      cardSimpananIconArrowForwardWidth = screenWidth * 0.05;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// CardSimpanan
      cardSimpananContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananNoRekeningUtamaFontSize = 14 * textScaleFactor;
      cardSimpananHeader1FontSize = 10 * textScaleFactor;
      cardSimpananNoRekeningNumFontSize = 16 * textScaleFactor;
      cardSimpananContainerSaldoWidth = screenWidth * 0.95;
      cardSimpananStringSaldoFontSize = 14 * textScaleFactor;
      cardSimpananStringSaldoTotalFontSize = 16 * textScaleFactor;
      cardSimpananStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardSimpananIconArrowForwardWidth = screenWidth * 0.05;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// CardSimpanan
      cardSimpananContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananNoRekeningUtamaFontSize = 14 * textScaleFactor;
      cardSimpananHeader1FontSize = 10 * textScaleFactor;
      cardSimpananNoRekeningNumFontSize = 16 * textScaleFactor;
      cardSimpananContainerSaldoWidth = screenWidth * 0.95;
      cardSimpananStringSaldoFontSize = 14 * textScaleFactor;
      cardSimpananStringSaldoTotalFontSize = 16 * textScaleFactor;
      cardSimpananStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardSimpananIconArrowForwardWidth = screenWidth * 0.05;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// CardSimpanan
      cardSimpananContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardSimpananHeader1FontSize = 12 * textScaleFactor;
      cardSimpananNoRekeningNumFontSize = 18 * textScaleFactor;
      cardSimpananContainerSaldoWidth = screenWidth * 0.95;
      cardSimpananStringSaldoFontSize = 16 * textScaleFactor;
      cardSimpananStringSaldoTotalFontSize = 18 * textScaleFactor;
      cardSimpananStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardSimpananIconArrowForwardWidth = screenWidth * 0.05;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// CardSimpanan
      cardSimpananContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardSimpananHeader1FontSize = 12 * textScaleFactor;
      cardSimpananNoRekeningNumFontSize = 18 * textScaleFactor;
      cardSimpananContainerSaldoWidth = screenWidth * 0.95;
      cardSimpananStringSaldoFontSize = 16 * textScaleFactor;
      cardSimpananStringSaldoTotalFontSize = 18 * textScaleFactor;
      cardSimpananStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardSimpananIconArrowForwardWidth = screenWidth * 0.05;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// CardSimpanan
      cardSimpananContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardSimpananHeader1FontSize = 12 * textScaleFactor;
      cardSimpananNoRekeningNumFontSize = 18 * textScaleFactor;
      cardSimpananContainerSaldoWidth = screenWidth * 0.95;
      cardSimpananStringSaldoFontSize = 16 * textScaleFactor;
      cardSimpananStringSaldoTotalFontSize = 18 * textScaleFactor;
      cardSimpananStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardSimpananIconArrowForwardWidth = screenWidth * 0.05;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {

      /// CardSimpanan
      cardSimpananContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardSimpananHeader1FontSize = 12 * textScaleFactor;
      cardSimpananNoRekeningNumFontSize = 18 * textScaleFactor;
      cardSimpananContainerSaldoWidth = screenWidth * 0.95;
      cardSimpananStringSaldoFontSize = 16 * textScaleFactor;
      cardSimpananStringSaldoTotalFontSize = 18 * textScaleFactor;
      cardSimpananStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardSimpananIconArrowForwardWidth = screenWidth * 0.05;

    }else {
      /// CardSimpanan
      cardSimpananContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardSimpananHeader1FontSize = 12 * textScaleFactor;
      cardSimpananNoRekeningNumFontSize = 18 * textScaleFactor;
      cardSimpananContainerSaldoWidth = screenWidth * 0.95;
      cardSimpananStringSaldoFontSize = 16 * textScaleFactor;
      cardSimpananStringSaldoTotalFontSize = 18 * textScaleFactor;
      cardSimpananStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardSimpananIconArrowForwardWidth = screenWidth * 0.05;
    }
  }
}