import 'package:buypartsonline/Screen/cartScreen/data/model/get_cart_product_response_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/math_helper.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/service/network/network_string.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard(
      {this.getCartProductData,
      this.cartTotal,
      this.onDeleteTap,
      this.onPlusTap,
      this.onMinusTap,
      Key? key})
      : super(key: key);
  final GetCartProductData? getCartProductData;
  final int? cartTotal;
  final VoidCallback? onMinusTap;
  final VoidCallback? onPlusTap;
  final VoidCallback? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    double totalPrice = getTotalPrice(
      int.parse(getCartProductData!.partMrp!),
      cartTotal! < getCartProductData!.partMoq!
          ? int.parse(getCartProductData!.partLessMoqDiscount!)
          : int.parse(getCartProductData!.partMoreMoqDiscount!),
      cartTotal!,
    );
    double partPrice = getPriceWithDiscount(
      int.parse(getCartProductData!.partMrp!),
      cartTotal! < getCartProductData!.partMoq!
          ? int.parse(getCartProductData!.partLessMoqDiscount!)
          : int.parse(getCartProductData!.partMoreMoqDiscount!),
    );
    String getDiscountOffer = getQtyOfferString(
      cartTotal!,
      getCartProductData!.partMoq!,
      int.parse(getCartProductData!.partMoreMoqDiscount!),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: SizeUtils().hp(13),
                    width: SizeUtils().wp(24),
                    decoration: BoxDecoration(
                      color: colorWhiteBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageURL + getCartProductData!.partImages!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  horizontalSpace(10),
                  SizedBox(
                    height: SizeUtils().hp(13),
                    width: SizeUtils().wp(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getCartProductData!.partName!,
                          style: size14PNregular(),
                          maxLines: 2,
                        ),
                        Text(
                          getCartProductData!.brandName!,
                          style: size12PNregular(
                            textColor: colorGreyText,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '₹ ${totalPrice.toStringAsFixed(2)}',
                              style: size14PNregular(textColor: primaryColor),
                            ),
                            horizontalSpace(5),
                            Text(
                              '₹ ${partPrice.toString()}',
                              style: size12PNregular(),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: primaryColor.withOpacity(0.1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 1),
                                child: Text(
                                  cartTotal! >= getCartProductData!.partMoq!
                                      ? getCartProductData!
                                              .partMoreMoqDiscount! +
                                          '% off'
                                      : getCartProductData!
                                              .partLessMoqDiscount! +
                                          '% off',
                                  style:
                                      size09PNsemibold(textColor: primaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: onDeleteTap,
                    child: Container(
                      height: SizeUtils().hp(4),
                      width: SizeUtils().wp(8),
                      decoration: BoxDecoration(
                        color: colorWhiteBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(AssetStrings.deleteCart),
                    ),
                  ),
                ],
              ),
              verticalSpace(8),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: Strings.partNumber + ' :- ',
                    style: size12PNregular(textColor: colorTextGrey)),
                TextSpan(
                    text: getCartProductData!.partNumber!,
                    style: size12PNregular(textColor: primaryColor)),
              ])),
              verticalSpace(8),
              Row(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: onPlusTap,
                        child: Container(
                          height: SizeUtils().hp(4),
                          width: SizeUtils().wp(8),
                          decoration: BoxDecoration(
                            color: colorWhiteBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(AssetStrings.plus),
                        ),
                      ),
                      horizontalSpace(12),
                      Text(
                        cartTotal!.toString(),
                        style: size15PNregular(),
                      ),
                      horizontalSpace(12),
                      InkWell(
                        onTap: onMinusTap,
                        child: Container(
                          height: SizeUtils().hp(4),
                          width: SizeUtils().wp(8),
                          decoration: BoxDecoration(
                            color: colorWhiteBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(AssetStrings.minus),
                        ),
                      ),
                    ],
                  ),
                  horizontalSpace(20),
                  cartTotal! < getCartProductData!.partMoq!
                      ? Expanded(
                          child: Text(
                            getDiscountOffer,
                            style: size10PNregular(),
                          ),
                        )
                      : Expanded(
                          child: Text(
                            Strings.congratulationDiscountMSG,
                            style: size10PNregular(textColor: primaryColor),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
