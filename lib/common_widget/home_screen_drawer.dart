import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/app_preferences/app_preferences.dart';
import 'package:buypartsonline/Utils/enums.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:flutter/material.dart';

class HomeScreenDrawer extends StatefulWidget {
  const HomeScreenDrawer({this.currentScreen, Key? key}) : super(key: key);
  final HomeScreenDrawerEnum? currentScreen;

  @override
  _HomeScreenDrawerState createState() => _HomeScreenDrawerState();
}

class _HomeScreenDrawerState extends State<HomeScreenDrawer> {
  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return SafeArea(
      bottom: false,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(30)),
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: primaryColor,
                height: SizeUtils().hp(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: SizeUtils().hp(10),
                      width: SizeUtils().wp(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorWhite,
                      ),
                      child: Image.asset(AssetStrings.drawerBag),
                    ),
                    Text(
                      Strings.appName,
                      style: size16PNregular(textColor: colorWhite),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      verticalSpace(34),
                      // drawerList(
                      //   image: AssetStrings.notificationDrawer,
                      //   text: Strings.notification,
                      //   ontap: () {
                      //     Navigator.pop(context);
                      //     Navigator.pushNamed(
                      //         context, Routes.notificationScreen);
                      //   },
                      // ),
                      // drawerList(
                      //   image: AssetStrings.searchByVehicle,
                      //   text: Strings.searchByvehicle,
                      //   ontap: () {
                      //     Navigator.pop(context);
                      //     showDialog(
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         return const SearchDialogBox();
                      //       },
                      //     );
                      //   },
                      // ),
                      // verticalSpace(34),
                      // drawerList(
                      //   image: AssetStrings.searchByVIN,
                      //   text: Strings.searchByVIN,
                      //   ontap: () {},
                      // ),
                      drawerList(
                        image: AssetStrings.home,
                        text: Strings.home,
                        ontap: () {
                          Navigator.of(context).pop();
                          if (widget.currentScreen !=
                              HomeScreenDrawerEnum.home) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              Routes.homeScreen,
                              (context) => false,
                            );
                          }
                        },
                      ),
                      verticalSpace(34),
                      drawerList(
                        image: AssetStrings.myOrders,
                        text: Strings.myOrders,
                        ontap: () {
                          Navigator.of(context).pop();
                          if (widget.currentScreen !=
                              HomeScreenDrawerEnum.myOrders) {
                            Navigator.of(context)
                                .pushNamed(Routes.myOrdersScreen);
                          }
                        },
                      ),
                      verticalSpace(34),
                      drawerList(
                        image: AssetStrings.myProfile,
                        text: Strings.myProfile,
                        ontap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, Routes.profileScreen);
                        },
                      ),
                      verticalSpace(34),
                      drawerList(
                        image: AssetStrings.addresses,
                        text: Strings.addresses,
                        ontap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, Routes.addressScreen);
                        },
                      ),
                      verticalSpace(34),
                      drawerList(
                        image: AssetStrings.billingGst,
                        // text: Strings.billingGst,
                        text: Strings.aboutUs,
                        ontap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, Routes.aboutUsScreen);
                        },
                      ),
                      verticalSpace(34),
                      drawerList(
                        image: AssetStrings.cart,
                        text: Strings.cart,
                        ontap: () {
                          Navigator.pop(context);
                          if (widget.currentScreen !=
                              HomeScreenDrawerEnum.cart) {
                            Navigator.pushNamed(context, Routes.cartScreen);
                          }
                        },
                      ),
                      // verticalSpace(34),
                      // drawerList(
                      //   image: AssetStrings.myGarage,
                      //   text: Strings.myGarage,
                      //   ontap: () {},
                      // ),
                      verticalSpace(34),
                      drawerList(
                        image: AssetStrings.legalAndOthers,
                        text: Strings.legalAndOthers,
                        ontap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(
                              context, Routes.legalAndOtherScreen);
                        },
                      ),
                      verticalSpace(34),
                      drawerList(
                        image: AssetStrings.assuredReturn,
                        text: Strings.returnPolicy,
                        ontap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(
                              context, Routes.returnPolicyScreen);
                        },
                      ),
                      verticalSpace(34),
                      drawerList(
                        image: AssetStrings.logout,
                        text: Strings.logout,
                        ontap: () async {
                          await AppPreference().clearSharedPreferences();
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.loginScreen, (route) => false);
                        },
                      ),
                      verticalSpace(34),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerList({String? image, String? text, VoidCallback? ontap}) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 23),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(image!),
            SizedBox(width: SizeUtils().wp(3)),
            Text(
              text!,
              style: size15PNregular(),
            ),
          ],
        ),
      ),
      onTap: ontap,
    );
  }
}
