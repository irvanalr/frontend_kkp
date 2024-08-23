import 'package:flutter/cupertino.dart';

class ResponsiveMutasiBeranda {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// mutasi_beranda
  static late double mutasiBerandaTitleFontSize;
  static late double mutasiBerandaSizedBoxCardTransaksiWidth;
  static late double mutasiBerandaContainerPertamaWidth;
  static late double mutasiBerandaContainerKeduaWidth;
  /// cardTransaksi
  static late double cardMutasiBerandaContainerWidth;
  static late double cardMutasiBerandaStringHeadKeyFontSize;
  static late double cardMutasiBerandaStringHeadTotalSaldoFontSize;
  static late double cardMutasiBerandaStringJenisTransferDanNomerTransferFontSize;
  static late double cardMutasiBerandaStringPengeluaranAtauPemasukanFontSize;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (width navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// mutasi_beranda
      mutasiBerandaTitleFontSize = 12;
      mutasiBerandaSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiBerandaContainerPertamaWidth = screenWidth * 0.4;
      mutasiBerandaContainerKeduaWidth = screenWidth * 0.55;
      /// cardTransaksi
      cardMutasiBerandaContainerWidth = screenWidth;
      cardMutasiBerandaStringHeadKeyFontSize = 12;
      cardMutasiBerandaStringHeadTotalSaldoFontSize = 12;
      cardMutasiBerandaStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiBerandaStringPengeluaranAtauPemasukanFontSize = 10;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      /// mutasi_beranda
      mutasiBerandaTitleFontSize = 12;
      mutasiBerandaSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiBerandaContainerPertamaWidth = screenWidth * 0.4;
      mutasiBerandaContainerKeduaWidth = screenWidth * 0.55;
      /// cardTransaksi
      cardMutasiBerandaContainerWidth = screenWidth;
      cardMutasiBerandaStringHeadKeyFontSize = 12;
      cardMutasiBerandaStringHeadTotalSaldoFontSize = 12;
      cardMutasiBerandaStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiBerandaStringPengeluaranAtauPemasukanFontSize = 10;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// mutasi_beranda
      mutasiBerandaTitleFontSize = 14;
      mutasiBerandaSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiBerandaContainerPertamaWidth = screenWidth * 0.4;
      mutasiBerandaContainerKeduaWidth = screenWidth * 0.55;
      /// cardTransaksi
      cardMutasiBerandaContainerWidth = screenWidth;
      cardMutasiBerandaStringHeadKeyFontSize = 12;
      cardMutasiBerandaStringHeadTotalSaldoFontSize = 12;
      cardMutasiBerandaStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiBerandaStringPengeluaranAtauPemasukanFontSize = 10;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// mutasi_beranda
      mutasiBerandaTitleFontSize = 14;
      mutasiBerandaSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiBerandaContainerPertamaWidth = screenWidth * 0.4;
      mutasiBerandaContainerKeduaWidth = screenWidth * 0.55;
      /// cardTransaksi
      cardMutasiBerandaContainerWidth = screenWidth;
      cardMutasiBerandaStringHeadKeyFontSize = 12;
      cardMutasiBerandaStringHeadTotalSaldoFontSize = 12;
      cardMutasiBerandaStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiBerandaStringPengeluaranAtauPemasukanFontSize = 10;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// mutasi_beranda
      mutasiBerandaTitleFontSize = 16;
      mutasiBerandaSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiBerandaContainerPertamaWidth = screenWidth * 0.4;
      mutasiBerandaContainerKeduaWidth = screenWidth * 0.55;
      /// cardTransaksi
      cardMutasiBerandaContainerWidth = screenWidth;
      cardMutasiBerandaStringHeadKeyFontSize = 16;
      cardMutasiBerandaStringHeadTotalSaldoFontSize = 16;
      cardMutasiBerandaStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiBerandaStringPengeluaranAtauPemasukanFontSize = 12;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// mutasi_beranda
      mutasiBerandaTitleFontSize = 16;
      mutasiBerandaSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiBerandaContainerPertamaWidth = screenWidth * 0.4;
      mutasiBerandaContainerKeduaWidth = screenWidth * 0.55;
      /// cardTransaksi
      cardMutasiBerandaContainerWidth = screenWidth;
      cardMutasiBerandaStringHeadKeyFontSize = 16;
      cardMutasiBerandaStringHeadTotalSaldoFontSize = 16;
      cardMutasiBerandaStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiBerandaStringPengeluaranAtauPemasukanFontSize = 12;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// mutasi_beranda
      mutasiBerandaTitleFontSize = 16;
      mutasiBerandaSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiBerandaContainerPertamaWidth = screenWidth * 0.4;
      mutasiBerandaContainerKeduaWidth = screenWidth * 0.55;
      /// cardTransaksi
      cardMutasiBerandaContainerWidth = screenWidth;
      cardMutasiBerandaStringHeadKeyFontSize = 16;
      cardMutasiBerandaStringHeadTotalSaldoFontSize = 16;
      cardMutasiBerandaStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiBerandaStringPengeluaranAtauPemasukanFontSize = 12;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      /// mutasi_beranda
      mutasiBerandaTitleFontSize = 16;
      mutasiBerandaSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiBerandaContainerPertamaWidth = screenWidth * 0.4;
      mutasiBerandaContainerKeduaWidth = screenWidth * 0.55;
      /// cardTransaksi
      cardMutasiBerandaContainerWidth = screenWidth;
      cardMutasiBerandaStringHeadKeyFontSize = 16;
      cardMutasiBerandaStringHeadTotalSaldoFontSize = 16;
      cardMutasiBerandaStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiBerandaStringPengeluaranAtauPemasukanFontSize = 12;

    } else {
      /// mutasi_beranda
      mutasiBerandaTitleFontSize = 16;
      mutasiBerandaSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiBerandaContainerPertamaWidth = screenWidth * 0.4;
      mutasiBerandaContainerKeduaWidth = screenWidth * 0.55;
      /// cardTransaksi
      cardMutasiBerandaContainerWidth = screenWidth;
      cardMutasiBerandaStringHeadKeyFontSize = 16;
      cardMutasiBerandaStringHeadTotalSaldoFontSize = 16;
      cardMutasiBerandaStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiBerandaStringPengeluaranAtauPemasukanFontSize = 12;
    }

  }
}