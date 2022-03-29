import 'package:buypartsonline/Screen/cartScreen/data/model/cart_detail_response_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/math_helper.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/service/network/network_string.dart';
import 'package:flutter/material.dart';

class PayoutPartCardWidget extends StatelessWidget {
  const PayoutPartCardWidget({this.cartProductData, Key? key})
      : super(key: key);
  final CartProductData? cartProductData;

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    double totalPrice = getTotalPrice(
      int.parse(cartProductData!.partMrp!),
      int.parse(cartProductData!.cartQuantity!) <
              int.parse(cartProductData!.partMoq!)
          ? int.parse(cartProductData!.partLessMoqDiscount!)
          : int.parse(cartProductData!.partMoreMoqDiscount!),
      int.parse(cartProductData!.cartQuantity!),
    );
    double partPrice = getPriceWithDiscount(
      int.parse(cartProductData!.partMrp!),
      int.parse(cartProductData!.cartQuantity!) <
              int.parse(cartProductData!.partMoq!)
          ? int.parse(cartProductData!.partLessMoqDiscount!)
          : int.parse(cartProductData!.partMoreMoqDiscount!),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                height: SizeUtils().hp(10),
                width: SizeUtils().wp(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageURL + cartProductData!.partImages!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: SizeUtils().hp(10),
                width: SizeUtils().wp(60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartProductData!.partName!,
                      overflow: TextOverflow.ellipsis,
                      style: size14PNregular(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cartProductData!.partNumber!,
                          style: size12PNregular(textColor: colorTextGrey),
                        ),
                        Text.rich(TextSpan(
                          children: [
                            TextSpan(
                                text: Strings.quantity,
                                style:
                                    size12PNregular(textColor: colorTextGrey)),
                            TextSpan(
                                text: cartProductData!.cartQuantity,
                                style: size16PNregular()),
                          ],
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '₹ ${totalPrice.toStringAsFixed(2)}',
                          style: size14PNregular(textColor: primaryColor),
                        ),
                        horizontalSpace(5),
                        Text(
                          '₹ $partPrice',
                          style: size12PNregular(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
