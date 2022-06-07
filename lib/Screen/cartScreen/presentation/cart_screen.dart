import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter_bloc.dart';
import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter_event.dart';
import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/cartScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_detail_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/get_cart_product_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/widget/cart_item_card_widget.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/widget/header_stepper_widget.dart';
import 'package:buypartsonline/Screen/modelViewScreen/presentation/model_view_screen.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/app_preferences/app_preferences.dart';
import 'package:buypartsonline/Utils/app_preferences/prefrences_key.dart';
import 'package:buypartsonline/Utils/enums.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/home_screen_drawer.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/common_widget/toast_msg.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late GlobalKey<ScaffoldState> _scaffoldKey;
  CartBloc cartBloc = CartBloc();
  double totalAmount = 0;
  double totalSaving = 0;
  List<CartProductData> cartProductData = [];
  List<GetCartProductData> getCartProductData = [];
  bool isLoading = false;
  String? currentPartId;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    // cartBloc.add(
    //   CartAddressEvent(
    //       customerId: AppPreference().getStringData(PreferencesKey.userId)),
    // );
    refreshCartData();
    // cartBloc.add(
    //   CartTotalItemEvent(
    //     userId: AppPreference().getStringData(PreferencesKey.userId),
    //   ),
    // );
    super.initState();
  }

  void refreshCartData() {
    cartBloc.add(GetCartProductEvent(
        customerId: AppPreference().getStringData(PreferencesKey.userId)));
    cartBloc.add(GetCartSummaryEvent(
        customerId: AppPreference().getStringData(PreferencesKey.userId)));
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      backgroundColor: colorWhiteBackground,
      key: _scaffoldKey,
      drawer: const HomeScreenDrawer(
        currentScreen: HomeScreenDrawerEnum.cart,
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          Strings.myCart,
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
            BlocProvider.of<CartCounterBloc>(context).add(CartCounterTotalEvent(
              customerId: AppPreference().getStringData(PreferencesKey.userId),
            ));
            isLoading = false;
          }
          if (state is CartItemRemoveState) {
            for (var item in modelPartList) {
              if (item.partId == currentPartId) {
                item.isCart = false;
              }
            }
          }
          if (state is CartTotalItemState) {
            totalAmount = double.parse(
                state.responseModel!.cartData!.first.total!.toString());
            totalSaving = double.parse(
                state.responseModel!.cartData!.first.save!.toString());
            cartProductData =
                state.responseModel!.cartData!.first.cartProductData!;
          }
          if (state is GetCartSummaryState) {
            totalAmount = double.parse(
                state.responseModel.data!.first.subTotal!.toString());
            totalSaving =
                double.parse(state.responseModel.data!.first.save.toString());
          }
          if (state is GetCartProductState) {
            getCartProductData = state.responseModel.data!;
          }
          if (state is CartErrorState) {
            AppException exception = state.exception;
            ShowToast.toastMsg(exception.message);
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
                    const HeaderStepperWidget(currentStep: 2),
                    getCartProductData.isEmpty && !isLoading
                        ? const Expanded(
                            child: Center(
                              child: Text(Strings.emptyCartMSG),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: getCartProductData.length,
                              itemBuilder: (context, index) {
                                int cartQty =
                                    getCartProductData[index].cartQuantity!;
                                return CartItemCard(
                                  getCartProductData: getCartProductData[index],
                                  cartTotal: cartQty,
                                  onDeleteTap: () {
                                    if (!isLoading) {
                                      currentPartId =
                                          getCartProductData[index].partId;
                                      cartBloc.add(
                                        CartItemRemoveEvent(
                                          cartId:
                                              getCartProductData[index].cartId,
                                        ),
                                      );
                                      refreshCartData();
                                      // cartBloc.add(
                                      //   CartTotalItemEvent(
                                      //     userId: AppPreference().getStringData(
                                      //         PreferencesKey.userId),
                                      //   ),
                                      // );
                                    }
                                  },
                                  onPlusTap: () {
                                    if (!isLoading) {
                                      if (int.parse(getCartProductData[index]
                                              .partQty!) ==
                                          cartQty) {
                                        ShowToast.toastMsg(quantityErrorMsg(
                                            cartQty.toString()));
                                        return;
                                      }
                                      cartBloc.add(
                                        CartItemUpdateQtyEvent(
                                          cartId:
                                              getCartProductData[index].cartId,
                                          cartQuantity: (++cartQty).toString(),
                                        ),
                                      );
                                      refreshCartData();
                                      // cartBloc.add(
                                      //   CartTotalItemEvent(
                                      //     userId: AppPreference().getStringData(
                                      //         PreferencesKey.userId),
                                      //   ),
                                      // );
                                    }
                                  },
                                  onMinusTap: () {
                                    if (!isLoading && cartQty != 1) {
                                      cartBloc.add(
                                        CartItemUpdateQtyEvent(
                                          cartId:
                                              getCartProductData[index].cartId,
                                          cartQuantity: (--cartQty).toString(),
                                        ),
                                      );
                                      refreshCartData();
                                      // cartBloc.add(
                                      //   CartTotalItemEvent(
                                      //     userId: AppPreference().getStringData(
                                      //         PreferencesKey.userId),
                                      //   ),
                                      // );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                    Visibility(
                      visible: getCartProductData.isNotEmpty || isLoading,
                      child: Padding(
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Strings.totalAmount,
                                      style: size15PNregular(
                                          textColor: primaryColor),
                                    ),
                                    Text('₹ $totalAmount',
                                        style: size15PNregular()),
                                  ],
                                ),
                                verticalSpace(8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Strings.totalSaving,
                                      style: size12PNregular(
                                          textColor: colorGreyText),
                                    ),
                                    Text(
                                      '₹ $totalSaving',
                                      style: size12PNregular(
                                          textColor: colorGreyText),
                                    ),
                                  ],
                                ),
                                verticalSpace(25),
                                GestureDetector(
                                  onTap: () {
                                    if (!isLoading) {
                                      Navigator.pushReplacementNamed(
                                          context, Routes.cartAddressScreen);
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
                                        Strings.proceedToCheckout,
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

// if (state is CartAddressState) {
//   if (state.responseModel!.cartAddressData!.isEmpty) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         insetPadding:
//             const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 state.responseModel!.message!,
//                 textAlign: TextAlign.center,
//                 style: size16PNregular(),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, Routes.addressScreen);
//               },
//               child: Container(
//                 padding: const EdgeInsets.only(left: 8, right: 8),
//                 height: SizeUtils().hp(7),
//                 width: SizeUtils().wp(50),
//                 decoration: BoxDecoration(
//                   color: primaryColor,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Center(
//                   child: Text(
//                     Strings.addNewAddress,
//                     style: size16PNregular(textColor: colorWhite),
//                   ),
//                 ),
//               ),
//             ),
//             verticalSpace(15),
//           ],
//         ),
//       ),
//     );
//     // ShowToast.toastMsg(state.responseModel!.message!);
//   }
// }
