import 'package:buypartsonline/Screen/cartScreen/data/model/cart_address_response_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/brand_response_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/order_part_detail_response_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/service/network/network_string.dart';
import 'package:flutter/material.dart';

class OrderCardStatusWidget extends StatelessWidget {
  const OrderCardStatusWidget(
      {this.orderData, this.cartAddressData, this.brandData, Key? key})
      : super(key: key);
  final Order? orderData;
  final CartAddressData? cartAddressData;
  final BrandData? brandData;
  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: SizeUtils().hp(12),
                    width: SizeUtils().wp(24),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imageURL + orderData!.partImages!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeUtils().hp(12),
                    width: SizeUtils().wp(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          orderData!.partName!,
                          style: size15PNregular(),
                        ),
                        Text(brandData!.brandName!,
                            style: size12PNregular(textColor: colorTextGrey)),
                        Row(
                          children: [
                            Text('₹ ${orderData!.orderdetailProductSrp}',
                                style:
                                    size14PNregular(textColor: primaryColor)),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: primaryColor.withOpacity(0.1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 1),
                                child: Text(
                                  int.parse(orderData!.orderdetailQty!) >= 5
                                      ? Strings.part10PerDiscountText
                                      : Strings.part5PerDiscountText,
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
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: Strings.quantity,
                            style: size12PNregular(textColor: colorTextGrey)),
                        TextSpan(
                          text: orderData!.orderdetailQty,
                          style: size16PNregular(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpace(12),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: Strings.partNumber + ' :- ',
                    style: size12PNregular(textColor: colorTextGrey)),
                TextSpan(
                    text: orderData!.partNumber!,
                    style: size12PNregular(textColor: primaryColor)),
              ])),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: Strings.orderNumber,
                    style: size12PNregular(textColor: colorTextGrey)),
                TextSpan(
                    text: orderData!.orderIdReference!,
                    style: size12PNregular(textColor: primaryColor)),
              ])),
              verticalSpace(10),
              horizontalDivider(color: colorTextGrey, height: 1, thickness: 1),
              verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.orderSubTotal,
                    style: size12PNregular(textColor: colorTextGrey),
                  ),
                  Text(
                    '₹ ${((double.parse(orderData!.orderdetailQty!) * double.parse(orderData!.orderdetailProductSrp!))).toString()}',
                    style: size15PNregular(textColor: primaryColor),
                  ),
                ],
              ),
              verticalSpace(10),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: Strings.orderAddress,
                    style: size12PNregular(textColor: colorTextGrey)),
                TextSpan(
                  text: cartAddressData!.addressName! +
                      ' ' +
                      cartAddressData!.addressState! +
                      ' - ' +
                      cartAddressData!.addressPincode!,
                  style: size13PNregular(),
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
