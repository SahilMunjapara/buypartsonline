import 'package:badges/badges.dart';
import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/homeScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/homeScreen/data/model/home_banner_response_model.dart';
import 'package:buypartsonline/Screen/homeScreen/data/model/home_category_response_model.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_screen_param.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/app_preferences/app_preferences.dart';
import 'package:buypartsonline/Utils/app_preferences/prefrences_key.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/banner_carousel.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/home_screen_drawer.dart';
import 'package:buypartsonline/Screen/searchDialogScreen/presentation/search_dialog.dart';
import 'package:buypartsonline/common_widget/shimmer.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/service/network/network_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

int counter = 0;

class _HomeScreenState extends State<HomeScreen> {
  late GlobalKey<ScaffoldState> _scaffoldKey;
  HomeBloc homeBloc = HomeBloc();

  HomeBannerResponseModel homeBannerResponseModel = HomeBannerResponseModel(
      bannerData: [BannerData(banner: [], baseUrl: [])]);
  HomeCategoryResponseModel homeCategoryResponseModel =
      HomeCategoryResponseModel(categoryData: []);
  bool isBannerLoading = true;
  bool isCategoryLoading = true;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    homeBloc.add(HomeCartCountEvent(
        userId: AppPreference().getStringData(PreferencesKey.userId)));
    homeBloc.add(HomeScreenBannerEvent());
    homeBloc.add(HomeScreenCategoryEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.cartScreen).then((value) {
                homeBloc.add(
                  HomeCartCountEvent(
                    userId:
                        AppPreference().getStringData(PreferencesKey.userId),
                  ),
                );
              });
            },
            child: Badge(
              position: BadgePosition.topStart(),
              badgeColor: colorGreen,
              animationDuration: const Duration(milliseconds: 300),
              animationType: BadgeAnimationType.fade,
              badgeContent: Text(
                counter.toString(),
                style: size10PNsemibold(textColor: colorWhite),
              ),
              child: Image.asset(AssetStrings.cartAppbar),
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
      body: BlocListener(
        bloc: homeBloc,
        listener: (context, state) {
          if (state is HomeBannerLoadingBeginState) {
            isBannerLoading = true;
          }
          if (state is HomeCategoryLoadingBeginState) {
            isCategoryLoading = true;
          }
          if (state is HomeBannerLoadingEndState) {
            isBannerLoading = false;
          }
          if (state is HomeCategoryLoadingEndState) {
            isCategoryLoading = false;
          }
          if (state is HomeScreenBannerState) {
            homeBannerResponseModel = state.responseModel;
          }
          if (state is HomeScreenCategoryState) {
            homeCategoryResponseModel = state.responseModel;
          }
          if (state is HomeCartCountState) {
            setState(
                () => counter = state.responseModel.cartData!.first.totalCart!);
          }
        },
        child: BlocBuilder(
          bloc: homeBloc,
          builder: (context, state) {
            return Stack(
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
                      height: SizeUtils().hp(5),
                      width: SizeUtils().screenWidth,
                    ),
                    verticalSpace(20),
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
                                  return const SearchDialogBox();
                                },
                              );
                            },
                            child: Container(
                              width: SizeUtils().screenWidth,
                              height: SizeUtils().hp(7),
                              decoration: BoxDecoration(
                                color: colorWhite,
                                border:
                                    Border.all(color: primaryColor, width: 2),
                                borderRadius: BorderRadius.circular(80),
                              ),
                              child: Center(
                                child: Text(
                                  Strings.searchByvehicle,
                                  style:
                                      size16PNregular(textColor: primaryColor),
                                ),
                              ),
                            ),
                          ),
                          verticalSpace(20),
                          isBannerLoading
                              ? AspectRatio(
                                  aspectRatio: 2.4,
                                  child: SizedBox(
                                    child: Center(
                                      child: Shimmer.fromColors(
                                        baseColor: const Color(0xFFE0E0E0),
                                        highlightColor: const Color(0xFFF5F5F5),
                                        enabled: true,
                                        child: Container(
                                          color: colorWhite,
                                          height: SizeUtils().hp(20),
                                          width: 1000,
                                        ),
                                      ),
                                      // child: CircularProgressIndicator(
                                      //   valueColor:
                                      //       AlwaysStoppedAnimation<Color>(
                                      //     primaryColor,
                                      //   ),
                                      // ),
                                    ),
                                  ),
                                )
                              : BannerCarousel(
                                  autoPlay: true,
                                  pagination: true,
                                  passiveIndicator: colorPassiveIndicator,
                                  activeIndicator: primaryColor,
                                  viewportFraction: 1.0,
                                  aspectRatio: 2,
                                  items: homeBannerResponseModel
                                      .bannerData!.first.banner!
                                      .map((banner) {
                                    return Container(
                                      margin: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0)),
                                        child: Image.network(
                                          '$imageURL${banner.bannerImage}',
                                          fit: BoxFit.contain,
                                          width: 1000.0,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                          verticalSpace(6),
                          Text(
                            Strings.searchByCategory,
                            style: size16PNregular(textColor: primaryColor),
                          ),
                          verticalSpace(8),
                          isCategoryLoading
                              ? SizedBox(
                                  height: SizeUtils().hp(23),
                                  width: SizeUtils().screenWidth,
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        primaryColor,
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: SizeUtils().hp(28),
                                  child: homeCategoryResponseModel
                                          .categoryData!.isEmpty
                                      ? Center(
                                          child: Text(
                                            Strings.categoryDataNotAvailable,
                                            style: size15PNmedium(),
                                          ),
                                        )
                                      : ListView.builder(
                                          itemCount: homeCategoryResponseModel
                                              .categoryData!.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            CategoryData category =
                                                homeCategoryResponseModel
                                                    .categoryData![index];
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    Routes.modelViewScreen,
                                                    arguments:
                                                        ModelViewScreenParam(
                                                      categoryId:
                                                          category.categoryId ??
                                                              undefined,
                                                      modelLineId: undefined,
                                                      category: category
                                                              .categoryName ??
                                                          undefined,
                                                      isFromSearchDialog: false,
                                                    ));
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10, bottom: 5),
                                                child: Container(
                                                  height: SizeUtils().hp(23),
                                                  width: SizeUtils()
                                                          .verticalBlockSize! *
                                                      23,
                                                  decoration: BoxDecoration(
                                                    color: colorWhite,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: colorGrey
                                                            .withOpacity(0.2),
                                                        spreadRadius: 1,
                                                        blurRadius: 3,
                                                        offset:
                                                            const Offset(0, 5),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 17,
                                                            right: 17),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Container(
                                                          height: SizeUtils()
                                                              .hp(18),
                                                          width: SizeUtils()
                                                              .wp(30),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color:
                                                                colorWhiteBackground,
                                                          ),
                                                          child: category.categoryImage ==
                                                                      "" ||
                                                                  category.categoryImage ==
                                                                      Strings
                                                                          .noImage
                                                              ? Image.asset(
                                                                  AssetStrings
                                                                      .noImage)
                                                              : Image.network(
                                                                  '$imageURL${category.categoryImage}'),
                                                        ),
                                                        Text(
                                                          category
                                                              .categoryName!,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              size14PNregular(),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                ),
                          verticalSpace(8),
                          // Text(
                          //   Strings.whyChooseProducts,
                          //   style: size16PNregular(textColor: primaryColor),
                          // ),
                          // verticalSpace(8),
                          // originalProductContainer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


/// HOME PAGE SEARCH BAR WITH APPBAR UI


 //   child: Center(
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       children: [
                    //         Container(
                    //           height: SizeUtils().hp(5.5),
                    //           width: SizeUtils().wp(79),
                    //           decoration: BoxDecoration(
                    //             color: colorSearch,
                    //             borderRadius: BorderRadius.circular(12),
                    //           ),
                    //           child: Align(
                    //             alignment: Alignment.centerLeft,
                    //             child: Padding(
                    //               padding: const EdgeInsets.only(left: 16),
                    //               child: Text(
                    //                 Strings.searchHere,
                    //                 style:
                    //                     size16PNregular(textColor: colorWhite),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //         Container(
                    //           height: SizeUtils().hp(5.5),
                    //           width: SizeUtils().wp(11),
                    //           decoration: BoxDecoration(
                    //             color: colorSearch,
                    //             borderRadius: BorderRadius.circular(12),
                    //           ),
                    //           child: Center(
                    //             child: Image.asset(AssetStrings.search),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
