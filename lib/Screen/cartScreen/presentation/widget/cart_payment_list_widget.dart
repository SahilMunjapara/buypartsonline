import 'package:buypartsonline/Screen/cartScreen/data/model/cart_payment_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:flutter/material.dart';

class CartPaymentListWidget extends StatelessWidget {
  const CartPaymentListWidget(
      {this.cartPaymentMethod, this.onRadioButtonTap, Key? key})
      : super(key: key);
  final CartPaymentMethodModel? cartPaymentMethod;
  final VoidCallback? onRadioButtonTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        color: colorWhite,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cartPaymentMethod!.paymentType!,
                style: size16PNregular(),
              ),
              GestureDetector(
                onTap: onRadioButtonTap,
                // if (!e.isSelected!) {
                //   for (var item in paymentMethodList) {
                //     item.isSelected = false;
                //   }
                //   setState(() {
                //     e.isSelected = !e.isSelected!;
                //   });
                // }

                child: cartPaymentMethod!.isSelected!
                    ? Image.asset(AssetStrings.onRadio)
                    : Image.asset(AssetStrings.offRadio),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
