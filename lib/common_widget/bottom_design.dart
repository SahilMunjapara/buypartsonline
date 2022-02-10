import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:flutter/material.dart';

class BottomDesignBox extends StatelessWidget {
  const BottomDesignBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: colorWhiteBackground,
        width: SizeUtils().screenWidth,
        child: Image.asset(
          bottomDesign,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
