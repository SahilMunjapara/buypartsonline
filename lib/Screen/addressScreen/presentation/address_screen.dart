import 'package:buypartsonline/Screen/addressScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/addressScreen/presentation/widget/edit_address_card_widget.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_address_response_model.dart';
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
  bool isAddressUpdate = false;
  String currentAddressId = '';

  List<CartAddressData> addressList = [];

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

    addressBloc.add(
      GetAddressEvent(
          customerId: AppPreference().getStringData(PreferencesKey.userId)),
    );
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
        actions: [
          if (isAddressUpdate)
            GestureDetector(
              onTap: () {
                setState(() {
                  isAddressUpdate = false;
                  removeControllerData();
                });
              },
              child: const Icon(
                Icons.close,
                color: colorWhite,
                textDirection: TextDirection.rtl,
                size: 26,
              ),
            ),
          horizontalSpace(10)
        ],
        elevation: 0,
      ),
      body: BlocListener(
        bloc: addressBloc,
        listener: (context, state) {
          if (state is AddressLoadingBeginState) {
            isLoading = true;
          }
          if (state is AddressLoadingEndState) {
            isLoading = false;
          }
          if (state is AddAddressState) {
            removeControllerData();
            ShowToast.toastMsg(state.responseModel!.message!);
          }
          if (state is GetAddressState) {
            addressList = state.responseModel!.cartAddressData!;
          }
          if (state is SetDefaultAddressState) {
            ShowToast.toastMsg(state.responseModel!.message!);
          }
          if (state is UpdateAddressState) {
            if (state.responseModel!.updateAddressData!.first == 1) {
              setState(() {
                isAddressUpdate = false;
                removeControllerData();
              });
              ShowToast.toastMsg(state.responseModel!.message!);
            } else {
              ShowToast.toastMsg(state.responseModel!.message!);
            }
          }
          if (state is DeleteAddressState) {
            if (state.responseModel!.deleteAddressData!.first == 1) {
              ShowToast.toastMsg(state.responseModel!.message!);
            } else {
              ShowToast.toastMsg(state.responseModel!.message!);
            }
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
                      child: SingleChildScrollView(
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
                                    maxLength: 200,
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
                                      isAddressUpdate
                                          ? Strings.updateAddress
                                          : Strings.addNewAddress,
                                      style: size20PNRegular(
                                          textColor: colorWhite),
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
                                    children: addressList.map((addressData) {
                                      return EditAddressCardWidget(
                                        cartAddressData: addressData,
                                        onRadioTap: () {
                                          onRadioButtonTap(addressData);
                                        },
                                        onEditTap: () {
                                          onEditButtonTap(addressData);
                                        },
                                        onDeleteTap: () {
                                          onDeleteButtonTap(addressData);
                                        },
                                      );
                                    }).toList(),
                                  ),
                            verticalSpace(12),
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

  void onTapAddNewAddress() {
    if (!isLoading) {
      if (formKey!.currentState!.validate()) {
        if (isAddressUpdate) {
          addressBloc.add(
            UpdateAddressEvent(
              addressId: currentAddressId,
              customerName: nameController.text,
              customerPhone: mobileNumberController.text,
              customerAddress: addressController.text,
              addressPincode: pincodeController.text,
              addressState: stateController.text,
            ),
          );
        } else {
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

        addressBloc.add(
          GetAddressEvent(
            customerId: AppPreference().getStringData(PreferencesKey.userId),
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

  void onEditButtonTap(CartAddressData cartAddressData) {
    if (!isLoading) {
      if (isAddressUpdate != true) {
        setState(() {
          currentAddressId = cartAddressData.addressId!;
          isAddressUpdate = true;
          nameController.text = cartAddressData.addressForName!;
          mobileNumberController.text = cartAddressData.addressPhoneNo!;
          addressController.text = cartAddressData.addressName!;
          pincodeController.text = cartAddressData.addressPincode!;
          stateController.text = cartAddressData.addressState!;
        });
      }
    }
  }

  void onDeleteButtonTap(CartAddressData cartAddressData) {
    if (!isLoading) {
      removeControllerData();
      setState(() {
        isAddressUpdate = false;
      });
      addressBloc.add(
        DeleteAddressEvent(addressId: cartAddressData.addressId),
      );
      addressBloc.add(
        GetAddressEvent(
          customerId: AppPreference().getStringData(PreferencesKey.userId),
        ),
      );
    }
  }

  void onRadioButtonTap(CartAddressData cartAddressData) {
    if (!isLoading) {
      if (cartAddressData.addressDefault != DigitString.one) {
        addressBloc.add(
          SetDefaultAddressEvent(
            customerId: AppPreference().getStringData(PreferencesKey.userId),
            addressId: cartAddressData.addressId,
          ),
        );
        addressBloc.add(
          GetAddressEvent(
            customerId: AppPreference().getStringData(PreferencesKey.userId),
          ),
        );
      }
    }
  }
}
