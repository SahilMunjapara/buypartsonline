import 'package:buypartsonline/Screen/cartScreen/data/model/cart_payment_model.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/widget/header_stepper_widget.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/log_utils/log_util.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/home_screen_drawer.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/common_widget/toast_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartPayoutScreen extends StatefulWidget {
  const CartPayoutScreen({Key? key}) : super(key: key);

  @override
  State<CartPayoutScreen> createState() => _CartPayoutScreenState();
}

class _CartPayoutScreenState extends State<CartPayoutScreen> {
  static const platform = MethodChannel("razorpay_flutter");
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late List<CartPaymentMethodModel> paymentMethodList;

  late Razorpay _razorpay;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    paymentMethodList = cartPaymentList;

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_4plaJ49kG8kCei',
      'amount': 10000 * 100,
      'name': 'Buy Parts Limited',
      'description': 'Vehicle Parts',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '9876543210',
        'email': 'test@test.com',
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
        'wallets': ['paytm', 'freecharge', 'mobikwik'],
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ShowToast.toastMsg("SUCCESS: " + response.paymentId!);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ShowToast.toastMsg(response.message!);
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
      body: Stack(
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
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Container(
                                    color: colorWhite,
                                    child: Padding(
                                      padding: const EdgeInsets.all(18),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            e.paymentType!,
                                            style: size16PNregular(),
                                          ),
                                          GestureDetector(
                                            onTap: () {
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
                                            child: e.isSelected!
                                                ? Image.asset(
                                                    AssetStrings.onRadio)
                                                : Image.asset(
                                                    AssetStrings.offRadio),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
                        verticalSpace(25),
                        GestureDetector(
                          onTap: openCheckout,
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
          )
        ],
      ),
    );
  }
}
