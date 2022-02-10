import 'package:flutter/material.dart';

class SizeUtils {
  static final SizeUtils _sizeUtils = SizeUtils._init();

  factory SizeUtils() {
    return _sizeUtils;
  }

  SizeUtils._init();

  MediaQueryData? _mediaQueryData;
  double? screenWidth;
  double? screenHeight;
  double? horizontalBlockSize;
  double? verticalBlockSize;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    horizontalBlockSize = screenWidth! / 100;
    verticalBlockSize = screenHeight! / 100;
  }

  double hp(double height) => height * screenHeight! / 100;

  double wp(double width) => width * screenWidth! / 100;

  double sp(double width) =>
      double.parse((width * (screenWidth! / 3) / 100).toStringAsFixed(0));
}
