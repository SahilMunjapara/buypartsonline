import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter.bloc.dart';
import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter_state.dart';
import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/order_status_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/home_screen_drawer.dart';
import 'package:buypartsonline/common_widget/notification_badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  @override
  void dispose() {
    for (var item in orderStatusList) {
      if (item.id == 1) {
        item.isSelected = true;
      } else {
        item.isSelected = false;
      }
    }
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colorWhiteBackground,
      drawer: const HomeScreenDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          Strings.myOrders,
          style: size23PNregular(textColor: colorWhite),
        ),
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Image.asset(AssetStrings.menu),
        ),
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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.notificationScreen);
            },
            child: Image.asset(AssetStrings.notification),
          ),
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
                height: SizeUtils().hp(12),
                width: SizeUtils().screenWidth,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 10),
                  child: ListView.builder(
                    itemCount: orderStatusList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: GestureDetector(
                            onTap: () {
                              if (!orderStatusList[index].isSelected!) {
                                for (var item in orderStatusList) {
                                  item.isSelected = false;
                                }
                                setState(() {
                                  orderStatusList[index].isSelected =
                                      !orderStatusList[index].isSelected!;
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: orderStatusList[index].isSelected!
                                    ? colorWhite
                                    : colorSearch,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8),
                                child: Text(
                                  orderStatusList[index].statusName!,
                                  style: size13PNregular(
                                    textColor:
                                        orderStatusList[index].isSelected!
                                            ? primaryColor
                                            : colorWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
