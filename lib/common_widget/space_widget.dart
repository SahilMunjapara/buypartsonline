import 'package:flutter/material.dart';

Widget horizontalSpace(double width) => SizedBox(width: width);

Widget verticalSpace(double height) => SizedBox(height: height);

Widget divider({Color? color, double? height, double? thickness}) =>
    Divider(color: color, height: height, thickness: thickness);

Widget verticalDivider({Color? color, double? width, double? thickness}) =>
    VerticalDivider(color: color, width: width, thickness: thickness);
