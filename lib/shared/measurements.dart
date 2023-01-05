import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

const screenStandardWidth = 320.0;
const screenStandardHight = 700.0;

double screenWidth(Size screenSize) {
  return isPhone() ? screenSize.width : 0.5625 * screenStandardHight;
}

double screenHeight(Size screenSize) {
  return isPhone() ? screenSize.height : screenStandardHight;
}

bool isPhone() {
  return isPhonePlatform();
  // return screenSize.width <= screenStandardWidth;
}

bool isPhonePlatform() {
  return (defaultTargetPlatform == TargetPlatform.iOS) ||
      (defaultTargetPlatform == TargetPlatform.android);
}
