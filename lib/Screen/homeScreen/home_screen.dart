import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/appbar.dart';
import 'package:buypartsonline/common_widget/banner_carousel.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/custom_dropdown.dart';
import 'package:buypartsonline/common_widget/custom_textfield_widget.dart';
import 'package:buypartsonline/common_widget/home_screen_drawer.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GlobalKey<ScaffoldState> _scaffoldKey;

  String? _selectedValue;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  final List<String> imageList = [
    AssetStrings.banner,
    AssetStrings.banner,
    AssetStrings.banner,
    AssetStrings.banner,
    AssetStrings.banner,
    AssetStrings.banner,
    AssetStrings.banner,
  ];

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorWhiteBackground,
      key: _scaffoldKey,
      drawer: const HomeScreenDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          Strings.search,
          style: size23PNregular(textColor: colorWhite),
        ),
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Image.asset(AssetStrings.menu),
        ),
        actions: [
          GestureDetector(child: Image.asset(AssetStrings.cartAppbar)),
          GestureDetector(child: Image.asset(AssetStrings.notification)),
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
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: SizeUtils().hp(5.5),
                        width: SizeUtils().wp(79),
                        decoration: BoxDecoration(
                          color: colorSearch,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              Strings.searchHere,
                              style: size16PNregular(textColor: colorWhite),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: SizeUtils().hp(5.5),
                        width: SizeUtils().wp(11),
                        decoration: BoxDecoration(
                          color: colorSearch,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Image.asset(AssetStrings.search),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(8),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                insetPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: SizeUtils().hp(7),
                                      width: SizeUtils().screenWidth,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: primaryColor,
                                      ),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Text(
                                              Strings.searchByvehicle,
                                              textAlign: TextAlign.center,
                                              style: size18PNregular(
                                                  textColor: colorWhite),
                                            ),
                                          ),
                                          Positioned(
                                            right: 10,
                                            top: 7,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: SizeUtils().hp(5),
                                                width: SizeUtils().wp(10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: colorWhite,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Icon(
                                                  Icons.close,
                                                  color: colorWhite,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  size: 26,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    verticalSpace(13),
                                    SizedBox(
                                        height: SizeUtils().hp(55),
                                        child: ListView()),
                                    verticalSpace(15),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 13, right: 13),
                                      height: SizeUtils().hp(7),
                                      width: SizeUtils().wp(80),
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          Strings.searchParts,
                                          style: size16PNregular(
                                              textColor: colorWhite),
                                        ),
                                      ),
                                    ),
                                    verticalSpace(15),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Container(
                        width: SizeUtils().screenWidth,
                        height: SizeUtils().hp(7),
                        decoration: BoxDecoration(
                          color: colorWhite,
                          border: Border.all(color: primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(80),
                        ),
                        child: Center(
                          child: Text(
                            Strings.searchByvehicle,
                            style: size16PNregular(textColor: primaryColor),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(8),
                    BannerCarousel(
                      autoPlay: true,
                      pagination: true,
                      passiveIndicator: colorPassiveIndicator,
                      activeIndicator: primaryColor,
                      viewportFraction: 1.0,
                      aspectRatio: 2.4,
                      items: imageList.map((assetStrings) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            child: Image.asset(
                              assetStrings,
                              fit: BoxFit.fill,
                              width: 1000.0,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    verticalSpace(8),
                    Text(
                      Strings.searchByCategory,
                      style: size16PNregular(textColor: primaryColor),
                    ),
                    verticalSpace(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: SizeUtils().hp(23),
                          width: SizeUtils().verticalBlockSize! * 23,
                          decoration: BoxDecoration(
                            color: colorWhite,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: colorGrey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 17, right: 17),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: SizeUtils().hp(15),
                                  width: SizeUtils().screenWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: colorWhiteBackground,
                                  ),
                                  child:
                                      Image.asset(AssetStrings.customerService),
                                ),
                                Text(
                                  Strings.maintenaceServiceParts,
                                  textAlign: TextAlign.center,
                                  style: size14PNregular(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: SizeUtils().hp(23),
                          width: SizeUtils().verticalBlockSize! * 23,
                          decoration: BoxDecoration(
                            color: colorWhite,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: colorGrey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 17, right: 17),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: SizeUtils().hp(15),
                                  width: SizeUtils().screenWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: colorWhiteBackground,
                                  ),
                                  child:
                                      Image.asset(AssetStrings.airConditioner),
                                ),
                                Text(
                                  Strings.airConditioning,
                                  textAlign: TextAlign.center,
                                  style: size14PNregular(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(8),
                    Text(
                      Strings.whyChooseProducts,
                      style: size16PNregular(textColor: primaryColor),
                    ),
                    verticalSpace(8),
                    Container(
                      height: SizeUtils().hp(12),
                      width: SizeUtils().screenWidth,
                      decoration: BoxDecoration(
                        color: colorWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Container(
                              height: SizeUtils().hp(10),
                              width: SizeUtils().wp(20),
                              decoration: BoxDecoration(
                                color: colorWhiteBackground,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                AssetStrings.premiumQuality,
                              ),
                            ),
                            horizontalSpace(13),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.originalProduct,
                                  style:
                                      size15PNregular(textColor: primaryColor),
                                ),
                                Text(
                                  Strings.originalProductDescription,
                                  style: size12PNregular(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
