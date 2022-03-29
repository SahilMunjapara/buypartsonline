import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter.bloc.dart';
import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter_state.dart';
import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/myOrderScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/order_status_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/order_status_response_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/presentation/widget/order_detail_card_widget.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/app_preferences/app_preferences.dart';
import 'package:buypartsonline/Utils/app_preferences/prefrences_key.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/home_screen_drawer.dart';
import 'package:buypartsonline/common_widget/notification_badge_widget.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/common_widget/toast_msg.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  MyOrderBloc myOrderBloc = MyOrderBloc();
  late GlobalKey<ScaffoldState> _scaffoldKey;
  int tabIndex = 1;
  bool isLoading = false;
  List<OrderStatusData> progressOrderList = [];
  List<OrderStatusData> completeOrderList = [];
  List<OrderStatusData> returnOrderList = [];
  List<OrderStatusData> cancleOrderList = [];

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    myOrderBloc.add(
      GetMyOrderStatusEvent(
          customerId: AppPreference().getStringData(PreferencesKey.userId)),
    );
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
          horizontalSpace(10),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.pushNamed(context, Routes.notificationScreen);
          //   },
          //   child: Image.asset(AssetStrings.notification),
          // ),
        ],
      ),
      body: BlocListener(
        bloc: myOrderBloc,
        listener: (context, state) {
          if (state is MyOrderLoadingBeginState) {
            isLoading = true;
          }
          if (state is MyOrderLoadingEndState) {
            isLoading = false;
          }
          if (state is GetMyOrderStatusState) {
            progressOrderList.clear();
            cancleOrderList.clear();
            completeOrderList.clear();
            returnOrderList.clear();
            state.responseModel.orderStatusData!.map((e) {
              if (e.orderStageDropDown == OrderStatusString.processing) {
                progressOrderList.add(e);
              }
              if (e.orderStageDropDown == OrderStatusString.cancle) {
                cancleOrderList.add(e);
              }
              if (e.orderStageDropDown == OrderStatusString.completed) {
                completeOrderList.add(e);
              }
              if (e.orderStageDropDown == OrderStatusString.returned) {
                returnOrderList.add(e);
              }
            }).toList();
          }
          if (state is MyOrderErrorState) {
            AppException exception = state.exception;
            ShowToast.toastMsg(exception.message);
          }
        },
        child: BlocBuilder(
          bloc: myOrderBloc,
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
                                        tabIndex = orderStatusList[index].id!;
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
                    verticalSpace(10),
                    Visibility(
                      visible: tabIndex == 1,
                      child: Expanded(
                        child: progressOrderList.isEmpty && !isLoading
                            ? Center(
                                child: Text(
                                  Strings.noInProgressOrders,
                                  style:
                                      size18PNregular(textColor: colorTextGrey),
                                ),
                              )
                            : ListView.builder(
                                itemCount: progressOrderList.length,
                                itemBuilder: (context, index) {
                                  return OrderDetailStatusWidget(
                                    orderStatusData: progressOrderList[index],
                                    onCancleOrderTap: () {
                                      // onCancleOrderButtonTap(
                                      //   progressOrderList[index],
                                      // );
                                    },
                                  );
                                },
                              ),
                      ),
                    ),
                    Visibility(
                      visible: tabIndex == 2,
                      child: Expanded(
                        child: completeOrderList.isEmpty && !isLoading
                            ? Center(
                                child: Text(
                                  Strings.noCompletedOrders,
                                  style:
                                      size18PNregular(textColor: colorTextGrey),
                                ),
                              )
                            : ListView.builder(
                                itemCount: completeOrderList.length,
                                itemBuilder: (context, index) {
                                  return OrderDetailStatusWidget(
                                    orderStatusData: completeOrderList[index],
                                  );
                                },
                              ),
                      ),
                    ),
                    Visibility(
                      visible: tabIndex == 3,
                      child: Expanded(
                        child: returnOrderList.isEmpty && !isLoading
                            ? Center(
                                child: Text(
                                  Strings.noReturnedOrders,
                                  style:
                                      size18PNregular(textColor: colorTextGrey),
                                ),
                              )
                            : ListView.builder(
                                itemCount: returnOrderList.length,
                                itemBuilder: (context, index) {
                                  return OrderDetailStatusWidget(
                                    orderStatusData: returnOrderList[index],
                                  );
                                },
                              ),
                      ),
                    ),
                    Visibility(
                      visible: tabIndex == 4,
                      child: Expanded(
                        child: cancleOrderList.isEmpty && !isLoading
                            ? Center(
                                child: Text(
                                  Strings.noCancelledOrders,
                                  style:
                                      size18PNregular(textColor: colorTextGrey),
                                ),
                              )
                            : ListView.builder(
                                itemCount: cancleOrderList.length,
                                itemBuilder: (context, index) {
                                  return OrderDetailStatusWidget(
                                    orderStatusData: cancleOrderList[index],
                                  );
                                },
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 25.0),
                      child: GestureDetector(
                        onTap: () {
                          if (!isLoading) {
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          height: SizeUtils().hp(7),
                          width: SizeUtils().screenWidth,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              Strings.continueShopping,
                              style: size20PNRegular(textColor: colorWhite),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: isLoading,
                  child: SizedBox(
                    height: SizeUtils().hp(75),
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void onCancleOrderButtonTap(OrderStatusData orderStatusData) {
    if (!isLoading) {
      myOrderBloc.add(CancleMyOrderEvent(
        customerId: orderStatusData.customerId,
        orderId: orderStatusData.orderId,
      ));
      myOrderBloc
          .add(GetMyOrderStatusEvent(customerId: orderStatusData.customerId));
    }
  }
}
