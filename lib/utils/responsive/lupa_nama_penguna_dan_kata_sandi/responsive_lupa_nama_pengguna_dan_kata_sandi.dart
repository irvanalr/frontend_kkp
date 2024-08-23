
import 'package:flutter/material.dart';

class ResponsiveLupaNamaPenggunaDanKataSandi {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// Lupa nama pengguna dan kata sandi
  static late double lupaNamaPenggunaDanKataSandiTitleFontSize;
  static late double lupaNamaPenggunaDanKataSandiStringHeadFontSize;
  static late double lupaNamaPenggunaDanKataSandiStringSubJudulFontSize;
  static late double lupaNamaPenggunaDanKataSandiSizedBoxHeight;
  /// CostumeRadioButton
  static late double costumeRadioButtonCardNamaPenggunaDanKataSandiWidth;
  static late double costumeRadioButtonNamaPenggunaDanKataSandiHeadFontSize;
  static late double costumRadioButtonNamaPenggunaDanKataSandiBodyFontSize;
  static late double costumeRadioButtonNamaPenggunaDanKataSandiTextButtonLanjutkanFontSize;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

      // 720 x 1280 (with bottom navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// Lupa nama pengguna dan password
      lupaNamaPenggunaDanKataSandiTitleFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringHeadFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringSubJudulFontSize = 10 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiSizedBoxHeight = 30;
      /// costumeRadioButton
      costumeRadioButtonCardNamaPenggunaDanKataSandiWidth = screenWidth * 0.8;
      costumeRadioButtonNamaPenggunaDanKataSandiHeadFontSize = 12 * textScaleFactor;
      costumRadioButtonNamaPenggunaDanKataSandiBodyFontSize = 10 * textScaleFactor;
      costumeRadioButtonNamaPenggunaDanKataSandiTextButtonLanjutkanFontSize = 14 * textScaleFactor;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      /// Lupa nama pengguna dan password
      lupaNamaPenggunaDanKataSandiTitleFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringHeadFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringSubJudulFontSize = 10 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiSizedBoxHeight = 30;
      /// costumeRadioButton
      costumeRadioButtonCardNamaPenggunaDanKataSandiWidth = screenWidth * 0.8;
      costumeRadioButtonNamaPenggunaDanKataSandiHeadFontSize = 12 * textScaleFactor;
      costumRadioButtonNamaPenggunaDanKataSandiBodyFontSize = 10 * textScaleFactor;
      costumeRadioButtonNamaPenggunaDanKataSandiTextButtonLanjutkanFontSize = 14 * textScaleFactor;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// Lupa nama pengguna dan password
      lupaNamaPenggunaDanKataSandiTitleFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringHeadFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringSubJudulFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiSizedBoxHeight = 30;
      /// costumeRadioButton
      costumeRadioButtonCardNamaPenggunaDanKataSandiWidth = screenWidth * 0.9;
      costumeRadioButtonNamaPenggunaDanKataSandiHeadFontSize = 14 * textScaleFactor;
      costumRadioButtonNamaPenggunaDanKataSandiBodyFontSize = 12 * textScaleFactor;
      costumeRadioButtonNamaPenggunaDanKataSandiTextButtonLanjutkanFontSize = 16 * textScaleFactor;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// Lupa nama pengguna dan password
      lupaNamaPenggunaDanKataSandiTitleFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringHeadFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringSubJudulFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiSizedBoxHeight = 30;
      /// costumeRadioButton
      costumeRadioButtonCardNamaPenggunaDanKataSandiWidth = screenWidth * 0.9;
      costumeRadioButtonNamaPenggunaDanKataSandiHeadFontSize = 14 * textScaleFactor;
      costumRadioButtonNamaPenggunaDanKataSandiBodyFontSize = 12 * textScaleFactor;
      costumeRadioButtonNamaPenggunaDanKataSandiTextButtonLanjutkanFontSize = 16 * textScaleFactor;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// Lupa nama pengguna dan password
      lupaNamaPenggunaDanKataSandiTitleFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringHeadFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringSubJudulFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiSizedBoxHeight = 30;
      /// costumeRadioButton
      costumeRadioButtonCardNamaPenggunaDanKataSandiWidth = screenWidth * 0.9;
      costumeRadioButtonNamaPenggunaDanKataSandiHeadFontSize = 14 * textScaleFactor;
      costumRadioButtonNamaPenggunaDanKataSandiBodyFontSize = 12 * textScaleFactor;
      costumeRadioButtonNamaPenggunaDanKataSandiTextButtonLanjutkanFontSize = 14 * textScaleFactor;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// Lupa nama pengguna dan password
      lupaNamaPenggunaDanKataSandiTitleFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringHeadFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringSubJudulFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiSizedBoxHeight = 30;
      /// costumeRadioButton
      costumeRadioButtonCardNamaPenggunaDanKataSandiWidth = screenWidth * 0.9;
      costumeRadioButtonNamaPenggunaDanKataSandiHeadFontSize = 14 * textScaleFactor;
      costumRadioButtonNamaPenggunaDanKataSandiBodyFontSize = 12 * textScaleFactor;
      costumeRadioButtonNamaPenggunaDanKataSandiTextButtonLanjutkanFontSize = 14 * textScaleFactor;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// Lupa nama pengguna dan password
      lupaNamaPenggunaDanKataSandiTitleFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringHeadFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringSubJudulFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiSizedBoxHeight = 30;
      /// costumeRadioButton
      costumeRadioButtonCardNamaPenggunaDanKataSandiWidth = screenWidth * 0.9;
      costumeRadioButtonNamaPenggunaDanKataSandiHeadFontSize = 14 * textScaleFactor;
      costumRadioButtonNamaPenggunaDanKataSandiBodyFontSize = 12 * textScaleFactor;
      costumeRadioButtonNamaPenggunaDanKataSandiTextButtonLanjutkanFontSize = 14 * textScaleFactor;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      /// Lupa nama pengguna dan password
      lupaNamaPenggunaDanKataSandiTitleFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringHeadFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringSubJudulFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiSizedBoxHeight = 30;
      /// costumeRadioButton
      costumeRadioButtonCardNamaPenggunaDanKataSandiWidth = screenWidth * 0.9;
      costumeRadioButtonNamaPenggunaDanKataSandiHeadFontSize = 14 * textScaleFactor;
      costumRadioButtonNamaPenggunaDanKataSandiBodyFontSize = 12 * textScaleFactor;
      costumeRadioButtonNamaPenggunaDanKataSandiTextButtonLanjutkanFontSize = 14 * textScaleFactor;

    }else {
      /// Lupa nama pengguna dan password
      lupaNamaPenggunaDanKataSandiTitleFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringHeadFontSize = 14 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiStringSubJudulFontSize = 12 * textScaleFactor;
      lupaNamaPenggunaDanKataSandiSizedBoxHeight = 30;
      /// costumeRadioButton
      costumeRadioButtonCardNamaPenggunaDanKataSandiWidth = screenWidth * 0.9;
      costumeRadioButtonNamaPenggunaDanKataSandiHeadFontSize = 14 * textScaleFactor;
      costumRadioButtonNamaPenggunaDanKataSandiBodyFontSize = 12 * textScaleFactor;
      costumeRadioButtonNamaPenggunaDanKataSandiTextButtonLanjutkanFontSize = 14 * textScaleFactor;
    }
  }
}