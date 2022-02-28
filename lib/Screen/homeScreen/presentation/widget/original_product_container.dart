import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:flutter/material.dart';

Widget originalProductContainer() {
  return Container(
    height: SizeUtils().hp(12),
    width: SizeUtils().screenWidth,
    decoration: BoxDecoration(
      color: colorWhite,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: SizeUtils().hp(10),
            width: SizeUtils().wp(20),
            decoration: BoxDecoration(
              color: colorWhiteBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              AssetStrings.premiumQuality,
            ),
          ),
          horizontalSpace(13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.originalProduct,
                style: size15PNregular(textColor: primaryColor),
              ),
              Text(
                Strings.originalProductDescription,
                style: size12PNregular(),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
