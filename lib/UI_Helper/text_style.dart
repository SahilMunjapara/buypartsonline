import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:flutter/material.dart';

/// 1px = sp(1 * 0.8 = 0.8)

TextStyle size06PNregular({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(4.8),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size25PNregular({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(20),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size07PNregular({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(5.6),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size16PNsemibold({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(12.8),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size34PNregular(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(27.2),
        letterSpacing: letterSpacing,
        height: height,
        fontWeight: FontWeight.w600);

TextStyle size23PNregular(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(18.4),
        letterSpacing: letterSpacing,
        height: height,
        fontWeight: FontWeight.w500);

TextStyle size14PNregular(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(11.2),
        letterSpacing: letterSpacing,
        height: height,
        fontWeight: FontWeight.w400);

TextStyle size16PNbold({Color? textColor, double? letterSpacing}) => TextStyle(
      color: textColor ?? colorBlack,
      fontSize: SizeUtils().sp(12.8),
      letterSpacing: letterSpacing ?? 0.0,
      fontWeight: FontWeight.w700,
    );

TextStyle size14PNlight({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(11.2),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w300);

TextStyle size14PNsemibold(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(11.2),
        height: height,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size13PNregular(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        letterSpacing: letterSpacing,
        height: height,
        fontWeight: FontWeight.w400,
        fontSize: SizeUtils().sp(10.4));

TextStyle size12PNsemibold(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(9.6),
        height: height,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size24PNmedium({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(19.2),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);
TextStyle size24PNsemibold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(19.2),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size24PNregular({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
      color: textColor ?? colorBlack,
      fontSize: SizeUtils().sp(19.2),
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.w400,
    );

TextStyle size24PNbold({Color? textColor, double? letterSpacing}) => TextStyle(
      color: textColor ?? colorBlack,
      fontSize: SizeUtils().sp(19.2),
      letterSpacing: letterSpacing ?? 0.0,
      fontWeight: FontWeight.w700,
    );

TextStyle size12PNregular(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(9.6),
        height: height,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w400);

TextStyle size14PNbold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(11.2),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w700);

TextStyle size11PNmedium({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(8.8),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);

TextStyle size10PNsemibold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(8),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size10PNmedium({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(8),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);

TextStyle size12PNmedium(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        height: height,
        fontSize: SizeUtils().sp(9.6),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);

TextStyle size11PNregular(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(8.8),
        height: height,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w400);

TextStyle size11PNsemibold(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(8.8),
        height: height,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size11PNbold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(8.8),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w700);

TextStyle size09PNbold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(7.2),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w700);

TextStyle size10PNregular300({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(8),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w300);

TextStyle size12PNregular300({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(9.6),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w300);

TextStyle size14PNmedium({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(11.2),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);

TextStyle size10PNregular({Color? textColor, double? letterSpacing}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(8),
        letterSpacing: letterSpacing ?? 0.0,
        fontWeight: FontWeight.w600);

TextStyle size18PNmedium({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(14.4),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);

TextStyle size18PNsemiBold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(14.4),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size09PNsemibold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(7.2),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size13PNbold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(10.4),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w700);

TextStyle size15PNsemibold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(12),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size15PNmedium({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(12),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);

TextStyle size13PNlight({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(10.4),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w400);

TextStyle size19PNsemibold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(15.2),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size13PNmedium(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        letterSpacing: letterSpacing,
        height: height,
        fontWeight: FontWeight.w500,
        fontSize: SizeUtils().sp(10.4));

TextStyle size18PNregular({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(14.4),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size08PNregular(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(6.88),
        height: height,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size16PNregular({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(12.8),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w400);

TextStyle size15PNregular({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(12),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w400);

TextStyle size15PNbold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorBlack,
        fontSize: SizeUtils().sp(12),
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w700);

TextStyle size20PNRegular({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
      color: textColor ?? colorBlack,
      fontSize: SizeUtils().sp(16),
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.w500,
    );
