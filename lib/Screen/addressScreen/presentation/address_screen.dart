import 'package:buypartsonline/Screen/addressScreen/bloc/bloc.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/app_preferences/app_preferences.dart';
import 'package:buypartsonline/Utils/app_preferences/prefrences_key.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/Utils/validation/validation.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/custom_textfield_widget.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/common_widget/toast_msg.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  AddressBloc addressBloc = AddressBloc();

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

  @override
  void initState() {
    super.initState();
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          Strings.addresses,
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
        bloc: addressBloc,
        listener: (context, state) {
          if (state is AddAddressLoadingBeginState) {
            isLoading = true;
          }
          if (state is AddAddressLoadingEndState) {
            isLoading = false;
          }
          if (state is AddAddressState) {
            removeControllerData();
            ShowToast.toastMsg(state.responseModel!.message!);
          }
          if (state is AddressErrorState) {
            AppException exception = state.exception;
            removeControllerData();
            ShowToast.toastMsg(exception.message);
          }
        },
        child: BlocBuilder(
          bloc: addressBloc,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: GestureDetector(
                                  onTap: onTapSetDefaultAddress,
                                  child: Container(
                                    height: SizeUtils().hp(7),
                                    width: SizeUtils().screenWidth,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        Strings.setDefaultAddress,
                                        style: size20PNRegular(
                                            textColor: colorWhite),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 25.0),
                                child: GestureDetector(
                                  onTap: onTapAddNewAddress,
                                  child: Container(
                                    height: SizeUtils().hp(7),
                                    width: SizeUtils().screenWidth,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        Strings.addNewAddress,
                                        style: size20PNRegular(
                                            textColor: colorWhite),
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

  void onTapSetDefaultAddress() {
    if (!isLoading) {
      if (formKey!.currentState!.validate()) {
        addressBloc.add(
          AddAddressEvent(
            customerId: AppPreference().getStringData(PreferencesKey.userId),
            customerName: nameController.text,
            customerPhone: mobileNumberController.text,
            customerAddress: addressController.text,
            addressPincode: pincodeController.text,
            addressState: stateController.text,
          ),
        );
      }
    }
  }

  void onTapAddNewAddress() {
    if (!isLoading) {
      if (formKey!.currentState!.validate()) {
        addressBloc.add(
          AddAddressEvent(
            customerId: AppPreference().getStringData(PreferencesKey.userId),
            customerName: nameController.text,
            customerPhone: mobileNumberController.text,
            customerAddress: addressController.text,
            addressPincode: pincodeController.text,
            addressState: stateController.text,
          ),
        );
      }
    }
  }

  void removeControllerData() {
    nameController.clear();
    mobileNumberController.clear();
    addressController.clear();
    pincodeController.clear();
    stateController.clear();
  }
}
