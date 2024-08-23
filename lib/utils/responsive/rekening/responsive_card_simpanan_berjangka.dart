import 'package:flutter/material.dart';

class ResponsiveCardSimpananBerjangka {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// CardSimpanan
  static late double cardSimpananBerjangkaContainerNoRekeningUtamaWidth;
  static late double cardSimpananBerjangkaNoRekeningUtamaFontSize;
  static late double cardSimpananBerjangkaHeader1FontSize;
  static late double cardSimpananBerjangkaNoRekeningNumFontSize;
  static late double cardSimpananBerjangkaContainerNilaiWidth;
  static late double cardSimpananBerjangkaStringNilaiFontSize;
  static late double cardSimpananBerjangkaStringTanggalFontSize;
  static late double cardSimpananBerjangkaStringStatusFontSize;
  static late double cardSimpananBerjangkaStringTransaksiSelengkapnyaFontSize;
  static late double cardSimpananBerjangkaIconArrowForwardWidth;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (width navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// CardSimpanan
      cardSimpananBerjangkaContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananBerjangkaNoRekeningUtamaFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaHeader1FontSize = 8 * textScaleFactor;
      cardSimpananBerjangkaNoRekeningNumFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaContainerNilaiWidth = screenWidth * 0.95;
      cardSimpananBerjangkaStringNilaiFontSize = 10 * textScaleFactor;
      cardSimpananBerjangkaStringTanggalFontSize = 10 * textScaleFactor;
      cardSimpananBerjangkaStringStatusFontSize = 10 * textScaleFactor;
      cardSimpananBerjangkaStringTransaksiSelengkapnyaFontSize = 10 * textScaleFactor;
      cardSimpananBerjangkaIconArrowForwardWidth = screenWidth * 0.05;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      /// CardSimpanan
      cardSimpananBerjangkaContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananBerjangkaNoRekeningUtamaFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaHeader1FontSize = 8 * textScaleFactor;
      cardSimpananBerjangkaNoRekeningNumFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaContainerNilaiWidth = screenWidth * 0.95;
      cardSimpananBerjangkaStringNilaiFontSize = 10 * textScaleFactor;
      cardSimpananBerjangkaStringTanggalFontSize = 10 * textScaleFactor;
      cardSimpananBerjangkaStringStatusFontSize = 10 * textScaleFactor;
      cardSimpananBerjangkaStringTransaksiSelengkapnyaFontSize = 10 * textScaleFactor;
      cardSimpananBerjangkaIconArrowForwardWidth = screenWidth * 0.05;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// CardSimpanan
      cardSimpananBerjangkaContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananBerjangkaNoRekeningUtamaFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaHeader1FontSize = 10 * textScaleFactor;
      cardSimpananBerjangkaNoRekeningNumFontSize = 16 * textScaleFactor;
      cardSimpananBerjangkaContainerNilaiWidth = screenWidth * 0.95;
      cardSimpananBerjangkaStringNilaiFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaStringTanggalFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaStringStatusFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaIconArrowForwardWidth = screenWidth * 0.05;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// CardSimpanan
      cardSimpananBerjangkaContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananBerjangkaNoRekeningUtamaFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaHeader1FontSize = 10 * textScaleFactor;
      cardSimpananBerjangkaNoRekeningNumFontSize = 16 * textScaleFactor;
      cardSimpananBerjangkaContainerNilaiWidth = screenWidth * 0.95;
      cardSimpananBerjangkaStringNilaiFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaStringTanggalFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaStringStatusFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaIconArrowForwardWidth = screenWidth * 0.05;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// CardSimpanan
      cardSimpananBerjangkaContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananBerjangkaNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardSimpananBerjangkaHeader1FontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaNoRekeningNumFontSize = 18 * textScaleFactor;
      cardSimpananBerjangkaContainerNilaiWidth = screenWidth * 0.95;
      cardSimpananBerjangkaStringNilaiFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringTanggalFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringStatusFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaIconArrowForwardWidth = screenWidth * 0.05;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// CardSimpanan
      cardSimpananBerjangkaContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananBerjangkaNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardSimpananBerjangkaHeader1FontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaNoRekeningNumFontSize = 18 * textScaleFactor;
      cardSimpananBerjangkaContainerNilaiWidth = screenWidth * 0.95;
      cardSimpananBerjangkaStringNilaiFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringTanggalFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringStatusFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaIconArrowForwardWidth = screenWidth * 0.05;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// CardSimpanan
      cardSimpananBerjangkaContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananBerjangkaNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardSimpananBerjangkaHeader1FontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaNoRekeningNumFontSize = 18 * textScaleFactor;
      cardSimpananBerjangkaContainerNilaiWidth = screenWidth * 0.95;
      cardSimpananBerjangkaStringNilaiFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringTanggalFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringStatusFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaIconArrowForwardWidth = screenWidth * 0.05;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {

      /// CardSimpanan
      cardSimpananBerjangkaContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananBerjangkaNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardSimpananBerjangkaHeader1FontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaNoRekeningNumFontSize = 18 * textScaleFactor;
      cardSimpananBerjangkaContainerNilaiWidth = screenWidth * 0.95;
      cardSimpananBerjangkaStringNilaiFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringTanggalFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringStatusFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaIconArrowForwardWidth = screenWidth * 0.05;

    }else {
      /// CardSimpanan
      cardSimpananBerjangkaContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardSimpananBerjangkaNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardSimpananBerjangkaHeader1FontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaNoRekeningNumFontSize = 18 * textScaleFactor;
      cardSimpananBerjangkaContainerNilaiWidth = screenWidth * 0.95;
      cardSimpananBerjangkaStringNilaiFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringTanggalFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringStatusFontSize = 14 * textScaleFactor;
      cardSimpananBerjangkaStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardSimpananBerjangkaIconArrowForwardWidth = screenWidth * 0.05;
    }
  }
}