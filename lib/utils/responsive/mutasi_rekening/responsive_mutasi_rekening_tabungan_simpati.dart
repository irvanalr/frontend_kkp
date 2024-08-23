import 'package:flutter/cupertino.dart';

class ResponsiveMutasiRekeningTabunganSimpati {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// mutasi_rekening_tabungan_simpati
  static late double mutasiRekeningTabunganSimpatiTitleFontSize;
  static late double mutasiRekeningTabunganSimpatiSizedBoxCardTransaksiWidth;
  static late double mutasiRekeningTabunganSimpatiContainerPertamaWidth;
  static late double mutasiRekeningTabunganSimpatiContainerKeduaWidth;
  /// cardMutasiRekeningTabunganSimpati
  static late double cardMutasiRekeningTabunganSimpatiContainerWidth;
  static late double cardMutasiRekeningTabunganSimpatiStringHeadKeyFontSize;
  static late double cardMutasiRekeningTabunganSimpatiStringHeadTotalSaldoFontSize;
  static late double cardMutasiRekeningTabunganSimpatiStringJenisTransferDanNomerTransferFontSize;
  static late double cardMutasiRekeningTabunganSimpatiStringPengeluaranAtauPemasukanFontSize;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (width navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// mutasi_rekening_tabungan_simpati
      mutasiRekeningTabunganSimpatiTitleFontSize = 12;
      mutasiRekeningTabunganSimpatiSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningTabunganSimpatiContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningTabunganSimpatiContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningTabunganSimpati
      cardMutasiRekeningTabunganSimpatiContainerWidth = screenWidth;
      cardMutasiRekeningTabunganSimpatiStringHeadKeyFontSize = 12;
      cardMutasiRekeningTabunganSimpatiStringHeadTotalSaldoFontSize = 12;
      cardMutasiRekeningTabunganSimpatiStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiRekeningTabunganSimpatiStringPengeluaranAtauPemasukanFontSize = 10;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      /// mutasi_rekening_tabungan_simpati
      mutasiRekeningTabunganSimpatiTitleFontSize = 12;
      mutasiRekeningTabunganSimpatiSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningTabunganSimpatiContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningTabunganSimpatiContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningTabunganSimpati
      cardMutasiRekeningTabunganSimpatiContainerWidth = screenWidth;
      cardMutasiRekeningTabunganSimpatiStringHeadKeyFontSize = 12;
      cardMutasiRekeningTabunganSimpatiStringHeadTotalSaldoFontSize = 12;
      cardMutasiRekeningTabunganSimpatiStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiRekeningTabunganSimpatiStringPengeluaranAtauPemasukanFontSize = 10;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// mutasi_rekening_tabungan_simpati
      mutasiRekeningTabunganSimpatiTitleFontSize = 14;
      mutasiRekeningTabunganSimpatiSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningTabunganSimpatiContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningTabunganSimpatiContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningTabunganSimpati
      cardMutasiRekeningTabunganSimpatiContainerWidth = screenWidth;
      cardMutasiRekeningTabunganSimpatiStringHeadKeyFontSize = 12;
      cardMutasiRekeningTabunganSimpatiStringHeadTotalSaldoFontSize = 12;
      cardMutasiRekeningTabunganSimpatiStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiRekeningTabunganSimpatiStringPengeluaranAtauPemasukanFontSize = 10;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// mutasi_rekening_tabungan_simpati
      mutasiRekeningTabunganSimpatiTitleFontSize = 14;
      mutasiRekeningTabunganSimpatiSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningTabunganSimpatiContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningTabunganSimpatiContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningTabunganSimpati
      cardMutasiRekeningTabunganSimpatiContainerWidth = screenWidth;
      cardMutasiRekeningTabunganSimpatiStringHeadKeyFontSize = 12;
      cardMutasiRekeningTabunganSimpatiStringHeadTotalSaldoFontSize = 12;
      cardMutasiRekeningTabunganSimpatiStringJenisTransferDanNomerTransferFontSize = 10;
      cardMutasiRekeningTabunganSimpatiStringPengeluaranAtauPemasukanFontSize = 10;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// mutasi_rekening_tabungan_simpati
      mutasiRekeningTabunganSimpatiTitleFontSize = 16;
      mutasiRekeningTabunganSimpatiSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningTabunganSimpatiContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningTabunganSimpatiContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningTabunganSimpati
      cardMutasiRekeningTabunganSimpatiContainerWidth = screenWidth;
      cardMutasiRekeningTabunganSimpatiStringHeadKeyFontSize = 16;
      cardMutasiRekeningTabunganSimpatiStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningTabunganSimpatiStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningTabunganSimpatiStringPengeluaranAtauPemasukanFontSize = 12;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// mutasi_rekening_tabungan_simpati
      mutasiRekeningTabunganSimpatiTitleFontSize = 16;
      mutasiRekeningTabunganSimpatiSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningTabunganSimpatiContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningTabunganSimpatiContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningTabunganSimpati
      cardMutasiRekeningTabunganSimpatiContainerWidth = screenWidth;
      cardMutasiRekeningTabunganSimpatiStringHeadKeyFontSize = 16;
      cardMutasiRekeningTabunganSimpatiStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningTabunganSimpatiStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningTabunganSimpatiStringPengeluaranAtauPemasukanFontSize = 12;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// mutasi_rekening_tabungan_simpati
      mutasiRekeningTabunganSimpatiTitleFontSize = 16;
      mutasiRekeningTabunganSimpatiSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningTabunganSimpatiContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningTabunganSimpatiContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningTabunganSimpati
      cardMutasiRekeningTabunganSimpatiContainerWidth = screenWidth;
      cardMutasiRekeningTabunganSimpatiStringHeadKeyFontSize = 16;
      cardMutasiRekeningTabunganSimpatiStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningTabunganSimpatiStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningTabunganSimpatiStringPengeluaranAtauPemasukanFontSize = 12;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      /// mutasi_rekening_tabungan_simpati
      mutasiRekeningTabunganSimpatiTitleFontSize = 16;
      mutasiRekeningTabunganSimpatiSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningTabunganSimpatiContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningTabunganSimpatiContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningTabunganSimpati
      cardMutasiRekeningTabunganSimpatiContainerWidth = screenWidth;
      cardMutasiRekeningTabunganSimpatiStringHeadKeyFontSize = 16;
      cardMutasiRekeningTabunganSimpatiStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningTabunganSimpatiStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningTabunganSimpatiStringPengeluaranAtauPemasukanFontSize = 12;

    } else {
      /// mutasi_rekening_tabungan_simpati
      mutasiRekeningTabunganSimpatiTitleFontSize = 16;
      mutasiRekeningTabunganSimpatiSizedBoxCardTransaksiWidth = screenWidth * 0.95;
      mutasiRekeningTabunganSimpatiContainerPertamaWidth = screenWidth * 0.4;
      mutasiRekeningTabunganSimpatiContainerKeduaWidth = screenWidth * 0.55;
      /// cardMutasiRekeningTabunganSimpati
      cardMutasiRekeningTabunganSimpatiContainerWidth = screenWidth;
      cardMutasiRekeningTabunganSimpatiStringHeadKeyFontSize = 16;
      cardMutasiRekeningTabunganSimpatiStringHeadTotalSaldoFontSize = 16;
      cardMutasiRekeningTabunganSimpatiStringJenisTransferDanNomerTransferFontSize = 12;
      cardMutasiRekeningTabunganSimpatiStringPengeluaranAtauPemasukanFontSize = 12;
    }

  }
}