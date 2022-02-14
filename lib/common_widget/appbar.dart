import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:flutter/cupertino.dart';

Container loginSignupBar(String? title) {
  return Container(
    decoration: BoxDecoration(
      color: primaryColor,
      borderRadius:
          BorderRadius.only(bottomLeft: Radius.circular(SizeUtils().wp(10))),
    ),
    height: SizeUtils().hp(25),
    width: SizeUtils().screenWidth,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: SizeUtils().hp(12), left: SizeUtils().wp(5)),
          child: Text(
            title!,
            style: size34PNregular(textColor: colorWhite),
          ),
        ),
        const Spacer(),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: SizeUtils().wp(5)),
              child: Image.asset(AssetStrings.bagLogo),
            ))
      ],
    ),
  );
}
