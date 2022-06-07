import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter_bloc.dart';
import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter_state.dart';
import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/notification_badge_widget.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      backgroundColor: colorWhiteBackground,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          Strings.myNotification,
          style: size23PNregular(textColor: colorWhite),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: colorWhite,
          ),
        ),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.cartScreen);
            },
            child: BlocBuilder<CartCounterBloc, CartCounterTotalState>(
              builder: (context, state) {
                return NotificationBadge(state: state);
              },
            ),
          ),
          horizontalSpace(15)
        ],
      ),
      body: Stack(
        children: [
          const BottomDesignBox(),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(SizeUtils().wp(10)),
                  ),
                ),
                height: SizeUtils().hp(2),
                width: SizeUtils().screenWidth,
              ),
              verticalSpace(20),
              Expanded(
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Card(
                        elevation: 1,
                        child: Container(
                          height: SizeUtils().hp(8),
                          width: SizeUtils().screenWidth,
                          color: colorWhite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: SizeUtils().hp(6),
                                width: SizeUtils().wp(12),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    AssetStrings.repairKit,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeUtils().wp(50),
                                child: Text(
                                  'Order Placed, Arrived in 1 Day',
                                  style: size13PNregular(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '10 min ago',
                                style: size10PNregular(textColor: primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
