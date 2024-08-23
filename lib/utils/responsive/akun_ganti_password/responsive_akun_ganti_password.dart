import 'package:flutter/material.dart';

class ResponsiveAkunGantiPassword {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// Akun
  static late double akunGantiPasswordStringTitleFontSize;
  static late double akunGantiPasswordIconsSize;
  static late double akunGantiPasswordContainerTextFieldWidth;
  static late double akunGantiPasswordTextFieldInputFontSize;
  static late double akunGantiPasswordTextFieldRadioFontSize;
  static late double akunGantiPasswordTextFieldLabelFontSize;
  static late double akunGantiPasswordContainerTextButtonWidth;
  static late double akunGantiPasswordTextButtonFontSize;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (with bottom navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      akunGantiPasswordStringTitleFontSize = 14 * textScaleFactor;
      akunGantiPasswordIconsSize = screenWidth * 0.25;
      akunGantiPasswordContainerTextFieldWidth = screenWidth * 0.9;
      akunGantiPasswordTextFieldInputFontSize = 12 * textScaleFactor;
      akunGantiPasswordTextFieldRadioFontSize = 10 * textScaleFactor;
      akunGantiPasswordTextFieldLabelFontSize = 12 * textScaleFactor;
      akunGantiPasswordContainerTextButtonWidth = screenWidth * 0.9;
      akunGantiPasswordTextButtonFontSize = 14 * textScaleFactor;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      akunGantiPasswordStringTitleFontSize = 14 * textScaleFactor;
      akunGantiPasswordIconsSize = screenWidth * 0.25;
      akunGantiPasswordContainerTextFieldWidth = screenWidth * 0.9;
      akunGantiPasswordTextFieldInputFontSize = 12 * textScaleFactor;
      akunGantiPasswordTextFieldRadioFontSize = 10 * textScaleFactor;
      akunGantiPasswordTextFieldLabelFontSize = 12 * textScaleFactor;
      akunGantiPasswordContainerTextButtonWidth = screenWidth * 0.9;
      akunGantiPasswordTextButtonFontSize = 14 * textScaleFactor;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      akunGantiPasswordStringTitleFontSize = 16 * textScaleFactor;
      akunGantiPasswordIconsSize = screenWidth * 0.35;
      akunGantiPasswordContainerTextFieldWidth = screenWidth * 0.9;
      akunGantiPasswordTextFieldInputFontSize = 14 * textScaleFactor;
      akunGantiPasswordTextFieldRadioFontSize = 12 * textScaleFactor;
      akunGantiPasswordTextFieldLabelFontSize = 14 * textScaleFactor;
      akunGantiPasswordContainerTextButtonWidth = screenWidth * 0.9;
      akunGantiPasswordTextButtonFontSize = 16 * textScaleFactor;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      akunGantiPasswordStringTitleFontSize = 16 * textScaleFactor;
      akunGantiPasswordIconsSize = screenWidth * 0.35;
      akunGantiPasswordContainerTextFieldWidth = screenWidth * 0.9;
      akunGantiPasswordTextFieldInputFontSize = 14 * textScaleFactor;
      akunGantiPasswordTextFieldRadioFontSize = 12 * textScaleFactor;
      akunGantiPasswordTextFieldLabelFontSize = 14 * textScaleFactor;
      akunGantiPasswordContainerTextButtonWidth = screenWidth * 0.9;
      akunGantiPasswordTextButtonFontSize = 16 * textScaleFactor;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      akunGantiPasswordStringTitleFontSize = 16 * textScaleFactor;
      akunGantiPasswordIconsSize = screenWidth * 0.35;
      akunGantiPasswordContainerTextFieldWidth = screenWidth * 0.9;
      akunGantiPasswordTextFieldInputFontSize = 14 * textScaleFactor;
      akunGantiPasswordTextFieldRadioFontSize = 12 * textScaleFactor;
      akunGantiPasswordTextFieldLabelFontSize = 14 * textScaleFactor;
      akunGantiPasswordContainerTextButtonWidth = screenWidth * 0.9;
      akunGantiPasswordTextButtonFontSize = 16 * textScaleFactor;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      akunGantiPasswordStringTitleFontSize = 16 * textScaleFactor;
      akunGantiPasswordIconsSize = screenWidth * 0.35;
      akunGantiPasswordContainerTextFieldWidth = screenWidth * 0.9;
      akunGantiPasswordTextFieldInputFontSize = 14 * textScaleFactor;
      akunGantiPasswordTextFieldRadioFontSize = 12 * textScaleFactor;
      akunGantiPasswordTextFieldLabelFontSize = 14 * textScaleFactor;
      akunGantiPasswordContainerTextButtonWidth = screenWidth * 0.9;
      akunGantiPasswordTextButtonFontSize = 16 * textScaleFactor;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      akunGantiPasswordStringTitleFontSize = 16 * textScaleFactor;
      akunGantiPasswordIconsSize = screenWidth * 0.35;
      akunGantiPasswordContainerTextFieldWidth = screenWidth * 0.9;
      akunGantiPasswordTextFieldInputFontSize = 14 * textScaleFactor;
      akunGantiPasswordTextFieldRadioFontSize = 12 * textScaleFactor;
      akunGantiPasswordTextFieldLabelFontSize = 14 * textScaleFactor;
      akunGantiPasswordContainerTextButtonWidth = screenWidth * 0.9;
      akunGantiPasswordTextButtonFontSize = 16 * textScaleFactor;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      akunGantiPasswordStringTitleFontSize = 16 * textScaleFactor;
      akunGantiPasswordIconsSize = screenWidth * 0.35;
      akunGantiPasswordContainerTextFieldWidth = screenWidth * 0.9;
      akunGantiPasswordTextFieldInputFontSize = 14 * textScaleFactor;
      akunGantiPasswordTextFieldRadioFontSize = 12 * textScaleFactor;
      akunGantiPasswordTextFieldLabelFontSize = 14 * textScaleFactor;
      akunGantiPasswordContainerTextButtonWidth = screenWidth * 0.9;
      akunGantiPasswordTextButtonFontSize = 16 * textScaleFactor;

    }else {
      akunGantiPasswordStringTitleFontSize = 16 * textScaleFactor;
      akunGantiPasswordIconsSize = screenWidth * 0.35;
      akunGantiPasswordContainerTextFieldWidth = screenWidth * 0.9;
      akunGantiPasswordTextFieldInputFontSize = 14 * textScaleFactor;
      akunGantiPasswordTextFieldRadioFontSize = 12 * textScaleFactor;
      akunGantiPasswordTextFieldLabelFontSize = 14 * textScaleFactor;
      akunGantiPasswordContainerTextButtonWidth = screenWidth * 0.9;
      akunGantiPasswordTextButtonFontSize = 16 * textScaleFactor;
    }
  }
}