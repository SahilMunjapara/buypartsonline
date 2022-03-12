import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/widget/header_stepper_widget.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/home_screen_drawer.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:flutter/material.dart';

class CartCheckoutScreen extends StatefulWidget {
  const CartCheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CartCheckoutScreen> createState() => _CartCheckoutScreenState();
}

class _CartCheckoutScreenState extends State<CartCheckoutScreen> {
  late GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      backgroundColor: colorWhiteBackground,
      key: _scaffoldKey,
      drawer: const HomeScreenDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          Strings.checkout,
          style: size23PNregular(textColor: colorWhite),
        ),
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Image.asset(AssetStrings.menu),
        ),
      ),
      body: Stack(
        children: [
          const BottomDesignBox(),
          Column(
            children: [
              const HeaderStepperWidget(currentStep: 4),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: SizeUtils().screenWidth,
                  decoration: const BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        verticalSpace(25),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.cartPayoutScreen);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: SizeUtils().hp(7),
                            width: SizeUtils().screenWidth,
                            child: Center(
                              child: Text(
                                Strings.payout,
                                style: size18PNregular(
                                  textColor: colorWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
