import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/forgotScreen/bloc/bloc.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/Utils/validation/validation.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/custom_textfield_widget.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/common_widget/toast_msg.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({this.mobileNumber, Key? key}) : super(key: key);
  final String? mobileNumber;

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  ForgotBloc forgotBloc = ForgotBloc();
  GlobalKey<FormState>? formKey;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;
  bool isLoading = false;
  bool isPasswordUpdated = false;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    formKey = null;
    passwordController.dispose();
    confirmPasswordController.dispose();

    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      backgroundColor: colorWhiteBackground,
      appBar: AppBar(
        title: Text(
          Strings.changePassword,
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
        bloc: forgotBloc,
        listener: (context, state) {
          if (state is ForgotLoadingBeginState) {
            isLoading = true;
          }
          if (state is ForgotLoadingEndState) {
            isLoading = false;
          }
          if (state is UpdatePasswordState) {
            if (state.responseModel.updatePasswordData!.first == 1) {
              isPasswordUpdated = true;
              ShowToast.toastMsg(state.responseModel.message!);
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.loginScreen, (route) => false);
              });
            } else {
              ShowToast.toastMsg(state.responseModel.message!);
            }
          }
          if (state is ForgotErrorState) {
            AppException exception = state.exception;
            ShowToast.toastMsg(exception.message);
          }
        },
        child: BlocBuilder(
          bloc: forgotBloc,
          builder: (context, state) {
            return Stack(
              children: [
                const BottomDesignBox(),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      verticalSpace(36),
                      CustomTextField(
                        obscureText: true,
                        maxLength: 24,
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        validator: Validator.passwordValidationMsg,
                        labelText: Strings.password,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(20),
                      CustomTextField(
                        obscureText: true,
                        maxLength: 24,
                        controller: confirmPasswordController,
                        focusNode: confirmPasswordFocusNode,
                        validator: confirmPassword,
                        labelText: Strings.confirmPassword,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                      ),
                      verticalSpace(35),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shadowColor:
                                MaterialStateProperty.all<Color>(primaryColor),
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                            ),
                          ),
                          onPressed: isLoading || isPasswordUpdated
                              ? null
                              : () {
                                  if (formKey!.currentState!.validate()) {
                                    forgotBloc.add(
                                      UpdatePasswordEvent(
                                        password: passwordController.text,
                                        mobileNumber: widget.mobileNumber,
                                      ),
                                    );
                                  }
                                },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: SizeUtils().hp(2),
                              bottom: SizeUtils().hp(2),
                            ),
                            child: Text(
                              Strings.updatePassword,
                              style: size15PNregular(textColor: colorWhite),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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

  String? confirmPassword(String? password) {
    if (password == null) {
      return ValidatorStrings.passwordIsRequired;
    } else if (password.length < 6) {
      return ValidatorStrings.passwordMust8Characters;
    } else if (password.length > 24) {
      return ValidatorStrings.passwordNotGreaterThan24;
    } else if (confirmPasswordController.text != passwordController.text) {
      return ValidatorStrings.passwordAndConfirmPasswordNotMatch;
    } else {
      return null;
    }
  }
}
