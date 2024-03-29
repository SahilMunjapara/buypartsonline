import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_response_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/service/network/network_string.dart';
import 'package:flutter/material.dart';

class ModelViewCard extends StatelessWidget {
  const ModelViewCard(
      {this.modelViewData, this.onOneCartAdd, this.onFiveCartAdd, Key? key})
      : super(key: key);
  final ModelViewData? modelViewData;
  final VoidCallback? onOneCartAdd;
  final VoidCallback? onFiveCartAdd;

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    double part5OffPrice = int.parse(modelViewData!.partMrp!) -
        (int.parse(modelViewData!.partMrp!) *
            (int.parse(modelViewData!.partLessMoqDiscount!) / 100));
    double part10OffPrice = int.parse(modelViewData!.partMrp!) -
        (int.parse(modelViewData!.partMrp!) *
            ((int.parse(modelViewData!.partMoreMoqDiscount!)) / 100));
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.modelDetailView,
            arguments: modelViewData);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: SizeUtils().screenWidth,
                height: SizeUtils().hp(17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorWhiteBackground,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: modelViewData!.partImages == "" ||
                          modelViewData!.partImages == Strings.noImage
                      ? Image.asset(AssetStrings.noImage)
                      : Image.network(
                          imageURL + modelViewData!.partImages!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, object, stackTrace) {
                            return Image.asset(
                              AssetStrings.noImage,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                ),
              ),
              verticalSpace(6),
              Text(
                modelViewData!.partName!,
                style: size10PNregular(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpace(SizeUtils().hp(0.5)),
              Text(
                modelViewData!.brandName!,
                style: size08PNregular(
                  textColor: colorBrandText,
                ),
              ),
              verticalSpace(SizeUtils().hp(0.5)),
              Text(
                modelViewData!.partNumber!,
                style: size08PNregular(),
              ),
              verticalSpace(SizeUtils().hp(0.5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹ ${part5OffPrice.toString()}',
                    style: size10PNregular(textColor: primaryColor),
                  ),
                  Text(
                    '₹ ${part10OffPrice.toString()}',
                    style: size10PNregular(textColor: primaryColor),
                  ),
                ],
              ),
              verticalSpace(SizeUtils().hp(0.5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹ ${modelViewData!.partMrp}',
                    style: size08PNregular()
                        .copyWith(decoration: TextDecoration.lineThrough),
                  ),
                  Text(
                    '₹ ${modelViewData!.partMrp}',
                    style: size08PNregular()
                        .copyWith(decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              verticalSpace(SizeUtils().hp(0.5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: colorGreen.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 8.0),
                      child: Text(
                        modelViewData!.partLessMoqDiscount! + Strings.perOff,
                        style: size06PNregular(textColor: colorGreen),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: colorGreen.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 8.0),
                      child: Text(
                        modelViewData!.partMoreMoqDiscount! + Strings.perOff,
                        style: size06PNregular(textColor: colorGreen),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(SizeUtils().hp(0.5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onOneCartAdd,
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 10.0),
                        child: Text(
                          Strings.addToCart,
                          style: size07PNregular(textColor: colorWhite),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onFiveCartAdd,
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 10.0),
                        child: Text(
                          getCartMoq(modelViewData!.partMoq!),
                          style: size07PNregular(textColor: colorWhite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(SizeUtils().hp(0.5)),
            ],
          ),
        ),
      ),
    );
  }
}
