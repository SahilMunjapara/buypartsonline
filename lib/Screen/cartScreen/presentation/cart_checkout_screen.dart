import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/cartScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_detail_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_payout_screen_param.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/default_address_detail_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/widget/header_stepper_widget.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/widget/payout_address_card_widget.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/widget/payout_part_card_widget.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/app_preferences/app_preferences.dart';
import 'package:buypartsonline/Utils/app_preferences/prefrences_key.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/home_screen_drawer.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/common_widget/toast_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCheckoutScreen extends StatefulWidget {
  const CartCheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CartCheckoutScreen> createState() => _CartCheckoutScreenState();
}

class _CartCheckoutScreenState extends State<CartCheckoutScreen> {
  CartBloc cartBloc = CartBloc();
  late GlobalKey<ScaffoldState> _scaffoldKey;
  double totalAmount = 0;
  double deliveryCharge = 0;
  List<CartProductData> cartProductData = [];
  List<DefaultAddressData> defaultAddressData = [];
  bool isLoading = false;
  int courierId = 0;
  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    cartBloc.add(
      CartTotalItemEvent(
          userId: AppPreference().getStringData(PreferencesKey.userId)),
    );
    cartBloc.add(
      GetDefaultAddresEvent(
          customerId: AppPreference().getStringData(PreferencesKey.userId)),
    );
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
      body: BlocListener(
        bloc: cartBloc,
        listener: (context, state) {
          if (state is CartLoadingBeginState) {
            isLoading = true;
          }

          if (state is CartLoadingEndState) {
            isLoading = false;
          }
          if (state is CartTotalItemState) {
            totalAmount = double.parse(
                state.responseModel!.cartData!.first.subTotal!.toString());
            deliveryCharge = double.parse(state
                .responseModel!.cartData!.first.deliverycharge!
                .toString());
            courierId = state.responseModel!.cartData!.first.courierId!;
            cartProductData =
                state.responseModel!.cartData!.first.cartProductData!;
          }

          if (state is DefaultAddressDetailState) {
            defaultAddressData
                .add(state.responseModel.defaultAddressData!.first);
          }
        },
        child: BlocBuilder(
          bloc: cartBloc,
          builder: (context, state) {
            return Stack(
              children: [
                const BottomDesignBox(),
                Column(
                  children: [
                    const HeaderStepperWidget(currentStep: 4),
                    cartProductData.isEmpty && !isLoading
                        ? const Expanded(
                            child: Center(
                              child: Text(Strings.emptyCartMSG),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: cartProductData.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    PayoutPartCardWidget(
                                      cartProductData: cartProductData[index],
                                    ),
                                    Visibility(
                                      visible: defaultAddressData.isNotEmpty &&
                                          index == cartProductData.length - 1,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          child: SizedBox(
                                            width: SizeUtils().screenWidth,
                                            child: defaultAddressData.isEmpty &&
                                                    !isLoading
                                                ? const Center(
                                                    child: Text(Strings
                                                        .addressNotAvailable),
                                                  )
                                                : defaultAddressData.isEmpty
                                                    ? Container()
                                                    : PayoutAddressCardWidget(
                                                        defaultAddressData:
                                                            defaultAddressData
                                                                .first,
                                                      ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                    // verticalSpace(8),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 15),
                    //   child: SizedBox(
                    //     width: SizeUtils().screenWidth,
                    //     child: defaultAddressData.isEmpty && !isLoading
                    //         ? const Center(
                    //             child: Text(Strings.addressNotAvailable),
                    //           )
                    //         : defaultAddressData.isEmpty
                    //             ? Container()
                    //             : PayoutAddressCardWidget(
                    //                 defaultAddressData:
                    //                     defaultAddressData.first,
                    //               ),
                    //   ),
                    // ),
                    // verticalSpace(8),
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
                              verticalSpace(12),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        cartProductData.isEmpty
                                            ? Strings.items
                                            : '${cartProductData.length} ${Strings.items}',
                                        style: size15PNregular(),
                                      ),
                                      Text(
                                        '₹ ${totalAmount.toString()}',
                                        style: size15PNregular(),
                                      ),
                                    ],
                                  ),
                                  verticalSpace(5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        Strings.deliveryCharge,
                                        style: size15PNregular(),
                                      ),
                                      Text(
                                        '₹ ${deliveryCharge.toString()}',
                                        style: size15PNregular(),
                                      ),
                                    ],
                                  ),
                                  verticalSpace(12),
                                  horizontalDivider(
                                      color: primaryColor, thickness: 1),
                                  verticalSpace(5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        Strings.summary,
                                        style: size15PNregular(
                                            textColor: primaryColor),
                                      ),
                                      Text(
                                        '₹ ${(totalAmount + deliveryCharge).toString()}',
                                        style: size15PNregular(
                                            textColor: primaryColor),
                                      ),
                                    ],
                                  ),
                                  verticalSpace(12),
                                  GestureDetector(
                                    onTap: () {
                                      if (!isLoading) {
                                        if (cartProductData.isNotEmpty &&
                                            defaultAddressData.isNotEmpty) {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            Routes.cartPayoutScreen,
                                            arguments: CartPayoutScreenParam(
                                              courierId: courierId,
                                              customerId: AppPreference()
                                                  .getStringData(
                                                      PreferencesKey.userId),
                                              defaultAddressId:
                                                  defaultAddressData
                                                      .first.addressId,
                                              deliveryCharge: deliveryCharge,
                                              totalPrice: totalAmount,
                                              customerPhoneNumber:
                                                  defaultAddressData
                                                      .first.addressPhoneNo,
                                            ),
                                          );
                                        } else {
                                          if (cartProductData.isNotEmpty) {
                                            ShowToast.toastMsg(ToastString
                                                .pleaseSelectOneProductForCheckout);
                                          }
                                          if (defaultAddressData.isNotEmpty) {
                                            ShowToast.toastMsg(ToastString
                                                .pleaseSelectDefaultAddress);
                                          }
                                        }
                                      }
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: isLoading,
                  child: SizedBox(
                    height: SizeUtils().screenHeight,
                    width: SizeUtils().screenWidth,
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
