
import 'package:flutter/material.dart';

class ResponsiveAkunProfile {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// akun_profile
  static late double akunProfileTittleFontSize;
  /// akun_profile card_user
  static late double akunProfileCardUserContainerDanSizedBoxWidth;
  static late double akunProfileCardUserStringAkunNameFontSize;
  static late double akunProfileCardUserStringTerdaftarFontSize;
  static late double akunProfileCardUserStringAkunNumberFontSize;
  static late double akunProfileCardUserStringAkunStringEmailFontSize;
  static late double akunProfileCardUserStringAkunStringPhoneNumberFontSize;
  static late double akunProfileCardUserStringAkunStringAkunMapFontSize;
  /// akun_profile card_pengaturan
  static late double akunProfileCardPengaturanContainerDanSizedBoxWidth;
  static late double akunProfileCardPengaturanStringPengaturanFontSize;
  static late double akunProfileCardPengaturanStringGantiPasswordFontSize;
  static late double akunProfileCardPengaturanStringGantiRekeningWalletFontSize;


  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (with bottom navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// akun_profile
      akunProfileTittleFontSize = 12 * textScaleFactor;
      /// akun_profile card_user
      akunProfileCardUserContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardUserStringAkunNameFontSize = 10 * textScaleFactor;
      akunProfileCardUserStringTerdaftarFontSize = 8 * textScaleFactor;
      akunProfileCardUserStringAkunNumberFontSize = 8 * textScaleFactor;
      akunProfileCardUserStringAkunStringEmailFontSize = 10 * textScaleFactor;
      akunProfileCardUserStringAkunStringPhoneNumberFontSize = 10 * textScaleFactor;
      akunProfileCardUserStringAkunStringAkunMapFontSize = 10 * textScaleFactor;
      /// akun_profile card_pengaturan
      akunProfileCardPengaturanContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardPengaturanStringPengaturanFontSize = 10 * textScaleFactor;
      akunProfileCardPengaturanStringGantiPasswordFontSize = 10 * textScaleFactor;
      akunProfileCardPengaturanStringGantiRekeningWalletFontSize = 10 * textScaleFactor;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      /// akun_profile
      akunProfileTittleFontSize = 12 * textScaleFactor;
      /// akun_profile card_user
      akunProfileCardUserContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardUserStringAkunNameFontSize = 10 * textScaleFactor;
      akunProfileCardUserStringTerdaftarFontSize = 8 * textScaleFactor;
      akunProfileCardUserStringAkunNumberFontSize = 8 * textScaleFactor;
      akunProfileCardUserStringAkunStringEmailFontSize = 10 * textScaleFactor;
      akunProfileCardUserStringAkunStringPhoneNumberFontSize = 10 * textScaleFactor;
      akunProfileCardUserStringAkunStringAkunMapFontSize = 10 * textScaleFactor;
      /// akun_profile card_pengaturan
      akunProfileCardPengaturanContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardPengaturanStringPengaturanFontSize = 10 * textScaleFactor;
      akunProfileCardPengaturanStringGantiPasswordFontSize = 10 * textScaleFactor;
      akunProfileCardPengaturanStringGantiRekeningWalletFontSize = 10 * textScaleFactor;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// akun_profile
      akunProfileTittleFontSize = 14 * textScaleFactor;
      /// akun_profile card_user
      akunProfileCardUserContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardUserStringAkunNameFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringTerdaftarFontSize = 12 * textScaleFactor;
      akunProfileCardUserStringAkunNumberFontSize = 12 * textScaleFactor;
      akunProfileCardUserStringAkunStringEmailFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringAkunStringPhoneNumberFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringAkunStringAkunMapFontSize = 14 * textScaleFactor;
      /// akun_profile card_pengaturan
      akunProfileCardPengaturanContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardPengaturanStringPengaturanFontSize = 14 * textScaleFactor;
      akunProfileCardPengaturanStringGantiPasswordFontSize = 14 * textScaleFactor;
      akunProfileCardPengaturanStringGantiRekeningWalletFontSize = 14 * textScaleFactor;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// akun_profile
      akunProfileTittleFontSize = 14 * textScaleFactor;
      /// akun_profile card_user
      akunProfileCardUserContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardUserStringAkunNameFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringTerdaftarFontSize = 12 * textScaleFactor;
      akunProfileCardUserStringAkunNumberFontSize = 12 * textScaleFactor;
      akunProfileCardUserStringAkunStringEmailFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringAkunStringPhoneNumberFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringAkunStringAkunMapFontSize = 14 * textScaleFactor;
      /// akun_profile card_pengaturan
      akunProfileCardPengaturanContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardPengaturanStringPengaturanFontSize = 14 * textScaleFactor;
      akunProfileCardPengaturanStringGantiPasswordFontSize = 14 * textScaleFactor;
      akunProfileCardPengaturanStringGantiRekeningWalletFontSize = 14 * textScaleFactor;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// akun_profile
      akunProfileTittleFontSize = 14 * textScaleFactor;
      /// akun_profile card_user
      akunProfileCardUserContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardUserStringAkunNameFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringTerdaftarFontSize = 12 * textScaleFactor;
      akunProfileCardUserStringAkunNumberFontSize = 12 * textScaleFactor;
      akunProfileCardUserStringAkunStringEmailFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringAkunStringPhoneNumberFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringAkunStringAkunMapFontSize = 14 * textScaleFactor;
      /// akun_profile card_pengaturan
      akunProfileCardPengaturanContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardPengaturanStringPengaturanFontSize = 14 * textScaleFactor;
      akunProfileCardPengaturanStringGantiPasswordFontSize = 14 * textScaleFactor;
      akunProfileCardPengaturanStringGantiRekeningWalletFontSize = 14 * textScaleFactor;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// akun_profile
      akunProfileTittleFontSize = 14 * textScaleFactor;
      /// akun_profile card_user
      akunProfileCardUserContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardUserStringAkunNameFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringTerdaftarFontSize = 12 * textScaleFactor;
      akunProfileCardUserStringAkunNumberFontSize = 12 * textScaleFactor;
      akunProfileCardUserStringAkunStringEmailFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringAkunStringPhoneNumberFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringAkunStringAkunMapFontSize = 14 * textScaleFactor;
      /// akun_profile card_pengaturan
      akunProfileCardPengaturanContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardPengaturanStringPengaturanFontSize = 14 * textScaleFactor;
      akunProfileCardPengaturanStringGantiPasswordFontSize = 14 * textScaleFactor;
      akunProfileCardPengaturanStringGantiRekeningWalletFontSize = 14 * textScaleFactor;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// akun_profile
      akunProfileTittleFontSize = 16 * textScaleFactor;
      /// akun_profile card_user
      akunProfileCardUserContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardUserStringAkunNameFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringTerdaftarFontSize = 12 * textScaleFactor;
      akunProfileCardUserStringAkunNumberFontSize = 12 * textScaleFactor;
      akunProfileCardUserStringAkunStringEmailFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringAkunStringPhoneNumberFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringAkunStringAkunMapFontSize = 14 * textScaleFactor;
      /// akun_profile card_pengaturan
      akunProfileCardPengaturanContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardPengaturanStringPengaturanFontSize = 14 * textScaleFactor;
      akunProfileCardPengaturanStringGantiPasswordFontSize = 14 * textScaleFactor;
      akunProfileCardPengaturanStringGantiRekeningWalletFontSize = 14 * textScaleFactor;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      /// akun_profile
      akunProfileTittleFontSize = 16 * textScaleFactor;
      /// akun_profile card_user
      akunProfileCardUserContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardUserStringAkunNameFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringTerdaftarFontSize = 12 * textScaleFactor;
      akunProfileCardUserStringAkunNumberFontSize = 12 * textScaleFactor;
      akunProfileCardUserStringAkunStringEmailFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringAkunStringPhoneNumberFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringAkunStringAkunMapFontSize = 14 * textScaleFactor;
      /// akun_profile card_pengaturan
      akunProfileCardPengaturanContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardPengaturanStringPengaturanFontSize = 14 * textScaleFactor;
      akunProfileCardPengaturanStringGantiPasswordFontSize = 14 * textScaleFactor;
      akunProfileCardPengaturanStringGantiRekeningWalletFontSize = 14 * textScaleFactor;

    } else {
      /// akun_profile
      akunProfileTittleFontSize = 14 * textScaleFactor;
      /// akun_profile card_user
      akunProfileCardUserContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardUserStringAkunNameFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringTerdaftarFontSize = 12 * textScaleFactor;
      akunProfileCardUserStringAkunNumberFontSize = 12 * textScaleFactor;
      akunProfileCardUserStringAkunStringEmailFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringAkunStringPhoneNumberFontSize = 14 * textScaleFactor;
      akunProfileCardUserStringAkunStringAkunMapFontSize = 14 * textScaleFactor;
      /// akun_profile card_pengaturan
      akunProfileCardPengaturanContainerDanSizedBoxWidth = screenWidth * 0.9;
      akunProfileCardPengaturanStringPengaturanFontSize = 14 * textScaleFactor;
      akunProfileCardPengaturanStringGantiPasswordFontSize = 14 * textScaleFactor;
      akunProfileCardPengaturanStringGantiRekeningWalletFontSize = 14 * textScaleFactor;

    }

  }
}