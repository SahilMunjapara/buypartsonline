import 'package:buypartsonline/Screen/cartScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_detail_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/widget/cart_item_card_widget.dart';
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
import 'package:buypartsonline/common_widget/step_progress_view.dart';
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
  bool isLoading = false;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    cartBloc.add(
      CartTotalItemEvent(
        userId: AppPreference().getStringData(PreferencesKey.userId),
      ),
    );
    super.initState();
  }

  int currentStep = 2;

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
            isLoading = false;
          }
          if (state is CartTotalItemState) {
            totalAmount = double.parse(
                state.responseModel!.cartData!.first.total!.toString());
            totalSaving = double.parse(
                state.responseModel!.cartData!.first.save!.toString());
            cartProductData =
                state.responseModel!.cartData!.first.cartProductData!;
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
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(SizeUtils().wp(10)),
                        ),
                      ),
                      height: SizeUtils().hp(12),
                      width: SizeUtils().screenWidth,
                      child: StepProgressView(
                        width: SizeUtils().screenWidth,
                        icons: const [
                          Icons.shopping_cart_outlined,
                          Icons.location_on_outlined,
                          Icons.calendar_today_outlined,
                          Icons.credit_card,
                        ],
                        curStep: currentStep,
                        activeColor: colorWhite,
                        inactiveColor: colorSearch,
                      ),
                    ),
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
                                int cartQty = int.parse(
                                    cartProductData[index].cartQuantity!);
                                return CartItemCard(
                                  cartProductData: cartProductData[index],
                                  cartTotal: cartQty,
                                  onDeleteTap: () {
                                    if (!isLoading) {
                                      cartBloc.add(
                                        CartItemRemoveEvent(
                                          cartId: cartProductData[index].cartId,
                                        ),
                                      );
                                      cartBloc.add(
                                        CartTotalItemEvent(
                                          userId: AppPreference().getStringData(
                                              PreferencesKey.userId),
                                        ),
                                      );
                                    }
                                  },
                                  onPlusTap: () {
                                    if (!isLoading) {
                                      cartBloc.add(
                                        CartItemUpdateQtyEvent(
                                          cartId: cartProductData[index].cartId,
                                          cartQuantity: (++cartQty).toString(),
                                        ),
                                      );
                                      cartBloc.add(
                                        CartTotalItemEvent(
                                          userId: AppPreference().getStringData(
                                              PreferencesKey.userId),
                                        ),
                                      );
                                    }
                                  },
                                  onMinusTap: () {
                                    if (!isLoading && cartQty != 1) {
                                      cartBloc.add(
                                        CartItemUpdateQtyEvent(
                                          cartId: cartProductData[index].cartId,
                                          cartQuantity: (--cartQty).toString(),
                                        ),
                                      );
                                      cartBloc.add(
                                        CartTotalItemEvent(
                                          userId: AppPreference().getStringData(
                                              PreferencesKey.userId),
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                    Visibility(
                      visible: cartProductData.isNotEmpty || isLoading,
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
                                    if (isLoading) {
                                    } else {
                                      currentStep++;
                                      setState(() {});
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
                                        Strings.placeOrder,
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