import 'package:flutter/cupertino.dart';

class ResponsiveMutasiRekeningSimpananPokok {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// mutasi_rekening_simpanan_pokok
  static late double mutasiRekeningSimpananPokokTitleFontSize;
  static late double mutasiRekeningSimpananPokokSizedBoxCardTransaksiWidth;
  static late double mutasiRekeningSimpananPokokContainerPertamaWidth;
  static late double mutasiRekeningSimpananPokokContainerKeduaWidth;
  /// cardMutasiRekeningSimpananPokok
  static late double cardMutasiRekeningSimpananPokokContainerWidth;
  static late double cardMutasiRekeningSimpananPokokStringHeadKeyFontSize;
  static late double cardMutasiRekeningSimpananPokokStringHeadTotalSaldoFontSize;
  static late double cardMutasiRekeningSimpananPokokStringJenisTransferDanNomerTransferFontSize;
  static late double cardMutasiRekeningSimpananPokokStringPengeluaranAtauPemasukanFontSize;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (width navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// mutasi_rekening_simpanan_pokok
      mutasiRekeningSimpananPokokTitleFontSize = 12;
      mutasiRekeningSimpananPokokSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananPokokContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananPokokContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningSimpananPokok
      cardMutasiRekeningSimpananPokokContainerWidth = screenWidth;
      cardMutasiRekeningSimpananPokokStringHeadKeyFontSize = 12;
      cardMutasiRekeningSimpananPokokStringHeadTotalSaldoFontSize = 12;
      cardMutasiRekeningSimpananPokokStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiRekeningSimpananPokokStringPengeluaranAtauPemasukanFontSize = 10;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      /// mutasi_rekening_simpanan_pokok
      mutasiRekeningSimpananPokokTitleFontSize = 12;
      mutasiRekeningSimpananPokokSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananPokokContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananPokokContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningSimpananPokok
      cardMutasiRekeningSimpananPokokContainerWidth = screenWidth;
      cardMutasiRekeningSimpananPokokStringHeadKeyFontSize = 12;
      cardMutasiRekeningSimpananPokokStringHeadTotalSaldoFontSize = 12;
      cardMutasiRekeningSimpananPokokStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiRekeningSimpananPokokStringPengeluaranAtauPemasukanFontSize = 10;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// mutasi_rekening_simpanan_pokok
      mutasiRekeningSimpananPokokTitleFontSize = 14;
      mutasiRekeningSimpananPokokSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananPokokContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananPokokContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningSimpananPokok
      cardMutasiRekeningSimpananPokokContainerWidth = screenWidth;
      cardMutasiRekeningSimpananPokokStringHeadKeyFontSize = 12;
      cardMutasiRekeningSimpananPokokStringHeadTotalSaldoFontSize = 12;
      cardMutasiRekeningSimpananPokokStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiRekeningSimpananPokokStringPengeluaranAtauPemasukanFontSize = 10;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// mutasi_rekening_simpanan_pokok
      mutasiRekeningSimpananPokokTitleFontSize = 14;
      mutasiRekeningSimpananPokokSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananPokokContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananPokokContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningSimpananPokok
      cardMutasiRekeningSimpananPokokContainerWidth = screenWidth;
      cardMutasiRekeningSimpananPokokStringHeadKeyFontSize = 12;
      cardMutasiRekeningSimpananPokokStringHeadTotalSaldoFontSize = 12;
      cardMutasiRekeningSimpananPokokStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiRekeningSimpananPokokStringPengeluaranAtauPemasukanFontSize = 10;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// mutasi_rekening_simpanan_pokok
      mutasiRekeningSimpananPokokTitleFontSize = 16;
      mutasiRekeningSimpananPokokSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananPokokContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananPokokContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningSimpananPokok
      cardMutasiRekeningSimpananPokokContainerWidth = screenWidth;
      cardMutasiRekeningSimpananPokokStringHeadKeyFontSize = 16;
      cardMutasiRekeningSimpananPokokStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningSimpananPokokStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningSimpananPokokStringPengeluaranAtauPemasukanFontSize = 12;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// mutasi_rekening_simpanan_pokok
      mutasiRekeningSimpananPokokTitleFontSize = 16;
      mutasiRekeningSimpananPokokSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananPokokContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananPokokContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningSimpananPokok
      cardMutasiRekeningSimpananPokokContainerWidth = screenWidth;
      cardMutasiRekeningSimpananPokokStringHeadKeyFontSize = 16;
      cardMutasiRekeningSimpananPokokStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningSimpananPokokStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningSimpananPokokStringPengeluaranAtauPemasukanFontSize = 12;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// mutasi_rekening_simpanan_pokok
      mutasiRekeningSimpananPokokTitleFontSize = 16;
      mutasiRekeningSimpananPokokSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananPokokContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananPokokContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningSimpananPokok
      cardMutasiRekeningSimpananPokokContainerWidth = screenWidth;
      cardMutasiRekeningSimpananPokokStringHeadKeyFontSize = 16;
      cardMutasiRekeningSimpananPokokStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningSimpananPokokStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningSimpananPokokStringPengeluaranAtauPemasukanFontSize = 12;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      /// mutasi_rekening_simpanan_pokok
      mutasiRekeningSimpananPokokTitleFontSize = 16;
      mutasiRekeningSimpananPokokSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananPokokContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananPokokContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningSimpananPokok
      cardMutasiRekeningSimpananPokokContainerWidth = screenWidth;
      cardMutasiRekeningSimpananPokokStringHeadKeyFontSize = 16;
      cardMutasiRekeningSimpananPokokStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningSimpananPokokStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningSimpananPokokStringPengeluaranAtauPemasukanFontSize = 12;

    } else {
      /// mutasi_rekening_simpanan_pokok
      mutasiRekeningSimpananPokokTitleFontSize = 16;
      mutasiRekeningSimpananPokokSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananPokokContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananPokokContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningSimpananPokok
      cardMutasiRekeningSimpananPokokContainerWidth = screenWidth;
      cardMutasiRekeningSimpananPokokStringHeadKeyFontSize = 16;
      cardMutasiRekeningSimpananPokokStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningSimpananPokokStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningSimpananPokokStringPengeluaranAtauPemasukanFontSize = 12;
    }

  }
}