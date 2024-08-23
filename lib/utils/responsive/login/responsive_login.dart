import 'package:flutter/material.dart';

class ResponsiveLogin {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// Login
  static late double loginStringAssalamualaikumFontSize;
  static late double loginBaseResolutionSizedBoxHeight;
  static late double loginShapeContainerWidth;
  static late double loginShapeContainerHeight;
  static late double loginCarouselPositionedTop;
  static late double loginCarouselPositionedLeft;
  static late double loginShapeCarouselWidth;
  static late double loginShapeCarouselHeight;
  static late double loginPositionedTopMenuKilat;
  static late double loginSizedBoxMenuKilatWidth;
  static late double loginPositionedLeftCostomeTextFieldLogin;
  static late double loginStringLupaNamaPenggunaDanKataSandiFontSize;
  /// CustomTextFieldLogin
  static late double costumeTextFieldLoginInputDanInputLabelTextFieldFontSize;
  static late double costumeTextFieldTextButtonFontSize;
  static late double costumeTextFieldInputAndButtonWidth;
  static late double costumeTextFieldSizeBoxHeight;
  /// CarouselLogin
  static late double carouselLoginSizedBoxWidth;
  static late double carouselLoginSizedBoxHeight;
  /// MenuKilat
  static late double menuKilatTextStringListFontSize;
  static late double menuKilatImageSizeWidth;


  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (with bottom navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// Login
      loginStringAssalamualaikumFontSize = 14 * textScaleFactor;
      loginBaseResolutionSizedBoxHeight = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      loginShapeContainerWidth = screenWidth;
      loginShapeContainerHeight = screenHeight * 0.3;
      loginCarouselPositionedTop = screenHeight * 0.01;
      loginCarouselPositionedLeft = screenWidth * 0.05;
      loginShapeCarouselWidth = screenWidth * 0.9;
      loginShapeCarouselHeight = screenHeight * 0.25;
      loginPositionedTopMenuKilat = screenHeight * 0.33;
      loginSizedBoxMenuKilatWidth = screenWidth;
      loginPositionedLeftCostomeTextFieldLogin = screenWidth * 0.1;
      loginStringLupaNamaPenggunaDanKataSandiFontSize = 12 * textScaleFactor;
      /// CustomeTextFieldLogin
      costumeTextFieldLoginInputDanInputLabelTextFieldFontSize = 10 * textScaleFactor;
      costumeTextFieldTextButtonFontSize = 12 * textScaleFactor;
      costumeTextFieldInputAndButtonWidth = screenWidth * 0.8;
      costumeTextFieldSizeBoxHeight = screenHeight * 0.02;
      /// CarouselLogin
      carouselLoginSizedBoxWidth = screenWidth;
      carouselLoginSizedBoxHeight = screenHeight * 0.3;
      /// menuKilat
      menuKilatTextStringListFontSize = 9 * textScaleFactor;
      menuKilatImageSizeWidth = screenWidth * 0.0169;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      /// Login
      loginStringAssalamualaikumFontSize = 14 * textScaleFactor;
      loginBaseResolutionSizedBoxHeight = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      loginShapeContainerWidth = screenWidth;
      loginShapeContainerHeight = screenHeight * 0.3;
      loginCarouselPositionedTop = screenHeight * 0.01;
      loginCarouselPositionedLeft = screenWidth * 0.05;
      loginShapeCarouselWidth = screenWidth * 0.9;
      loginShapeCarouselHeight = screenHeight * 0.25;
      loginPositionedTopMenuKilat = screenHeight * 0.33;
      loginSizedBoxMenuKilatWidth = screenWidth;
      loginPositionedLeftCostomeTextFieldLogin = screenWidth * 0.1;
      loginStringLupaNamaPenggunaDanKataSandiFontSize = 12 * textScaleFactor;
      /// CustomeTextFieldLogin
      costumeTextFieldLoginInputDanInputLabelTextFieldFontSize = 10 * textScaleFactor;
      costumeTextFieldTextButtonFontSize = 12 * textScaleFactor;
      costumeTextFieldInputAndButtonWidth = screenWidth * 0.8;
      costumeTextFieldSizeBoxHeight = screenHeight * 0.02;
      /// CarouselLogin
      carouselLoginSizedBoxWidth = screenWidth;
      carouselLoginSizedBoxHeight = screenHeight * 0.3;
      /// menuKilat
      menuKilatTextStringListFontSize = 9 * textScaleFactor;
      menuKilatImageSizeWidth = screenWidth * 0.0169;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// login
      loginStringAssalamualaikumFontSize = 14 * textScaleFactor;
      loginBaseResolutionSizedBoxHeight = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      loginShapeContainerWidth = screenWidth;
      loginShapeContainerHeight = screenHeight * 0.3;
      loginCarouselPositionedTop = screenHeight * 0.01;
      loginCarouselPositionedLeft = screenWidth * 0.05;
      loginShapeCarouselWidth = screenWidth * 0.9;
      loginShapeCarouselHeight = screenHeight * 0.25;
      loginPositionedTopMenuKilat = screenHeight * 0.37;
      loginSizedBoxMenuKilatWidth = screenWidth;
      loginPositionedLeftCostomeTextFieldLogin = screenWidth * 0.1;
      loginStringLupaNamaPenggunaDanKataSandiFontSize = 15 * textScaleFactor;
      /// CustomTextFieldLogin
      costumeTextFieldLoginInputDanInputLabelTextFieldFontSize = 12 * textScaleFactor;
      costumeTextFieldTextButtonFontSize = 14 * textScaleFactor;
      costumeTextFieldInputAndButtonWidth = screenWidth * 0.8;
      costumeTextFieldSizeBoxHeight = screenHeight * 0.02;
      /// CarouselLogin
      carouselLoginSizedBoxWidth = screenWidth;
      carouselLoginSizedBoxHeight = screenHeight * 0.3;
      /// menuKilat
      menuKilatTextStringListFontSize = 10 * textScaleFactor;
      menuKilatImageSizeWidth = screenWidth * 0.012;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// login
      loginStringAssalamualaikumFontSize = 14 * textScaleFactor;
      loginBaseResolutionSizedBoxHeight = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      loginShapeContainerWidth = screenWidth;
      loginShapeContainerHeight = screenHeight * 0.3;
      loginCarouselPositionedTop = screenHeight * 0.01;
      loginCarouselPositionedLeft = screenWidth * 0.05;
      loginShapeCarouselWidth = screenWidth * 0.9;
      loginShapeCarouselHeight = screenHeight * 0.25;
      loginPositionedTopMenuKilat = screenHeight * 0.37;
      loginSizedBoxMenuKilatWidth = screenWidth;
      loginPositionedLeftCostomeTextFieldLogin = screenWidth * 0.1;
      loginStringLupaNamaPenggunaDanKataSandiFontSize = 15 * textScaleFactor;
      /// CustomTextFieldLogin
      costumeTextFieldLoginInputDanInputLabelTextFieldFontSize = 12 * textScaleFactor;
      costumeTextFieldTextButtonFontSize = 14 * textScaleFactor;
      costumeTextFieldInputAndButtonWidth = screenWidth * 0.8;
      costumeTextFieldSizeBoxHeight = screenHeight * 0.02;
      /// CarouselLogin
      carouselLoginSizedBoxWidth = screenWidth;
      carouselLoginSizedBoxHeight = screenHeight * 0.3;
      /// menuKilat
      menuKilatTextStringListFontSize = 10 * textScaleFactor;
      menuKilatImageSizeWidth = screenWidth * 0.012;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// login
      loginStringAssalamualaikumFontSize = 18 * textScaleFactor;
      loginBaseResolutionSizedBoxHeight = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      loginShapeContainerWidth = screenWidth;
      loginShapeContainerHeight = screenHeight * 0.3;
      loginCarouselPositionedTop = screenHeight * 0.01;
      loginCarouselPositionedLeft = screenWidth * 0.05;
      loginShapeCarouselWidth = screenWidth * 0.9;
      loginShapeCarouselHeight = screenHeight * 0.25;
      loginPositionedTopMenuKilat = screenHeight * 0.37;
      loginSizedBoxMenuKilatWidth = screenWidth;
      loginPositionedLeftCostomeTextFieldLogin = screenWidth * 0.1;
      loginStringLupaNamaPenggunaDanKataSandiFontSize = 14 * textScaleFactor;
      /// CustomTextFieldLogin
      costumeTextFieldLoginInputDanInputLabelTextFieldFontSize = 14 * textScaleFactor;
      costumeTextFieldTextButtonFontSize = 16 * textScaleFactor;
      costumeTextFieldInputAndButtonWidth = screenWidth * 0.8;
      costumeTextFieldSizeBoxHeight = screenHeight * 0.02;
      /// CarouselLogin
      carouselLoginSizedBoxWidth = screenWidth;
      carouselLoginSizedBoxHeight = screenHeight * 0.3;
      /// menuKilat
      menuKilatTextStringListFontSize = 12 * textScaleFactor;
      menuKilatImageSizeWidth = screenWidth * 0.012;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// login
      loginStringAssalamualaikumFontSize = 18 * textScaleFactor;
      loginBaseResolutionSizedBoxHeight = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      loginShapeContainerWidth = screenWidth;
      loginShapeContainerHeight = screenHeight * 0.3;
      loginCarouselPositionedTop = screenHeight * 0.01;
      loginCarouselPositionedLeft = screenWidth * 0.05;
      loginShapeCarouselWidth = screenWidth * 0.9;
      loginShapeCarouselHeight = screenHeight * 0.25;
      loginPositionedTopMenuKilat = screenHeight * 0.37;
      loginSizedBoxMenuKilatWidth = screenWidth;
      loginPositionedLeftCostomeTextFieldLogin = screenWidth * 0.1;
      loginStringLupaNamaPenggunaDanKataSandiFontSize = 14 * textScaleFactor;
      /// CustomTextFieldLogin
      costumeTextFieldLoginInputDanInputLabelTextFieldFontSize = 14 * textScaleFactor;
      costumeTextFieldTextButtonFontSize = 16 * textScaleFactor;
      costumeTextFieldInputAndButtonWidth = screenWidth * 0.8;
      costumeTextFieldSizeBoxHeight = screenHeight * 0.02;
      /// CarouselLogin
      carouselLoginSizedBoxWidth = screenWidth;
      carouselLoginSizedBoxHeight = screenHeight * 0.3;
      /// menuKilat
      menuKilatTextStringListFontSize = 12 * textScaleFactor;
      menuKilatImageSizeWidth = screenWidth * 0.012;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// login
      loginStringAssalamualaikumFontSize = 18 * textScaleFactor;
      loginBaseResolutionSizedBoxHeight = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      loginShapeContainerWidth = screenWidth;
      loginShapeContainerHeight = screenHeight * 0.3;
      loginCarouselPositionedTop = screenHeight * 0.01;
      loginCarouselPositionedLeft = screenWidth * 0.05;
      loginShapeCarouselWidth = screenWidth * 0.9;
      loginShapeCarouselHeight = screenHeight * 0.25;
      loginPositionedTopMenuKilat = screenHeight * 0.37;
      loginSizedBoxMenuKilatWidth = screenWidth;
      loginPositionedLeftCostomeTextFieldLogin = screenWidth * 0.1;
      loginStringLupaNamaPenggunaDanKataSandiFontSize = 14 * textScaleFactor;
      /// CustomTextFieldLogin
      costumeTextFieldLoginInputDanInputLabelTextFieldFontSize = 14 * textScaleFactor;
      costumeTextFieldTextButtonFontSize = 16 * textScaleFactor;
      costumeTextFieldInputAndButtonWidth = screenWidth * 0.8;
      costumeTextFieldSizeBoxHeight = screenHeight * 0.02;
      /// CarouselLogin
      carouselLoginSizedBoxWidth = screenWidth;
      carouselLoginSizedBoxHeight = screenHeight * 0.3;
      /// menuKilat
      menuKilatTextStringListFontSize = 12 * textScaleFactor;
      menuKilatImageSizeWidth = screenWidth * 0.012;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      /// login
      loginStringAssalamualaikumFontSize = 18 * textScaleFactor;
      loginBaseResolutionSizedBoxHeight = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      loginShapeContainerWidth = screenWidth;
      loginShapeContainerHeight = screenHeight * 0.3;
      loginCarouselPositionedTop = screenHeight * 0.01;
      loginCarouselPositionedLeft = screenWidth * 0.05;
      loginShapeCarouselWidth = screenWidth * 0.9;
      loginShapeCarouselHeight = screenHeight * 0.25;
      loginPositionedTopMenuKilat = screenHeight * 0.37;
      loginSizedBoxMenuKilatWidth = screenWidth;
      loginPositionedLeftCostomeTextFieldLogin = screenWidth * 0.1;
      loginStringLupaNamaPenggunaDanKataSandiFontSize = 14 * textScaleFactor;
      /// CustomTextFieldLogin
      costumeTextFieldLoginInputDanInputLabelTextFieldFontSize = 14 * textScaleFactor;
      costumeTextFieldTextButtonFontSize = 16 * textScaleFactor;
      costumeTextFieldInputAndButtonWidth = screenWidth * 0.8;
      costumeTextFieldSizeBoxHeight = screenHeight * 0.02;
      /// CarouselLogin
      carouselLoginSizedBoxWidth = screenWidth;
      carouselLoginSizedBoxHeight = screenHeight * 0.3;
      /// menuKilat
      menuKilatTextStringListFontSize = 12 * textScaleFactor;
      menuKilatImageSizeWidth = screenWidth * 0.012;

    }else {
      /// login
      loginStringAssalamualaikumFontSize = 18 * textScaleFactor;
      loginBaseResolutionSizedBoxHeight = screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
      loginShapeContainerWidth = screenWidth;
      loginShapeContainerHeight = screenHeight * 0.3;
      loginCarouselPositionedTop = screenHeight * 0.01;
      loginCarouselPositionedLeft = screenWidth * 0.05;
      loginShapeCarouselWidth = screenWidth * 0.9;
      loginShapeCarouselHeight = screenHeight * 0.25;
      loginPositionedTopMenuKilat = screenHeight * 0.37;
      loginSizedBoxMenuKilatWidth = screenWidth;
      loginPositionedLeftCostomeTextFieldLogin = screenWidth * 0.1;
      loginStringLupaNamaPenggunaDanKataSandiFontSize = 14 * textScaleFactor;
      /// CustomTextFieldLogin
      costumeTextFieldLoginInputDanInputLabelTextFieldFontSize = 14 * textScaleFactor;
      costumeTextFieldTextButtonFontSize = 14 * textScaleFactor;
      costumeTextFieldInputAndButtonWidth = screenWidth * 0.8;
      costumeTextFieldSizeBoxHeight = screenHeight * 0.02;
      /// CarouselLogin
      carouselLoginSizedBoxWidth = screenWidth;
      carouselLoginSizedBoxHeight = screenHeight * 0.3;
      /// menuKilat
      menuKilatTextStringListFontSize = 12 * textScaleFactor;
      menuKilatImageSizeWidth = screenWidth * 0.012;
    }
  }
}