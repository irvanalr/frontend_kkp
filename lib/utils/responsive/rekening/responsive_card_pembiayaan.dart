import 'package:flutter/material.dart';

class ResponsiveCardPembiayaan {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// CardSimpanan
  static late double cardPembiayaanContainerNoRekeningUtamaWidth;
  static late double cardPembiayaanNoRekeningUtamaFontSize;
  static late double cardPembiayaanHeader1FontSize;
  static late double cardPembiayaanNoRekeningNumFontSize;
  static late double cardPembiayaanContainerNilaiWidth;
  static late double cardPembiayaanStringNilaiFontSize;
  static late double cardPembiayaanStringTanggalFontSize;
  static late double cardPembiayaanStringStatusFontSize;
  static late double cardPembiayaanStringTransaksiSelengkapnyaFontSize;
  static late double cardPembiayaanIconArrowForwardWidth;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (width navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// CardSimpanan
      cardPembiayaanContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardPembiayaanNoRekeningUtamaFontSize = 12 * textScaleFactor;
      cardPembiayaanHeader1FontSize = 8 * textScaleFactor;
      cardPembiayaanNoRekeningNumFontSize = 14 * textScaleFactor;
      cardPembiayaanContainerNilaiWidth = screenWidth * 0.95;
      cardPembiayaanStringNilaiFontSize = 10 * textScaleFactor;
      cardPembiayaanStringTanggalFontSize = 10 * textScaleFactor;
      cardPembiayaanStringStatusFontSize = 10 * textScaleFactor;
      cardPembiayaanStringTransaksiSelengkapnyaFontSize = 10 * textScaleFactor;
      cardPembiayaanIconArrowForwardWidth = screenWidth * 0.05;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      /// CardSimpanan
      cardPembiayaanContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardPembiayaanNoRekeningUtamaFontSize = 12 * textScaleFactor;
      cardPembiayaanHeader1FontSize = 8 * textScaleFactor;
      cardPembiayaanNoRekeningNumFontSize = 14 * textScaleFactor;
      cardPembiayaanContainerNilaiWidth = screenWidth * 0.95;
      cardPembiayaanStringNilaiFontSize = 10 * textScaleFactor;
      cardPembiayaanStringTanggalFontSize = 10 * textScaleFactor;
      cardPembiayaanStringStatusFontSize = 10 * textScaleFactor;
      cardPembiayaanStringTransaksiSelengkapnyaFontSize = 10 * textScaleFactor;
      cardPembiayaanIconArrowForwardWidth = screenWidth * 0.05;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// CardSimpanan
      cardPembiayaanContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardPembiayaanNoRekeningUtamaFontSize = 14 * textScaleFactor;
      cardPembiayaanHeader1FontSize = 10 * textScaleFactor;
      cardPembiayaanNoRekeningNumFontSize = 16 * textScaleFactor;
      cardPembiayaanContainerNilaiWidth = screenWidth * 0.95;
      cardPembiayaanStringNilaiFontSize = 12 * textScaleFactor;
      cardPembiayaanStringTanggalFontSize = 12 * textScaleFactor;
      cardPembiayaanStringStatusFontSize = 12 * textScaleFactor;
      cardPembiayaanStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardPembiayaanIconArrowForwardWidth = screenWidth * 0.05;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// CardSimpanan
      cardPembiayaanContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardPembiayaanNoRekeningUtamaFontSize = 14 * textScaleFactor;
      cardPembiayaanHeader1FontSize = 10 * textScaleFactor;
      cardPembiayaanNoRekeningNumFontSize = 16 * textScaleFactor;
      cardPembiayaanContainerNilaiWidth = screenWidth * 0.95;
      cardPembiayaanStringNilaiFontSize = 12 * textScaleFactor;
      cardPembiayaanStringTanggalFontSize = 12 * textScaleFactor;
      cardPembiayaanStringStatusFontSize = 12 * textScaleFactor;
      cardPembiayaanStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardPembiayaanIconArrowForwardWidth = screenWidth * 0.05;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// CardSimpanan
      cardPembiayaanContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardPembiayaanNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardPembiayaanHeader1FontSize = 12 * textScaleFactor;
      cardPembiayaanNoRekeningNumFontSize = 18 * textScaleFactor;
      cardPembiayaanContainerNilaiWidth = screenWidth * 0.95;
      cardPembiayaanStringNilaiFontSize = 14 * textScaleFactor;
      cardPembiayaanStringTanggalFontSize = 14 * textScaleFactor;
      cardPembiayaanStringStatusFontSize = 14 * textScaleFactor;
      cardPembiayaanStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardPembiayaanIconArrowForwardWidth = screenWidth * 0.05;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// CardSimpanan
      cardPembiayaanContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardPembiayaanNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardPembiayaanHeader1FontSize = 12 * textScaleFactor;
      cardPembiayaanNoRekeningNumFontSize = 18 * textScaleFactor;
      cardPembiayaanContainerNilaiWidth = screenWidth * 0.95;
      cardPembiayaanStringNilaiFontSize = 14 * textScaleFactor;
      cardPembiayaanStringTanggalFontSize = 14 * textScaleFactor;
      cardPembiayaanStringStatusFontSize = 14 * textScaleFactor;
      cardPembiayaanStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardPembiayaanIconArrowForwardWidth = screenWidth * 0.05;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// CardSimpanan
      cardPembiayaanContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardPembiayaanNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardPembiayaanHeader1FontSize = 12 * textScaleFactor;
      cardPembiayaanNoRekeningNumFontSize = 18 * textScaleFactor;
      cardPembiayaanContainerNilaiWidth = screenWidth * 0.95;
      cardPembiayaanStringNilaiFontSize = 14 * textScaleFactor;
      cardPembiayaanStringTanggalFontSize = 14 * textScaleFactor;
      cardPembiayaanStringStatusFontSize = 14 * textScaleFactor;
      cardPembiayaanStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardPembiayaanIconArrowForwardWidth = screenWidth * 0.05;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {

      /// CardSimpanan
      cardPembiayaanContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardPembiayaanNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardPembiayaanHeader1FontSize = 12 * textScaleFactor;
      cardPembiayaanNoRekeningNumFontSize = 18 * textScaleFactor;
      cardPembiayaanContainerNilaiWidth = screenWidth * 0.95;
      cardPembiayaanStringNilaiFontSize = 14 * textScaleFactor;
      cardPembiayaanStringTanggalFontSize = 14 * textScaleFactor;
      cardPembiayaanStringStatusFontSize = 14 * textScaleFactor;
      cardPembiayaanStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardPembiayaanIconArrowForwardWidth = screenWidth * 0.05;

    }else {
      /// CardSimpanan
      cardPembiayaanContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardPembiayaanNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardPembiayaanHeader1FontSize = 12 * textScaleFactor;
      cardPembiayaanNoRekeningNumFontSize = 18 * textScaleFactor;
      cardPembiayaanContainerNilaiWidth = screenWidth * 0.95;
      cardPembiayaanStringNilaiFontSize = 14 * textScaleFactor;
      cardPembiayaanStringTanggalFontSize = 14 * textScaleFactor;
      cardPembiayaanStringStatusFontSize = 14 * textScaleFactor;
      cardPembiayaanStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardPembiayaanIconArrowForwardWidth = screenWidth * 0.05;
    }
  }
}