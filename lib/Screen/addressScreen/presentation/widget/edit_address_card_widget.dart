import 'package:buypartsonline/Screen/cartScreen/data/model/cart_address_response_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:flutter/material.dart';

class EditAddressCardWidget extends StatelessWidget {
  const EditAddressCardWidget(
      {this.cartAddressData,
      this.onRadioTap,
      this.onEditTap,
      this.onDeleteTap,
      Key? key})
      : super(key: key);

  final CartAddressData? cartAddressData;
  final VoidCallback? onRadioTap;
  final VoidCallback? onEditTap;
  final VoidCallback? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(4),
        ),
        width: SizeUtils().screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: onRadioTap,
              child: Image.asset(
                cartAddressData!.addressDefault == DigitString.one
                    ? AssetStrings.onRadio
                    : AssetStrings.offRadio,
              ),
            ),
            horizontalSpace(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartAddressData!.addressForName!,
                    style: size14PNregular(),
                  ),
                  verticalSpace(8),
                  Wrap(
                    spacing: 5,
                    children: [
                      Text(
                        cartAddressData!.addressName!,
                        style: size12PNregular(),
                      ),
                      Text(
                        cartAddressData!.addressPincode!,
                        style: size12PNregular(),
                      ),
                      Text(
                        cartAddressData!.addressState!,
                        style: size12PNregular(),
                      ),
                    ],
                  ),
                  verticalSpace(8),
                  Text(
                    cartAddressData!.addressPhoneNo!,
                    style: size12PNregular(),
                  ),
                  verticalSpace(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: onEditTap,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primaryColor),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 15),
                            child: Text(
                              Strings.edit,
                              style: size11PNregular(),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: onDeleteTap,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primaryColor),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 15),
                            child: Text(
                              Strings.delete,
                              style: size11PNregular(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
