import 'package:buypartsonline/Screen/homeScreen/data/model/home_category_response_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/service/network/network_string.dart';
import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({this.onCardTap, this.categoryData, Key? key})
      : super(key: key);
  final VoidCallback? onCardTap;
  final CategoryData? categoryData;

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return GestureDetector(
      onTap: onCardTap,
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Container(
          height: SizeUtils().hp(23),
          width: SizeUtils().verticalBlockSize! * 23,
          decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: colorGrey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 17, right: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: SizeUtils().hp(18),
                  width: SizeUtils().wp(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorWhiteBackground,
                  ),
                  child: categoryData!.categoryImage == "" ||
                          categoryData!.categoryImage == Strings.noImage
                      ? Image.asset(AssetStrings.noImage)
                      : Image.network(
                          '$imageURL${categoryData!.categoryImage}',
                          errorBuilder: (context, object, stackTrace) {
                            return Image.asset(
                              AssetStrings.noImage,
                            );
                          },
                        ),
                ),
                Text(
                  categoryData!.categoryName!,
                  textAlign: TextAlign.center,
                  style: size14PNregular(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
