import 'package:buypartsonline/Global/key.dart';
import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/cartScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_payment_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_payout_screen_param.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/widget/cart_payment_list_widget.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/widget/header_stepper_widget.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/home_screen_drawer.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/common_widget/toast_msg.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartPayoutScreen extends StatefulWidget {
  const CartPayoutScreen({this.cartPayoutScreenParam, Key? key})
      : super(key: key);
  final CartPayoutScreenParam? cartPayoutScreenParam;

  @override
  State<CartPayoutScreen> createState() => _CartPayoutScreenState();
}

class _CartPayoutScreenState extends State<CartPayoutScreen> {
  CartBloc cartBloc = CartBloc();
  static const platform = MethodChannel("razorpay_flutter");
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late List<CartPaymentMethodModel> paymentMethodList;

  late Razorpay _razorpay;

  bool isLoading = false;

  bool isPaymentSucess = false;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    paymentMethodList = cartPaymentList;

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    print(widget.cartPayoutScreenParam!.courierId);
    print(widget.cartPayoutScreenParam!.customerId);
    print(widget.cartPayoutScreenParam!.defaultAddressId);
    print(widget.cartPayoutScreenParam!.deliveryCharge);
    print(widget.cartPayoutScreenParam!.customerPhoneNumber);
    print(widget.cartPayoutScreenParam!.totalPrice);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': RazorpayKey.testKey,
      'amount': (widget.cartPayoutScreenParam!.totalPrice! +
              widget.cartPayoutScreenParam!.deliveryCharge!) *
          100,
      'name': Strings.buyPartsLimited,
      'description': Strings.vehicleParts,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': widget.cartPayoutScreenParam!.customerPhoneNumber,
        'email': '',
      },
      "method": {
        "card": paymentMethodList[0].isSelected,
        "upi": paymentMethodList[1].isSelected,
        "wallet": paymentMethodList[2].isSelected,
        "netbanking": false,
        "emi": false,
        "paylater": false,
      },
      'external': {
        'wallets': razorPayWalletList,
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('=========================');
    print(response.orderId);
    print(response.paymentId);
    print(response.signature);
    print('=========================');
    cartBloc.add(CartCallBackEvent(
      defaultAddressId:
          int.parse(widget.cartPayoutScreenParam!.defaultAddressId!),
      customerId: int.parse(widget.cartPayoutScreenParam!.customerId!),
      deliveryCharge: widget.cartPayoutScreenParam!.deliveryCharge,
      courierId: widget.cartPayoutScreenParam!.courierId,
      paymentType: 0,
      razorPayId: response.paymentId,
    ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ShowToast.toastMsg(response.message!);
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.homeScreen, (route) => false);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ShowToast.toastMsg("EXTERNAL_WALLET: " + response.walletName!);
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
          Strings.payout,
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
          if (state is CartCallBackState) {
            isPaymentSucess = true;
            ShowToast.toastMsg(state.responseModel.message!);
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.homeScreen, (route) => false);
            });
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderStepperWidget(currentStep: 5),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(25),
                            Text(
                              Strings.paymentMethod,
                              style: size16PNregular(),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: paymentMethodList
                                  .map((e) => CartPaymentListWidget(
                                        cartPaymentMethod: e,
                                        onRadioButtonTap: () {
                                          if (!e.isSelected!) {
                                            for (var item
                                                in paymentMethodList) {
                                              item.isSelected = false;
                                            }
                                            setState(() {
                                              e.isSelected = !e.isSelected!;
                                            });
                                          }
                                        },
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                              verticalSpace(20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Strings.totalPayoutAmount,
                                    style: size15PNregular(
                                        textColor: primaryColor),
                                  ),
                                  Text(
                                    '₹ ${(widget.cartPayoutScreenParam!.totalPrice! + widget.cartPayoutScreenParam!.deliveryCharge!).toString()}',
                                    style: size15PNregular(
                                        textColor: primaryColor),
                                  ),
                                ],
                              ),
                              verticalSpace(20),
                              GestureDetector(
                                onTap: isLoading == false &&
                                        isPaymentSucess == false
                                    ? openCheckout
                                    : null,
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
