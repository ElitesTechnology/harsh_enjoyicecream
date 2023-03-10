import 'package:flutter/material.dart';

class MediaQueryConstants {
  static  isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width ;
  }

  static  isSmallHight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 900;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 900;
  }

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

// You can add more methods based on your use case
}
