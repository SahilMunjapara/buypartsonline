import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:flutter/material.dart';

class Indicator {
  static Widget screenProgressIndicator(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static Widget paginationProgressIndicator(
      {EdgeInsetsGeometry? padding, EdgeInsetsGeometry? margin}) {
    return Container(
      height: SizeUtils().wp(8),
      width: SizeUtils().wp(8),
      padding: padding,
      margin: margin,
      child: const CircularProgressIndicator(
        strokeWidth: 3.0,
      ),
    );
  }
}
