import 'package:flutter/widgets.dart';
import 'dart:io' show Platform;

class AppBouncingScrollPhysics extends BouncingScrollPhysics {
  @override
  bool get allowImplicitScrolling => true;

  @override
  double get dragStartDistanceMotionThreshold => null;
}

class App {
  static ScrollPhysics getPlatformPhysics() {
    if (Platform.isAndroid) {
      return AppBouncingScrollPhysics();
    } else if (Platform.isIOS) {
      return AppBouncingScrollPhysics();
    } else {
      return AlwaysScrollableScrollPhysics();
    }
  }
}
