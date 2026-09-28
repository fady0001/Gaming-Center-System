import 'package:flutter/material.dart';


class Dimensions {
  Dimensions._();


  static const double spaceXXS = 4;
  static const double spaceXS = 8;
  static const double spaceS = 12;
  static const double spaceM = 16;
  static const double spaceL = 24;
  static const double spaceXL = 32;
  static const double spaceXXL = 48;


  static const double radiusS = 6;
  static const double radiusM = 10;
  static const double radiusL = 16;
  static const double radiusXL = 24;

  static const double buttonHeight = 52;
  static const double inputHeight = 48;
  static const double tableCardMinHeight = 140;


  static const double iconS = 18;
  static const double iconM = 24;
  static const double iconL = 32;
  static const double iconXL = 48;


  static const double breakpointCompact = 900;
  static const double breakpointMedium = 1280; 

}


enum ScreenSize { compact, medium, wide }


class ResponsiveHelper {
  ResponsiveHelper._();

  static ScreenSize screenSizeOf(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < Dimensions.breakpointCompact) return ScreenSize.compact;
    if (width < Dimensions.breakpointMedium) return ScreenSize.medium;
    return ScreenSize.wide;
  }

  
  static int gridColumnsOf(BuildContext context) {
    switch (screenSizeOf(context)) {
      case ScreenSize.compact:
        return 2;
      case ScreenSize.medium:
        return 4;
      case ScreenSize.wide:
        return 6;
    }
  }


  static double pagePaddingOf(BuildContext context) {
    switch (screenSizeOf(context)) {
      case ScreenSize.compact:
        return Dimensions.spaceM;
      case ScreenSize.medium:
        return Dimensions.spaceL;
      case ScreenSize.wide:
        return Dimensions.spaceXL;
    }
  }
}
