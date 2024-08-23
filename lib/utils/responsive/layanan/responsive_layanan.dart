
import 'package:flutter/material.dart';

class ResponsiveLayanan {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScaleFactor;

  /// layanan
  static late double layananTittleFontSize;

  /// Card Transfer
  static late double layananCardTransferStringPindahBukuFontSize;
  static late double layananCardTransferStringTextListFontSize;
  static late double layananCardTransferWidth;
  static late double layananCardTransferImageAssetWidth;

  /// Card Bayar
  static late double layananCardBayarStringPindahBukuFontSize;
  static late double layananCardBayarStringTextListFontSize;
  static late double layananCardBayarWidth;
  static late double layananCardBayarImageAssetWidth;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.textScalerOf(context).scale(1);

    // 720 x 1280 (with bottom navigation bar)
    if (screenWidth == 360.0 && screenHeight == 592.0) {
      /// layanan
      layananTittleFontSize = 12 * textScaleFactor;

      /// Card Transfer
      layananCardTransferStringPindahBukuFontSize = 12 * textScaleFactor;
      layananCardTransferStringTextListFontSize = 10 * textScaleFactor;
      layananCardTransferWidth = screenWidth * 0.8;
      layananCardTransferImageAssetWidth = screenWidth * 0.0169;

      /// Card Bayar
      layananCardBayarStringPindahBukuFontSize = 12 * textScaleFactor;
      layananCardBayarStringTextListFontSize = 10 * textScaleFactor;
      layananCardBayarWidth = screenWidth * 0.95;
      layananCardBayarImageAssetWidth = screenWidth * 0.0169;

      // 720 x 1280 (with gesture detector)
    } else if(screenWidth == 360.0 && screenHeight == 616.0) {
      /// layanan
      layananTittleFontSize = 12 * textScaleFactor;

      /// Card Transfer
      layananCardTransferStringPindahBukuFontSize = 12 * textScaleFactor;
      layananCardTransferStringTextListFontSize = 10 * textScaleFactor;
      layananCardTransferWidth = screenWidth * 0.8;
      layananCardTransferImageAssetWidth = screenWidth * 0.0169;

      /// Card Bayar
      layananCardBayarStringPindahBukuFontSize = 12 * textScaleFactor;
      layananCardBayarStringTextListFontSize = 10 * textScaleFactor;
      layananCardBayarWidth = screenWidth * 0.95;
      layananCardBayarImageAssetWidth = screenWidth * 0.0169;

      // 1080 x 1920 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 683.4285714285714) {
      /// layanan
      layananTittleFontSize = 14 * textScaleFactor;

      /// Card Transfer
      layananCardTransferStringPindahBukuFontSize = 12 * textScaleFactor;
      layananCardTransferStringTextListFontSize = 10 * textScaleFactor;
      layananCardTransferWidth = screenWidth * 0.8;
      layananCardTransferImageAssetWidth = screenWidth * 0.01;

      /// Card Bayar
      layananCardBayarStringPindahBukuFontSize = 12 * textScaleFactor;
      layananCardBayarStringTextListFontSize = 10 * textScaleFactor;
      layananCardBayarWidth = screenWidth * 0.95;
      layananCardBayarImageAssetWidth = screenWidth * 0.01;

      // 1080 x 1920 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 707.4285714285714) {
      /// layanan
      layananTittleFontSize = 14 * textScaleFactor;

      /// Card Transfer
      layananCardTransferStringPindahBukuFontSize = 12 * textScaleFactor;
      layananCardTransferStringTextListFontSize = 10 * textScaleFactor;
      layananCardTransferWidth = screenWidth * 0.8;
      layananCardTransferImageAssetWidth = screenWidth * 0.01;

      /// Card Bayar
      layananCardBayarStringPindahBukuFontSize = 12 * textScaleFactor;
      layananCardBayarStringTextListFontSize = 10 * textScaleFactor;
      layananCardBayarWidth = screenWidth * 0.95;
      layananCardBayarImageAssetWidth = screenWidth * 0.01;

      // 1080 x 2400 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 866.2857142857143) {
      /// layanan
      layananTittleFontSize = 16 * textScaleFactor;

      /// Card Transfer
      layananCardTransferStringPindahBukuFontSize = 14 * textScaleFactor;
      layananCardTransferStringTextListFontSize = 12 * textScaleFactor;
      layananCardTransferWidth = screenWidth * 0.8;
      layananCardTransferImageAssetWidth = screenWidth * 0.012;

      /// Card Bayar
      layananCardBayarStringPindahBukuFontSize = 14 * textScaleFactor;
      layananCardBayarStringTextListFontSize = 12 * textScaleFactor;
      layananCardBayarWidth = screenWidth * 0.95;
      layananCardBayarImageAssetWidth = screenWidth * 0.012;

      // 1080 x 2400 (with gesture detector)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 890.2857142857143) {
      /// layanan
      layananTittleFontSize = 16 * textScaleFactor;

      /// Card Transfer
      layananCardTransferStringPindahBukuFontSize = 14 * textScaleFactor;
      layananCardTransferStringTextListFontSize = 12 * textScaleFactor;
      layananCardTransferWidth = screenWidth * 0.8;
      layananCardTransferImageAssetWidth = screenWidth * 0.012;

      /// Card Bayar
      layananCardBayarStringPindahBukuFontSize = 14 * textScaleFactor;
      layananCardBayarStringTextListFontSize = 12 * textScaleFactor;
      layananCardBayarWidth = screenWidth * 0.95;
      layananCardBayarImageAssetWidth = screenWidth * 0.012;

      // 1440 x 3120 (with bottom navigation bar)
    } else if (screenWidth == 411.42857142857144 && screenHeight == 843.4285714285714) {
      /// layanan
      layananTittleFontSize = 16 * textScaleFactor;

      /// Card Transfer
      layananCardTransferStringPindahBukuFontSize = 14 * textScaleFactor;
      layananCardTransferStringTextListFontSize = 12 * textScaleFactor;
      layananCardTransferWidth = screenWidth * 0.8;
      layananCardTransferImageAssetWidth = screenWidth * 0.012;

      /// Card Bayar
      layananCardBayarStringPindahBukuFontSize = 14 * textScaleFactor;
      layananCardBayarStringTextListFontSize = 12 * textScaleFactor;
      layananCardBayarWidth = screenWidth * 0.95;
      layananCardBayarImageAssetWidth = screenWidth * 0.012;

      // 1440 x 3120 (with gesture detector)
    } else if(screenWidth == 411.42857142857144 && screenHeight == 867.4285714285714) {
      /// layanan
      layananTittleFontSize = 16 * textScaleFactor;

      /// Card Transfer
      layananCardTransferStringPindahBukuFontSize = 14 * textScaleFactor;
      layananCardTransferStringTextListFontSize = 12 * textScaleFactor;
      layananCardTransferWidth = screenWidth * 0.8;
      layananCardTransferImageAssetWidth = screenWidth * 0.012;

      /// Card Bayar
      layananCardBayarStringPindahBukuFontSize = 14 * textScaleFactor;
      layananCardBayarStringTextListFontSize = 12 * textScaleFactor;
      layananCardBayarWidth = screenWidth * 0.95;
      layananCardBayarImageAssetWidth = screenWidth * 0.012;

    }else {
      /// layanan
      layananTittleFontSize = 16 * textScaleFactor;

      /// Card Transfer
      layananCardTransferStringPindahBukuFontSize = 14 * textScaleFactor;
      layananCardTransferStringTextListFontSize = 12 * textScaleFactor;
      layananCardTransferWidth = screenWidth * 0.8;
      layananCardTransferImageAssetWidth = screenWidth * 0.012;

      /// Card Bayar
      layananCardBayarStringPindahBukuFontSize = 14 * textScaleFactor;
      layananCardBayarStringTextListFontSize = 12 * textScaleFactor;
      layananCardBayarWidth = screenWidth * 0.95;
      layananCardBayarImageAssetWidth = screenWidth * 0.012;

    }
  }
}