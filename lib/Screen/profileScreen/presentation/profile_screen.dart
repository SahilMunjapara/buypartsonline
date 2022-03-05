import 'package:buypartsonline/Screen/profileScreen/bloc/bloc.dart';
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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileBloc profileBloc = ProfileBloc();
  bool isLoading = false;
  late TextEditingController companyNameController;
  late TextEditingController nameController;
  late TextEditingController mobileNumberController;
  late TextEditingController emailController;

  late FocusNode companyNameFocusNode;
  late FocusNode nameFocusNode;
  late FocusNode mobileNumberFocusNode;
  late FocusNode emailFocusNode;

  GlobalKey<FormState>? formKey;

  @override
  void initState() {
    companyNameController = TextEditingController();
    nameController = TextEditingController();
    mobileNumberController = TextEditingController();
    emailController = TextEditingController();

    companyNameFocusNode = FocusNode();
    nameFocusNode = FocusNode();
    mobileNumberFocusNode = FocusNode();
    emailFocusNode = FocusNode();

    formKey = GlobalKey<FormState>();

    profileBloc.add(
      GetProfileDetailEvent(
        customerId: AppPreference().getStringData(PreferencesKey.userId),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    companyNameController.dispose();
    nameController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    companyNameFocusNode.dispose();
    nameFocusNode.dispose();
    mobileNumberFocusNode.dispose();
    emailFocusNode.dispose();
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
          Strings.myProfile,
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
        bloc: profileBloc,
        listener: (context, state) {
          if (state is ProfileLoadingBeginState) {
            isLoading = true;
          }
          if (state is ProfileLoadingEndState) {
            isLoading = false;
          }
          if (state is GetProfileDetailState) {
            companyNameController.text =
                state.responseModel.profileData!.first.customerCompanyName!;
            nameController.text =
                state.responseModel.profileData!.first.customerName!;
            mobileNumberController.text =
                state.responseModel.profileData!.first.customerPhoneNo!;
            emailController.text =
                state.responseModel.profileData!.first.customerEmailId!;
          }
          if (state is UpdateProfileState) {
            ShowToast.toastMsg(state.responseModel.message!);
          }
          if (state is ProfileErrorState) {
            AppException exception = state.exception;
          ShowToast.toastMsg(exception.message);
          }
        },
        child: BlocBuilder(
          bloc: profileBloc,
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
                    isLoading
                        ? const Expanded(
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(primaryColor),
                              ),
                            ),
                          )
                        : Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      verticalSpace(15),
                                      CustomTextField(
                                        controller: companyNameController,
                                        focusNode: companyNameFocusNode,
                                        validator:
                                            Validator.companyNameValidationMsg,
                                        labelText: Strings.companyName,
                                        textInputType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                      ),
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
                                        readOnly: true,
                                      ),
                                      verticalSpace(15),
                                      CustomTextField(
                                        maxLength: 45,
                                        controller: emailController,
                                        focusNode: emailFocusNode,
                                        validator: Validator.emailValidationMsg,
                                        labelText: Strings.email,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.done,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: GestureDetector(
                                    onTap: onUpdateTap,
                                    child: Container(
                                      height: SizeUtils().hp(7),
                                      width: SizeUtils().screenWidth,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          Strings.updateProfile,
                                          style: size20PNRegular(
                                              textColor: colorWhite),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void onUpdateTap() {
    if (formKey!.currentState!.validate()) {
      profileBloc.add(
        UpdateProfileEvent(
          customerId: AppPreference().getStringData(PreferencesKey.userId),
          customerCompanyName: companyNameController.text,
          customerName: nameController.text,
          customerMobileNumber: mobileNumberController.text,
          customerEmail: emailController.text,
        ),
      );
    }
  }
}
