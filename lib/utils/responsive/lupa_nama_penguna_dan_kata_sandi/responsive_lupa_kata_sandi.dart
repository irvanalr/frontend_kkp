
import 'package:flutter/material.dart';

class ResponsiveLupaKataSandi {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// lupaKataSandi
  static late double lupaKataSandiTitleFontSize;
  static late double lupaKataSandiStringDataAkunFontSize;
  static late double lupaKataSandiStringPastikanDataFontSize;
  /// customeTextFieldLupaKataSandi
  static late double costumeTextFieldLupaKataSandiInputNamaPenggunaDanTanggalLahirFontSize;
  static late double costumeTextFieldLupaKataSandiInputLabelNamaPenggunaDanTanggalLahirFontSize;
  static late double costumeTextFieldLupaKataSandiTextButtonLanjutkanFontSize;
  static late double costumeTextFieldLupaKataSandiSvgPictureWidth;
  static late double costumeTextFieldLupaKataSandiSizedBoxWidth;


  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (with bottom navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// lupaKataSandi
      lupaKataSandiTitleFontSize = 12 * textScaleFactor;
      lupaKataSandiStringDataAkunFontSize = 12 * textScaleFactor;
      lupaKataSandiStringPastikanDataFontSize = 10 * textScaleFactor;
      /// customeTextFieldLupaKataSandi
      costumeTextFieldLupaKataSandiInputNamaPenggunaDanTanggalLahirFontSize = 10 * textScaleFactor;
      costumeTextFieldLupaKataSandiInputLabelNamaPenggunaDanTanggalLahirFontSize = 8 * textScaleFactor;
      costumeTextFieldLupaKataSandiTextButtonLanjutkanFontSize = 15 * textScaleFactor;
      costumeTextFieldLupaKataSandiSvgPictureWidth = 27;
      costumeTextFieldLupaKataSandiSizedBoxWidth = screenWidth * 0.9;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      /// lupaKataSandi
      lupaKataSandiTitleFontSize = 12 * textScaleFactor;
      lupaKataSandiStringDataAkunFontSize = 12 * textScaleFactor;
      lupaKataSandiStringPastikanDataFontSize = 10 * textScaleFactor;
      /// customeTextFieldLupaKataSandi
      costumeTextFieldLupaKataSandiInputNamaPenggunaDanTanggalLahirFontSize = 10 * textScaleFactor;
      costumeTextFieldLupaKataSandiInputLabelNamaPenggunaDanTanggalLahirFontSize = 8 * textScaleFactor;
      costumeTextFieldLupaKataSandiTextButtonLanjutkanFontSize = 15 * textScaleFactor;
      costumeTextFieldLupaKataSandiSvgPictureWidth = 27;
      costumeTextFieldLupaKataSandiSizedBoxWidth = screenWidth * 0.9;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// lupaKataSandi
      lupaKataSandiTitleFontSize = 12 * textScaleFactor;
      lupaKataSandiStringDataAkunFontSize = 14 * textScaleFactor;
      lupaKataSandiStringPastikanDataFontSize = 12 * textScaleFactor;
      /// customeTextFieldLupaKataSandi
      costumeTextFieldLupaKataSandiInputNamaPenggunaDanTanggalLahirFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaKataSandiInputLabelNamaPenggunaDanTanggalLahirFontSize = 12 * textScaleFactor;
      costumeTextFieldLupaKataSandiTextButtonLanjutkanFontSize = 16 * textScaleFactor;
      costumeTextFieldLupaKataSandiSvgPictureWidth = 47;
      costumeTextFieldLupaKataSandiSizedBoxWidth = screenWidth * 0.95;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// lupaKataSandi
      lupaKataSandiTitleFontSize = 12 * textScaleFactor;
      lupaKataSandiStringDataAkunFontSize = 14 * textScaleFactor;
      lupaKataSandiStringPastikanDataFontSize = 12 * textScaleFactor;
      /// customeTextFieldLupaKataSandi
      costumeTextFieldLupaKataSandiInputNamaPenggunaDanTanggalLahirFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaKataSandiInputLabelNamaPenggunaDanTanggalLahirFontSize = 12 * textScaleFactor;
      costumeTextFieldLupaKataSandiTextButtonLanjutkanFontSize = 16 * textScaleFactor;
      costumeTextFieldLupaKataSandiSvgPictureWidth = 47;
      costumeTextFieldLupaKataSandiSizedBoxWidth = screenWidth * 0.95;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// lupaKataSandi
      lupaKataSandiTitleFontSize = 14 * textScaleFactor;
      lupaKataSandiStringDataAkunFontSize = 14 * textScaleFactor;
      lupaKataSandiStringPastikanDataFontSize = 12 * textScaleFactor;
      /// customeTextFieldLupaKataSandi
      costumeTextFieldLupaKataSandiInputNamaPenggunaDanTanggalLahirFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaKataSandiInputLabelNamaPenggunaDanTanggalLahirFontSize = 12 * textScaleFactor;
      costumeTextFieldLupaKataSandiTextButtonLanjutkanFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaKataSandiSvgPictureWidth = 47;
      costumeTextFieldLupaKataSandiSizedBoxWidth = screenWidth * 0.95;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// lupaKataSandi
      lupaKataSandiTitleFontSize = 14 * textScaleFactor;
      lupaKataSandiStringDataAkunFontSize = 14 * textScaleFactor;
      lupaKataSandiStringPastikanDataFontSize = 12 * textScaleFactor;
      /// customeTextFieldLupaKataSandi
      costumeTextFieldLupaKataSandiInputNamaPenggunaDanTanggalLahirFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaKataSandiInputLabelNamaPenggunaDanTanggalLahirFontSize = 12 * textScaleFactor;
      costumeTextFieldLupaKataSandiTextButtonLanjutkanFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaKataSandiSvgPictureWidth = 47;
      costumeTextFieldLupaKataSandiSizedBoxWidth = screenWidth * 0.95;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// lupaKataSandi
      lupaKataSandiTitleFontSize = 14 * textScaleFactor;
      lupaKataSandiStringDataAkunFontSize = 14 * textScaleFactor;
      lupaKataSandiStringPastikanDataFontSize = 12 * textScaleFactor;
      /// customeTextFieldLupaKataSandi
      costumeTextFieldLupaKataSandiInputNamaPenggunaDanTanggalLahirFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaKataSandiInputLabelNamaPenggunaDanTanggalLahirFontSize = 12 * textScaleFactor;
      costumeTextFieldLupaKataSandiTextButtonLanjutkanFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaKataSandiSvgPictureWidth = 47;
      costumeTextFieldLupaKataSandiSizedBoxWidth = screenWidth * 0.95;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      /// lupaKataSandi
      lupaKataSandiTitleFontSize = 14 * textScaleFactor;
      lupaKataSandiStringDataAkunFontSize = 14 * textScaleFactor;
      lupaKataSandiStringPastikanDataFontSize = 12 * textScaleFactor;
      /// customeTextFieldLupaKataSandi
      costumeTextFieldLupaKataSandiInputNamaPenggunaDanTanggalLahirFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaKataSandiInputLabelNamaPenggunaDanTanggalLahirFontSize = 12 * textScaleFactor;
      costumeTextFieldLupaKataSandiTextButtonLanjutkanFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaKataSandiSvgPictureWidth = 47;
      costumeTextFieldLupaKataSandiSizedBoxWidth = screenWidth * 0.95;

    }else {
      /// lupaKataSandi
      lupaKataSandiTitleFontSize = 14 * textScaleFactor;
      lupaKataSandiStringDataAkunFontSize = 14 * textScaleFactor;
      lupaKataSandiStringPastikanDataFontSize = 12 * textScaleFactor;
      /// customeTextFieldLupaKataSandi
      costumeTextFieldLupaKataSandiInputNamaPenggunaDanTanggalLahirFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaKataSandiInputLabelNamaPenggunaDanTanggalLahirFontSize = 12 * textScaleFactor;
      costumeTextFieldLupaKataSandiTextButtonLanjutkanFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaKataSandiSvgPictureWidth = 47;
      costumeTextFieldLupaKataSandiSizedBoxWidth = screenWidth * 0.95;
    }
  }
}