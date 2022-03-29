import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/order_status_response_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:flutter/material.dart';

class OrderDetailStatusWidget extends StatelessWidget {
  const OrderDetailStatusWidget(
      {this.orderStatusData, this.onCancleOrderTap, Key? key})
      : super(key: key);
  final OrderStatusData? orderStatusData;
  final VoidCallback? onCancleOrderTap;

  @override
  Widget build(BuildContext context) {
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: Strings.orderNumber,
                          style: size14PNregular(),
                        ),
                        TextSpan(
                          text: '#${orderStatusData!.orderShipmentCode}',
                          style: size14PNregular(textColor: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    getOrderDate(orderStatusData!.orderDate!),
                    style: size14PNregular(),
                  ),
                ],
              ),
              verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: Strings.trackingNumber,
                          style: size12PNregular(textColor: colorGreyText),
                        ),
                        TextSpan(
                          text: 'IW3412544115',
                          style: size12PNregular(textColor: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: Strings.quantity,
                          style: size12PNregular(textColor: colorGreyText),
                        ),
                        TextSpan(
                          text: orderStatusData!.orderTotalQty,
                          style: size12PNregular(textColor: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.orderPartDetailScreen,
                          arguments: orderStatusData!.orderId);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: primaryColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 33),
                        child: Text(
                          Strings.details,
                          style: size13PNregular(textColor: primaryColor),
                        ),
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: Strings.orderTotalAmount,
                          style: size12PNregular(textColor: colorGreyText),
                        ),
                        TextSpan(
                          text: '₹ ${orderStatusData!.total.toString()}',
                          style: size12PNregular(textColor: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: orderStatusData!.orderStageDropDown ==
                    OrderStatusString.processing,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    verticalSpace(12),
                    GestureDetector(
                      onTap: onCancleOrderTap,
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Center(
                            child: Text(
                              Strings.cancleOrder,
                              style: size13PNregular(textColor: colorWhite),
                            ),
                          ),
                        ),
                      ),
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
