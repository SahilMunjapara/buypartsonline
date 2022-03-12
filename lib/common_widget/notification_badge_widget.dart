import 'package:badges/badges.dart';
import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter_state.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({this.state, Key? key}) : super(key: key);
  final CartCounterTotalState? state;

  @override
  Widget build(BuildContext context) {
    return Badge(
      position: BadgePosition.topStart(),
      badgeColor: colorGreen,
      animationDuration: const Duration(milliseconds: 300),
      animationType: BadgeAnimationType.fade,
      badgeContent: Text(
        state!.responseModel!.counterTotalData!.first.toString(),
        style: size10PNsemibold(textColor: colorWhite),
      ),
      child: Image.asset(AssetStrings.cartAppbar),
    );
  }
}
