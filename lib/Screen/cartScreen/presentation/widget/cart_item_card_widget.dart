import 'package:buypartsonline/Screen/cartScreen/data/model/cart_detail_response_model.dart';
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
      {this.cartProductData,
      this.cartTotal,
      this.onDeleteTap,
      this.onPlusTap,
      this.onMinusTap,
      Key? key})
      : super(key: key);
  final CartProductData? cartProductData;
  final int? cartTotal;
  final VoidCallback? onMinusTap;
  final VoidCallback? onPlusTap;
  final VoidCallback? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    double totalPrice = getTotalPrice(
      int.parse(cartProductData!.partMrp!),
      cartTotal! < int.parse(cartProductData!.partMoq!)
          ? int.parse(cartProductData!.partLessMoqDiscount!)
          : int.parse(cartProductData!.partMoreMoqDiscount!),
      cartTotal!,
    );
    double partPrice = getPriceWithDiscount(
      int.parse(cartProductData!.partMrp!),
      cartTotal! < int.parse(cartProductData!.partMoq!)
          ? int.parse(cartProductData!.partLessMoqDiscount!)
          : int.parse(cartProductData!.partMoreMoqDiscount!),
    );
    String getDiscountOffer = getQtyOfferString(
      cartTotal!,
      int.parse(cartProductData!.partMoq!),
      int.parse(cartProductData!.partMoreMoqDiscount!),
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
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: SizeUtils().hp(10),
                    width: SizeUtils().wp(20),
                    decoration: BoxDecoration(
                      color: colorWhiteBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageURL + cartProductData!.partImages!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  horizontalSpace(10),
                  SizedBox(
                    height: SizeUtils().hp(10),
                    width: SizeUtils().wp(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartProductData!.partName!,
                          style: size14PNregular(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          cartProductData!.brandName!,
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
                            )
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
                  cartTotal! < int.parse(cartProductData!.partMoq!)
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
