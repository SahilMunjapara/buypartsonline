import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/cartScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_address_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/widget/address_card_widget.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/widget/header_stepper_widget.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/app_preferences/app_preferences.dart';
import 'package:buypartsonline/Utils/app_preferences/prefrences_key.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/Utils/validation/validation.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/custom_textfield_widget.dart';
import 'package:buypartsonline/common_widget/home_screen_drawer.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/common_widget/toast_msg.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartAddressScreen extends StatefulWidget {
  const CartAddressScreen({Key? key}) : super(key: key);

  @override
  State<CartAddressScreen> createState() => _CartAddressScreenState();
}

class _CartAddressScreenState extends State<CartAddressScreen> {
  CartBloc cartBloc = CartBloc();
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late TextEditingController nameController;
  late TextEditingController mobileNumberController;
  late TextEditingController addressController;
  late TextEditingController pincodeController;
  late TextEditingController stateController;

  late FocusNode nameFocusNode;
  late FocusNode mobileNumberFocusNode;
  late FocusNode addressFocusNode;
  late FocusNode pincodeFocusNode;
  late FocusNode stateFocusNode;

  GlobalKey<FormState>? formKey;

  bool isLoading = false;

  List<CartAddressData> addressList = [];

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    nameController = TextEditingController();
    mobileNumberController = TextEditingController();
    addressController = TextEditingController();
    pincodeController = TextEditingController();
    stateController = TextEditingController();

    nameFocusNode = FocusNode();
    mobileNumberFocusNode = FocusNode();
    addressFocusNode = FocusNode();
    pincodeFocusNode = FocusNode();
    stateFocusNode = FocusNode();

    formKey = GlobalKey<FormState>();

    cartBloc.add(
      CartAddressEvent(
        customerId: AppPreference().getStringData(PreferencesKey.userId),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileNumberController.dispose();
    addressController.dispose();
    pincodeController.dispose();
    stateController.dispose();

    nameFocusNode.dispose();
    mobileNumberFocusNode.dispose();
    addressFocusNode.dispose();
    pincodeFocusNode.dispose();
    stateFocusNode.dispose();
    super.dispose();
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
          if (state is CartAddressState) {
            addressList = state.responseModel!.cartAddressData!;
          }
          if (state is CartDefaultAddressState) {
            ShowToast.toastMsg(state.responseModel!.message!);
          }
          if (state is AddcartAddressState) {
            removeControllerData();
            ShowToast.toastMsg(state.responseModel!.message!);
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
                    const HeaderStepperWidget(currentStep: 3),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 12),
                              child: Text(
                                Strings.shippingAddress,
                                style: size18PNregular(textColor: primaryColor),
                              ),
                            ),
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  verticalSpace(15),
                                  CustomTextField(
                                    maxLength: 30,
                                    controller: nameController,
                                    focusNode: nameFocusNode,
                                    validator: Validator.nameValidationMsg,
                                    labelText: Strings.name,
                                    textInputType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                  ),
                                  verticalSpace(15),
                                  CustomTextField(
                                    maxLength: 10,
                                    controller: mobileNumberController,
                                    focusNode: mobileNumberFocusNode,
                                    validator: Validator.phoneValidationMsg,
                                    labelText: Strings.mobileNumber,
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                  ),
                                  verticalSpace(15),
                                  CustomTextField(
                                    maxLength: 100,
                                    controller: addressController,
                                    focusNode: addressFocusNode,
                                    validator: Validator.addressValidator,
                                    labelText: Strings.address,
                                    textInputType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                  ),
                                  verticalSpace(15),
                                  CustomTextField(
                                    maxLength: 6,
                                    controller: pincodeController,
                                    focusNode: pincodeFocusNode,
                                    validator: Validator.pincodeValidationMsg,
                                    labelText: Strings.pincode,
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                  ),
                                  verticalSpace(15),
                                  CustomTextField(
                                    controller: stateController,
                                    focusNode: stateFocusNode,
                                    validator: Validator.stateValidator,
                                    labelText: Strings.state,
                                    textInputType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                  ),
                                  verticalSpace(25),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: GestureDetector(
                                      onTap: onTapAddAddress,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        height: SizeUtils().hp(7),
                                        width: SizeUtils().screenWidth,
                                        child: Center(
                                          child: Text(
                                            Strings.addNewAddress,
                                            style: size18PNregular(
                                              textColor: colorWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  verticalSpace(12),
                                  addressList.isEmpty && !isLoading
                                      ? const Text(
                                          Strings.addressNotAvailable,
                                        )
                                      : Column(
                                          children: addressList
                                              .map(
                                                (addressData) =>
                                                    AddressCardWidget(
                                                  cartAddressData: addressData,
                                                  onRadioTap: () {
                                                    onRadioButtonTap(
                                                        addressData);
                                                  },
                                                ),
                                              )
                                              .toList(),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 12),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (!isLoading) {
                                          if (addressList.isNotEmpty) {
                                            Navigator.pushReplacementNamed(
                                                context,
                                                Routes.cartCheckoutScreen);
                                          } else {
                                            ShowToast.toastMsg('');
                                          }
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        height: SizeUtils().hp(7),
                                        width: SizeUtils().screenWidth,
                                        child: Center(
                                          child: Text(
                                            Strings.procced,
                                            style: size18PNregular(
                                              textColor: colorWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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

  void removeControllerData() {
    nameController.clear();
    mobileNumberController.clear();
    addressController.clear();
    pincodeController.clear();
    stateController.clear();
  }

  void onTapAddAddress() {
    if (!isLoading) {
      if (formKey!.currentState!.validate()) {
        cartBloc.add(
          AddCartAddressEvent(
            customerId: AppPreference().getStringData(PreferencesKey.userId),
            customerName: nameController.text,
            customerPhone: mobileNumberController.text,
            customerAddress: addressController.text,
            addressPincode: pincodeController.text,
            addressState: stateController.text,
          ),
        );
        cartBloc.add(
          CartAddressEvent(
            customerId: AppPreference().getStringData(PreferencesKey.userId),
          ),
        );
      }
    }
  }

  void onRadioButtonTap(CartAddressData cartAddressData) {
    if (!isLoading) {
      if (cartAddressData.addressDefault != '1') {
        cartBloc.add(
          CartDefaultSAddressEvent(
            customerId: AppPreference().getStringData(PreferencesKey.userId),
            addressId: cartAddressData.addressId,
          ),
        );
        cartBloc.add(
          CartAddressEvent(
            customerId: AppPreference().getStringData(PreferencesKey.userId),
          ),
        );
      }
    }
  }
}
