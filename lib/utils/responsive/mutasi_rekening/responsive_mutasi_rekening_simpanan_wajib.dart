import 'package:flutter/cupertino.dart';

class ResponsiveMutasiRekeningSimpananWajib {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// mutasi_rekening_simpanan_wajib
  static late double mutasiRekeningSimpananWajibTitleFontSize;
  static late double mutasiRekeningSimpananWajibSizedBoxCardTransaksiWidth;
  static late double mutasiRekeningSimpananWajibContainerPertamaWidth;
  static late double mutasiRekeningSimpananWajibContainerKeduaWidth;
  /// cardRekeningSimpananWajib
  static late double cardMutasiRekeningSimpananWajibContainerWidth;
  static late double cardMutasiRekeningSimpananWajibStringHeadKeyFontSize;
  static late double cardMutasiRekeningSimpananWajibStringHeadTotalSaldoFontSize;
  static late double cardMutasiRekeningSimpananWajibStringJenisTransferDanNomerTransferFontSize;
  static late double cardMutasiRekeningSimpananWajibStringPengeluaranAtauPemasukanFontSize;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (width navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// mutasi_rekening_simpanan_wajib
      mutasiRekeningSimpananWajibTitleFontSize = 12;
      mutasiRekeningSimpananWajibSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananWajibContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananWajibContainerKeduaWidth = screenWidth * 0.55;
      /// cardRekeningSimpananWajib
      cardMutasiRekeningSimpananWajibContainerWidth = screenWidth;
      cardMutasiRekeningSimpananWajibStringHeadKeyFontSize = 12;
      cardMutasiRekeningSimpananWajibStringHeadTotalSaldoFontSize = 12;
      cardMutasiRekeningSimpananWajibStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiRekeningSimpananWajibStringPengeluaranAtauPemasukanFontSize = 10;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      /// mutasi_rekening_simpanan_wajib
      mutasiRekeningSimpananWajibTitleFontSize = 12;
      mutasiRekeningSimpananWajibSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananWajibContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananWajibContainerKeduaWidth = screenWidth * 0.55;
      /// cardRekeningSimpananWajib
      cardMutasiRekeningSimpananWajibContainerWidth = screenWidth;
      cardMutasiRekeningSimpananWajibStringHeadKeyFontSize = 12;
      cardMutasiRekeningSimpananWajibStringHeadTotalSaldoFontSize = 12;
      cardMutasiRekeningSimpananWajibStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiRekeningSimpananWajibStringPengeluaranAtauPemasukanFontSize = 10;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// mutasi_rekening_simpanan_wajib
      mutasiRekeningSimpananWajibTitleFontSize = 14;
      mutasiRekeningSimpananWajibSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananWajibContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananWajibContainerKeduaWidth = screenWidth * 0.55;
      /// cardRekeningSimpananWajib
      cardMutasiRekeningSimpananWajibContainerWidth = screenWidth;
      cardMutasiRekeningSimpananWajibStringHeadKeyFontSize = 12;
      cardMutasiRekeningSimpananWajibStringHeadTotalSaldoFontSize = 12;
      cardMutasiRekeningSimpananWajibStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiRekeningSimpananWajibStringPengeluaranAtauPemasukanFontSize = 10;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// mutasi_rekening_simpanan_wajib
      mutasiRekeningSimpananWajibTitleFontSize = 14;
      mutasiRekeningSimpananWajibSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananWajibContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananWajibContainerKeduaWidth = screenWidth * 0.55;
      /// cardRekeningSimpananWajib
      cardMutasiRekeningSimpananWajibContainerWidth = screenWidth;
      cardMutasiRekeningSimpananWajibStringHeadKeyFontSize = 12;
      cardMutasiRekeningSimpananWajibStringHeadTotalSaldoFontSize = 12;
      cardMutasiRekeningSimpananWajibStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiRekeningSimpananWajibStringPengeluaranAtauPemasukanFontSize = 10;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// mutasi_rekening_simpanan_wajib
      mutasiRekeningSimpananWajibTitleFontSize = 16;
      mutasiRekeningSimpananWajibSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananWajibContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananWajibContainerKeduaWidth = screenWidth * 0.55;
      /// cardRekeningSimpananWajib
      cardMutasiRekeningSimpananWajibContainerWidth = screenWidth;
      cardMutasiRekeningSimpananWajibStringHeadKeyFontSize = 16;
      cardMutasiRekeningSimpananWajibStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningSimpananWajibStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningSimpananWajibStringPengeluaranAtauPemasukanFontSize = 12;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// mutasi_rekening_simpanan_wajib
      mutasiRekeningSimpananWajibTitleFontSize = 16;
      mutasiRekeningSimpananWajibSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananWajibContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananWajibContainerKeduaWidth = screenWidth * 0.55;
      /// cardRekeningSimpananWajib
      cardMutasiRekeningSimpananWajibContainerWidth = screenWidth;
      cardMutasiRekeningSimpananWajibStringHeadKeyFontSize = 16;
      cardMutasiRekeningSimpananWajibStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningSimpananWajibStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningSimpananWajibStringPengeluaranAtauPemasukanFontSize = 12;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// mutasi_rekening_simpanan_wajib
      mutasiRekeningSimpananWajibTitleFontSize = 16;
      mutasiRekeningSimpananWajibSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananWajibContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananWajibContainerKeduaWidth = screenWidth * 0.55;
      /// cardRekeningSimpananWajib
      cardMutasiRekeningSimpananWajibContainerWidth = screenWidth;
      cardMutasiRekeningSimpananWajibStringHeadKeyFontSize = 16;
      cardMutasiRekeningSimpananWajibStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningSimpananWajibStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningSimpananWajibStringPengeluaranAtauPemasukanFontSize = 12;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      /// mutasi_rekening_simpanan_wajib
      mutasiRekeningSimpananWajibTitleFontSize = 16;
      mutasiRekeningSimpananWajibSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananWajibContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananWajibContainerKeduaWidth = screenWidth * 0.55;
      /// cardRekeningSimpananWajib
      cardMutasiRekeningSimpananWajibContainerWidth = screenWidth;
      cardMutasiRekeningSimpananWajibStringHeadKeyFontSize = 16;
      cardMutasiRekeningSimpananWajibStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningSimpananWajibStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningSimpananWajibStringPengeluaranAtauPemasukanFontSize = 12;

    } else {
      /// mutasi_rekening_simpanan_wajib
      mutasiRekeningSimpananWajibTitleFontSize = 16;
      mutasiRekeningSimpananWajibSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningSimpananWajibContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningSimpananWajibContainerKeduaWidth = screenWidth * 0.55;
      /// cardRekeningSimpananWajib
      cardMutasiRekeningSimpananWajibContainerWidth = screenWidth;
      cardMutasiRekeningSimpananWajibStringHeadKeyFontSize = 16;
      cardMutasiRekeningSimpananWajibStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningSimpananWajibStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningSimpananWajibStringPengeluaranAtauPemasukanFontSize = 12;
    }

  }
}