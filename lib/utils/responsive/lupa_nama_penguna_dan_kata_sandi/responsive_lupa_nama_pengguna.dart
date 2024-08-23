import 'package:flutter/material.dart';

class ResponsiveLupaNamaPengguna {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// lupaNamaPengguna
  static late double lupaNamaPenggunaTitleFontSize;
  static late double lupaNamaPenggunaStringDataAkunFontSize;
  static late double lupaNamaPenggunaStringPastikanDataFontSize;
  /// CostumTextFieldLupaNamaPengguna
  static late double costumeTextFieldLupaNamaPenggunaInputFontSize;
  static late double costumeTextFieldLupaNamaPenggunaInputLabelFontSize;
  static late double costumeTextFieldLupaNamaPenggunaTextButtonLanjutkanFontSize;
  static late double costumeTextFieldLupaNamaPenggunaSvgPictureWidth;
  static late double costumeTextFieldLupaNamaPenggunaSizedBoxWidth;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (with bottom navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// lupaNamaPengguna
      lupaNamaPenggunaTitleFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaStringDataAkunFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaStringPastikanDataFontSize = 10 * textScaleFactor;
      /// CostumeTextFieldLupaNamaPengguna
      costumeTextFieldLupaNamaPenggunaInputFontSize = 10 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaInputLabelFontSize = 8 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaTextButtonLanjutkanFontSize = 15 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaSvgPictureWidth = 27;
      costumeTextFieldLupaNamaPenggunaSizedBoxWidth = screenWidth * 0.9;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      /// lupaNamaPengguna
      lupaNamaPenggunaTitleFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaStringDataAkunFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaStringPastikanDataFontSize = 10 * textScaleFactor;
      /// CostumeTextFieldLupaNamaPengguna
      costumeTextFieldLupaNamaPenggunaInputFontSize = 10 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaInputLabelFontSize = 8 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaTextButtonLanjutkanFontSize = 15 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaSvgPictureWidth = 27;
      costumeTextFieldLupaNamaPenggunaSizedBoxWidth = screenWidth * 0.9;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// lupaNamaPengguna
      lupaNamaPenggunaTitleFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaStringDataAkunFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaStringPastikanDataFontSize = 12 * textScaleFactor;
      /// CostumeTextFieldLupaNamaPengguna
      costumeTextFieldLupaNamaPenggunaInputFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaInputLabelFontSize = 12 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaTextButtonLanjutkanFontSize = 16 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaSvgPictureWidth = 47;
      costumeTextFieldLupaNamaPenggunaSizedBoxWidth = screenWidth * 0.95;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// lupaNamaPengguna
      lupaNamaPenggunaTitleFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaStringDataAkunFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaStringPastikanDataFontSize = 12 * textScaleFactor;
      /// CostumeTextFieldLupaNamaPengguna
      costumeTextFieldLupaNamaPenggunaInputFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaInputLabelFontSize = 12 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaTextButtonLanjutkanFontSize = 16 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaSvgPictureWidth = 47;
      costumeTextFieldLupaNamaPenggunaSizedBoxWidth = screenWidth * 0.95;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// lupaNamaPengguna
      lupaNamaPenggunaTitleFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaStringDataAkunFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaStringPastikanDataFontSize = 12 * textScaleFactor;
      /// CostumeTextFieldLupaNamaPengguna
      costumeTextFieldLupaNamaPenggunaInputFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaInputLabelFontSize = 12 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaTextButtonLanjutkanFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaSvgPictureWidth = 47;
      costumeTextFieldLupaNamaPenggunaSizedBoxWidth = screenWidth * 0.95;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// lupaNamaPengguna
      lupaNamaPenggunaTitleFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaStringDataAkunFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaStringPastikanDataFontSize = 12 * textScaleFactor;
      /// CostumeTextFieldLupaNamaPengguna
      costumeTextFieldLupaNamaPenggunaInputFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaInputLabelFontSize = 12 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaTextButtonLanjutkanFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaSvgPictureWidth = 47;
      costumeTextFieldLupaNamaPenggunaSizedBoxWidth = screenWidth * 0.95;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// lupaNamaPengguna
      lupaNamaPenggunaTitleFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaStringDataAkunFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaStringPastikanDataFontSize = 12 * textScaleFactor;
      /// CostumeTextFieldLupaNamaPengguna
      costumeTextFieldLupaNamaPenggunaInputFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaInputLabelFontSize = 12 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaTextButtonLanjutkanFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaSvgPictureWidth = 47;
      costumeTextFieldLupaNamaPenggunaSizedBoxWidth = screenWidth * 0.95;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      /// lupaNamaPengguna
      lupaNamaPenggunaTitleFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaStringDataAkunFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaStringPastikanDataFontSize = 12 * textScaleFactor;
      /// CostumeTextFieldLupaNamaPengguna
      costumeTextFieldLupaNamaPenggunaInputFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaInputLabelFontSize = 12 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaTextButtonLanjutkanFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaSvgPictureWidth = 47;
      costumeTextFieldLupaNamaPenggunaSizedBoxWidth = screenWidth * 0.95;

    }else {
      /// lupaNamaPengguna
      lupaNamaPenggunaTitleFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaStringDataAkunFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaStringPastikanDataFontSize = 12 * textScaleFactor;
      /// CostumeTextFieldLupaNamaPengguna
      costumeTextFieldLupaNamaPenggunaInputFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaInputLabelFontSize = 12 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaTextButtonLanjutkanFontSize = 14 * textScaleFactor;
      costumeTextFieldLupaNamaPenggunaSvgPictureWidth = 47;
      costumeTextFieldLupaNamaPenggunaSizedBoxWidth = screenWidth * 0.95;
    }
  }
}