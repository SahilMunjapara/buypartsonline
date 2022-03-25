import 'package:buypartsonline/Screen/cartScreen/data/model/cart_address_response_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/brand_response_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/order_part_detail_response_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/presentation/widget/order_card_status_widget.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/app_preferences/app_preferences.dart';
import 'package:buypartsonline/Utils/app_preferences/prefrences_key.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/toast_msg.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersPartDetailScreen extends StatefulWidget {
  const MyOrdersPartDetailScreen({this.orderId, Key? key}) : super(key: key);
  final String? orderId;

  @override
  State<MyOrdersPartDetailScreen> createState() =>
      _MyOrdersPartDetailScreenState();
}

class _MyOrdersPartDetailScreenState extends State<MyOrdersPartDetailScreen> {
  MyOrderBloc myOrderBloc = MyOrderBloc();
  List<Order> orderPartDetailList = [];
  List<CartAddressData> addressList = [];
  List<BrandData> brandList = [];
  bool isLoading = false;
  String? orderAddressId;
  String? brandId;
  CartAddressData? orderAddress;
  BrandData? brandData;

  @override
  void initState() {
    super.initState();
    myOrderBloc.add(GetMyOrderBrandEvent());
    myOrderBloc.add(
      GetMyOrderAddressEvent(
        customerId: AppPreference().getStringData(PreferencesKey.userId),
      ),
    );
    myOrderBloc.add(GetMyOrderPartDetailEvent(orderId: widget.orderId));
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      backgroundColor: colorWhiteBackground,
      appBar: AppBar(
        title: Text(
          Strings.orderPartDetails,
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
          if (state is GetMyOrderPartDetailState) {
            state.responseModel.orderPartDetailData!.first.orders!.map((e) {
              orderPartDetailList.add(e);
            }).toList();
            orderAddressId = state.responseModel.orderPartDetailData!.first
                .otherDetail!.first.addressId;
            addressList.map((e) {
              if (orderAddressId == e.addressId) {
                orderAddress = e;
              }
            }).toList();
          }
          if (state is GetMyOrderAddressState) {
            state.responseModel.cartAddressData!.map((e) {
              addressList.add(e);
            }).toList();
          }
          if (state is GetMyOrderBrandState) {
            state.responseModel.brandData!.map((e) {
              brandList.add(e);
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
                      height: SizeUtils().hp(2),
                      width: SizeUtils().screenWidth,
                    ),
                    Expanded(
                      child: orderPartDetailList.isEmpty && !isLoading
                          ? Center(
                              child: Text(
                                Strings.noPartDetailAvailable,
                                style:
                                    size18PNregular(textColor: colorGreyText),
                              ),
                            )
                          : ListView.builder(
                              itemCount: orderPartDetailList.length,
                              itemBuilder: (context, index) {
                                brandId = orderPartDetailList[index].brandId;
                                brandList.map((e) {
                                  if (e.brandId == brandId) {
                                    brandData = e;
                                  }
                                }).toList();
                                return OrderCardStatusWidget(
                                  orderData: orderPartDetailList[index],
                                  cartAddressData: orderAddress,
                                  brandData: brandData,
                                );
                              },
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
}
