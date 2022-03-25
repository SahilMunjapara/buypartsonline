import 'package:buypartsonline/Screen/cartScreen/data/model/default_address_detail_response_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:flutter/material.dart';

class PayoutAddressCardWidget extends StatelessWidget {
  const PayoutAddressCardWidget({this.defaultAddressData, Key? key})
      : super(key: key);
  final DefaultAddressData? defaultAddressData;

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.addresses,
                style: size10PNregular(textColor: primaryColor),
              ),
              verticalSpace(8),
              Text(
                defaultAddressData!.addressForName!,
                style: size14PNregular(),
              ),
              verticalSpace(3),
              Wrap(
                spacing: 5,
                children: [
                  Text(
                    defaultAddressData!.addressName!,
                    style: size12PNregular(),
                  ),
                  Text(
                    defaultAddressData!.addressPincode!,
                    style: size12PNregular(),
                  ),
                  Text(
                    defaultAddressData!.addressState!,
                    style: size12PNregular(),
                  ),
                ],
              ),
              verticalSpace(3),
              Text(
                defaultAddressData!.addressPhoneNo!,
                style: size12PNregular(),
              ),
            ],
          ),
        ));
  }
}
