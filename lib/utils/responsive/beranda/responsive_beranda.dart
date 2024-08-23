import 'package:flutter/material.dart';

class ResponsiveBeranda {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// Beranda
  static late double berandaTittleFontSize;
  static late double berandaNamaPenggunaFontSize;
  static late double berandaSizedBoxHeightStack;
  static late double berandaPositionedTopCardInformation;
  static late double berandaPositionedLeftCardInformation;
  static late double berandaPositionedTopCarouselBeranda;
  static late double berandaPositionedLeftCarouselBeranda;
  static late double berandaPositionedTopCardBeranda;
  static late double berandaPositionedLeftCardBeranda;

  /// CardInformasi
  static late double cardInformasiContainerNoRekeningUtamaWidth;
  static late double cardInformasiNoRekeningUtamaFontSize;
  static late double cardInformasiHeader1FontSize;
  static late double cardInformasiTextRekeningUtamaFontSize;
  static late double cardInformasiContainerSaldoWidth;
  static late double cardInformasiStringSaldoFontSize;
  static late double cardInformasiStringSaldoTotalFontSize;
  static late double cardInformasiStringTransaksiSelengkapnyaFontSize;
  static late double cardInformasiIconArrowForwardWidth;

  /// CardCarousel
  static late double cardCarouselWidth;
  static late double cardCarouselHeight;

  /// CardLayanan
  static late double cardLayananSizedBoxWidth;
  static late double cardLayananTextListFontSize;
  static late double cardLayananTextStringSelengkapnyaFontSize;
  static late double cardLayananIconArrowForwardWidth;
  static late double cardLayananImageSizeWidth;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (width navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// Beranda
      berandaTittleFontSize = 10 * textScaleFactor;
      berandaNamaPenggunaFontSize = 10 * textScaleFactor;
      berandaSizedBoxHeightStack = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      berandaPositionedTopCardInformation = screenHeight * 0.02;
      berandaPositionedLeftCardInformation = screenWidth * 0.025;
      berandaPositionedTopCarouselBeranda = screenHeight * 0.22;
      berandaPositionedLeftCarouselBeranda = screenWidth * 0.025;
      berandaPositionedTopCardBeranda = screenHeight * 0.49;
      berandaPositionedLeftCardBeranda = screenWidth * 0.025;

      /// CardInformasi
      cardInformasiContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardInformasiNoRekeningUtamaFontSize = 12 * textScaleFactor;
      cardInformasiHeader1FontSize = 8 * textScaleFactor;
      cardInformasiTextRekeningUtamaFontSize = 14 * textScaleFactor;
      cardInformasiContainerSaldoWidth = screenWidth * 0.95;
      cardInformasiStringSaldoFontSize = 12 * textScaleFactor;
      cardInformasiStringSaldoTotalFontSize = 14 * textScaleFactor;
      cardInformasiStringTransaksiSelengkapnyaFontSize = 10 * textScaleFactor;
      cardInformasiIconArrowForwardWidth = screenWidth * 0.05;

      /// CardCarousel
      cardCarouselWidth = screenWidth * 0.95;
      cardCarouselHeight = screenHeight * 0.25;

      /// CardLayanan
      cardLayananSizedBoxWidth = screenWidth * 0.95;
      cardLayananTextListFontSize = 10 * textScaleFactor;
      cardLayananTextStringSelengkapnyaFontSize = 10 * textScaleFactor;
      cardLayananIconArrowForwardWidth = screenWidth * 0.05;
      cardLayananImageSizeWidth = screenWidth * 0.0169;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {

      /// Beranda
      berandaTittleFontSize = 10 * textScaleFactor;
      berandaNamaPenggunaFontSize = 10 * textScaleFactor;
      berandaSizedBoxHeightStack = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      berandaPositionedTopCardInformation = screenHeight * 0.02;
      berandaPositionedLeftCardInformation = screenWidth * 0.025;
      berandaPositionedTopCarouselBeranda = screenHeight * 0.22;
      berandaPositionedLeftCarouselBeranda = screenWidth * 0.025;
      berandaPositionedTopCardBeranda = screenHeight * 0.49;
      berandaPositionedLeftCardBeranda = screenWidth * 0.025;

      /// CardInformasi
      cardInformasiContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardInformasiNoRekeningUtamaFontSize = 12 * textScaleFactor;
      cardInformasiHeader1FontSize = 8 * textScaleFactor;
      cardInformasiTextRekeningUtamaFontSize = 14 * textScaleFactor;
      cardInformasiContainerSaldoWidth = screenWidth * 0.8;
      cardInformasiStringSaldoFontSize = 12 * textScaleFactor;
      cardInformasiStringSaldoTotalFontSize = 14 * textScaleFactor;
      cardInformasiStringTransaksiSelengkapnyaFontSize = 10 * textScaleFactor;
      cardInformasiIconArrowForwardWidth = screenWidth * 0.05;

      /// CardCarousel
      cardCarouselWidth = screenWidth * 0.8;
      cardCarouselHeight = screenHeight * 0.25;

      /// CardLayanan
      cardLayananSizedBoxWidth = screenWidth * 0.8;
      cardLayananTextListFontSize = 10 * textScaleFactor;
      cardLayananTextStringSelengkapnyaFontSize = 10 * textScaleFactor;
      cardLayananIconArrowForwardWidth = screenWidth * 0.05;
      cardLayananImageSizeWidth = screenWidth * 0.0169;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// Beranda
      berandaTittleFontSize = 12 * textScaleFactor;
      berandaNamaPenggunaFontSize = 12 * textScaleFactor;
      berandaSizedBoxHeightStack = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      berandaPositionedTopCardInformation = screenHeight * 0.02;
      berandaPositionedLeftCardInformation = screenWidth * 0.025;
      berandaPositionedTopCarouselBeranda = screenHeight * 0.22;
      berandaPositionedLeftCarouselBeranda = screenWidth * 0.025;
      berandaPositionedTopCardBeranda = screenHeight * 0.49;
      berandaPositionedLeftCardBeranda = screenWidth * 0.025;

      /// CardInformasi
      cardInformasiContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardInformasiNoRekeningUtamaFontSize = 14 * textScaleFactor;
      cardInformasiHeader1FontSize = 10 * textScaleFactor;
      cardInformasiTextRekeningUtamaFontSize = 16 * textScaleFactor;
      cardInformasiContainerSaldoWidth = screenWidth * 0.95;
      cardInformasiStringSaldoFontSize = 14 * textScaleFactor;
      cardInformasiStringSaldoTotalFontSize = 16 * textScaleFactor;
      cardInformasiStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardInformasiIconArrowForwardWidth = screenWidth * 0.05;

      /// CardCarousel
      cardCarouselWidth = screenWidth * 0.95;
      cardCarouselHeight = screenHeight * 0.25;

      /// CardLayanan
      cardLayananSizedBoxWidth = screenWidth * 0.95;
      cardLayananTextListFontSize = 10 * textScaleFactor;
      cardLayananTextStringSelengkapnyaFontSize = 10 * textScaleFactor;
      cardLayananIconArrowForwardWidth = screenWidth * 0.05;
      cardLayananImageSizeWidth = screenWidth * 0.012;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// Beranda
      berandaTittleFontSize = 12 * textScaleFactor;
      berandaNamaPenggunaFontSize = 12 * textScaleFactor;
      berandaSizedBoxHeightStack = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      berandaPositionedTopCardInformation = screenHeight * 0.02;
      berandaPositionedLeftCardInformation = screenWidth * 0.025;
      berandaPositionedTopCarouselBeranda = screenHeight * 0.22;
      berandaPositionedLeftCarouselBeranda = screenWidth * 0.025;
      berandaPositionedTopCardBeranda = screenHeight * 0.49;
      berandaPositionedLeftCardBeranda = screenWidth * 0.025;

      /// CardInformasi
      cardInformasiContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardInformasiNoRekeningUtamaFontSize = 14 * textScaleFactor;
      cardInformasiHeader1FontSize = 10 * textScaleFactor;
      cardInformasiTextRekeningUtamaFontSize = 16 * textScaleFactor;
      cardInformasiContainerSaldoWidth = screenWidth * 0.95;
      cardInformasiStringSaldoFontSize = 14 * textScaleFactor;
      cardInformasiStringSaldoTotalFontSize = 16 * textScaleFactor;
      cardInformasiStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardInformasiIconArrowForwardWidth = screenWidth * 0.05;

      /// CardCarousel
      cardCarouselWidth = screenWidth * 0.95;
      cardCarouselHeight = screenHeight * 0.25;

      /// CardLayanan
      cardLayananSizedBoxWidth = screenWidth * 0.95;
      cardLayananTextListFontSize = 10 * textScaleFactor;
      cardLayananTextStringSelengkapnyaFontSize = 10 * textScaleFactor;
      cardLayananIconArrowForwardWidth = screenWidth * 0.05;
      cardLayananImageSizeWidth = screenWidth * 0.012;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// Beranda
      berandaTittleFontSize = 12 * textScaleFactor;
      berandaNamaPenggunaFontSize = 12 * textScaleFactor;
      berandaSizedBoxHeightStack = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      berandaPositionedTopCardInformation = screenHeight * 0.02;
      berandaPositionedLeftCardInformation = screenWidth * 0.025;
      berandaPositionedTopCarouselBeranda = screenHeight * 0.22;
      berandaPositionedLeftCarouselBeranda = screenWidth * 0.025;
      berandaPositionedTopCardBeranda = screenHeight * 0.49;
      berandaPositionedLeftCardBeranda = screenWidth * 0.025;

      /// CardInformasi
      cardInformasiContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardInformasiNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardInformasiHeader1FontSize = 12 * textScaleFactor;
      cardInformasiTextRekeningUtamaFontSize = 18 * textScaleFactor;
      cardInformasiContainerSaldoWidth = screenWidth * 0.95;
      cardInformasiStringSaldoFontSize = 16 * textScaleFactor;
      cardInformasiStringSaldoTotalFontSize = 18 * textScaleFactor;
      cardInformasiStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardInformasiIconArrowForwardWidth = screenWidth * 0.05;

      /// CardCarousel
      cardCarouselWidth = screenWidth * 0.95;
      cardCarouselHeight = screenHeight * 0.25;

      /// CardLayanan
      cardLayananSizedBoxWidth = screenWidth * 0.95;
      cardLayananTextListFontSize = 12 * textScaleFactor;
      cardLayananTextStringSelengkapnyaFontSize = 12 * textScaleFactor;
      cardLayananIconArrowForwardWidth = screenWidth * 0.05;
      cardLayananImageSizeWidth = screenWidth * 0.012;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// Beranda
      berandaTittleFontSize = 12 * textScaleFactor;
      berandaNamaPenggunaFontSize = 12 * textScaleFactor;
      berandaSizedBoxHeightStack = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      berandaPositionedTopCardInformation = screenHeight * 0.02;
      berandaPositionedLeftCardInformation = screenWidth * 0.025;
      berandaPositionedTopCarouselBeranda = screenHeight * 0.22;
      berandaPositionedLeftCarouselBeranda = screenWidth * 0.025;
      berandaPositionedTopCardBeranda = screenHeight * 0.49;
      berandaPositionedLeftCardBeranda = screenWidth * 0.025;

      /// CardInformasi
      cardInformasiContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardInformasiNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardInformasiHeader1FontSize = 12 * textScaleFactor;
      cardInformasiTextRekeningUtamaFontSize = 18 * textScaleFactor;
      cardInformasiContainerSaldoWidth = screenWidth * 0.95;
      cardInformasiStringSaldoFontSize = 16 * textScaleFactor;
      cardInformasiStringSaldoTotalFontSize = 18 * textScaleFactor;
      cardInformasiStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardInformasiIconArrowForwardWidth = screenWidth * 0.05;

      /// CardCarousel
      cardCarouselWidth = screenWidth * 0.95;
      cardCarouselHeight = screenHeight * 0.25;

      /// CardLayanan
      cardLayananSizedBoxWidth = screenWidth * 0.95;
      cardLayananTextListFontSize = 12 * textScaleFactor;
      cardLayananTextStringSelengkapnyaFontSize = 12 * textScaleFactor;
      cardLayananIconArrowForwardWidth = screenWidth * 0.05;
      cardLayananImageSizeWidth = screenWidth * 0.012;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// Beranda
      berandaTittleFontSize = 12 * textScaleFactor;
      berandaNamaPenggunaFontSize = 12 * textScaleFactor;
      berandaSizedBoxHeightStack = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      berandaPositionedTopCardInformation = screenHeight * 0.02;
      berandaPositionedLeftCardInformation = screenWidth * 0.025;
      berandaPositionedTopCarouselBeranda = screenHeight * 0.22;
      berandaPositionedLeftCarouselBeranda = screenWidth * 0.025;
      berandaPositionedTopCardBeranda = screenHeight * 0.49;
      berandaPositionedLeftCardBeranda = screenWidth * 0.025;

      /// CardInformasi
      cardInformasiContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardInformasiNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardInformasiHeader1FontSize = 12 * textScaleFactor;
      cardInformasiTextRekeningUtamaFontSize = 18 * textScaleFactor;
      cardInformasiContainerSaldoWidth = screenWidth * 0.95;
      cardInformasiStringSaldoFontSize = 16 * textScaleFactor;
      cardInformasiStringSaldoTotalFontSize = 18 * textScaleFactor;
      cardInformasiStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardInformasiIconArrowForwardWidth = screenWidth * 0.05;

      /// CardCarousel
      cardCarouselWidth = screenWidth * 0.95;
      cardCarouselHeight = screenHeight * 0.25;

      /// CardLayanan
      cardLayananSizedBoxWidth = screenWidth * 0.95;
      cardLayananTextListFontSize = 12 * textScaleFactor;
      cardLayananTextStringSelengkapnyaFontSize = 12 * textScaleFactor;
      cardLayananIconArrowForwardWidth = screenWidth * 0.05;
      cardLayananImageSizeWidth = screenWidth * 0.012;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      /// Beranda
      berandaTittleFontSize = 12 * textScaleFactor;
      berandaNamaPenggunaFontSize = 12 * textScaleFactor;
      berandaSizedBoxHeightStack = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      berandaPositionedTopCardInformation = screenHeight * 0.02;
      berandaPositionedLeftCardInformation = screenWidth * 0.025;
      berandaPositionedTopCarouselBeranda = screenHeight * 0.22;
      berandaPositionedLeftCarouselBeranda = screenWidth * 0.025;
      berandaPositionedTopCardBeranda = screenHeight * 0.49;
      berandaPositionedLeftCardBeranda = screenWidth * 0.025;

      /// CardInformasi
      cardInformasiContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardInformasiNoRekeningUtamaFontSize = 14 * textScaleFactor;
      cardInformasiHeader1FontSize = 12 * textScaleFactor;
      cardInformasiTextRekeningUtamaFontSize = 16 * textScaleFactor;
      cardInformasiContainerSaldoWidth = screenWidth * 0.95;
      cardInformasiStringSaldoFontSize = 14 * textScaleFactor;
      cardInformasiStringSaldoTotalFontSize = 16 * textScaleFactor;
      cardInformasiStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardInformasiIconArrowForwardWidth = screenWidth * 0.05;

      /// CardCarousel
      cardCarouselWidth = screenWidth * 0.95;
      cardCarouselHeight = screenHeight * 0.25;

      /// CardLayanan
      cardLayananSizedBoxWidth = screenWidth * 0.95;
      cardLayananTextListFontSize = 12 * textScaleFactor;
      cardLayananTextStringSelengkapnyaFontSize = 12 * textScaleFactor;
      cardLayananIconArrowForwardWidth = screenWidth * 0.05;
      cardLayananImageSizeWidth = screenWidth * 0.012;

    }else {
      /// Beranda
      berandaTittleFontSize = 12 * textScaleFactor;
      berandaNamaPenggunaFontSize = 12 * textScaleFactor;
      berandaSizedBoxHeightStack = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      berandaPositionedTopCardInformation = screenHeight * 0.02;
      berandaPositionedLeftCardInformation = screenWidth * 0.025;
      berandaPositionedTopCarouselBeranda = screenHeight * 0.22;
      berandaPositionedLeftCarouselBeranda = screenWidth * 0.025;
      berandaPositionedTopCardBeranda = screenHeight * 0.49;
      berandaPositionedLeftCardBeranda = screenWidth * 0.025;

      /// CardInformasi
      cardInformasiContainerNoRekeningUtamaWidth = screenWidth * 0.95;
      cardInformasiNoRekeningUtamaFontSize = 16 * textScaleFactor;
      cardInformasiHeader1FontSize = 12 * textScaleFactor;
      cardInformasiTextRekeningUtamaFontSize = 18 * textScaleFactor;
      cardInformasiContainerSaldoWidth = screenWidth * 0.95;
      cardInformasiStringSaldoFontSize = 16 * textScaleFactor;
      cardInformasiStringSaldoTotalFontSize = 18 * textScaleFactor;
      cardInformasiStringTransaksiSelengkapnyaFontSize = 12 * textScaleFactor;
      cardInformasiIconArrowForwardWidth = screenWidth * 0.05;

      /// CardCarousel
      cardCarouselWidth = screenWidth * 0.95;
      cardCarouselHeight = screenHeight * 0.25;

      /// CardLayanan
      cardLayananSizedBoxWidth = screenWidth * 0.95;
      cardLayananTextListFontSize = 12 * textScaleFactor;
      cardLayananTextStringSelengkapnyaFontSize = 12 * textScaleFactor;
      cardLayananIconArrowForwardWidth = screenWidth * 0.05;
      cardLayananImageSizeWidth = screenWidth * 0.012;
    }
  }
}