import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/forgotScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/otpScreen/data/model/otp_screen_param_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/Utils/validation/validation.dart';
import 'package:buypartsonline/common_widget/appbar.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/custom_textfield_widget.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/common_widget/toast_msg.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  ForgotBloc forgotBloc = ForgotBloc();
  late TextEditingController mobileNumberController;

  late FocusNode mobileNumberFocusNode;
  GlobalKey<FormState>? formKey;
  bool isLoading = false;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    mobileNumberController = TextEditingController();
    mobileNumberFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    formKey = null;
    mobileNumberController.dispose();
    mobileNumberFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorWhiteBackground,
      body: BlocListener(
        bloc: forgotBloc,
        listener: (context, state) {
          if (state is ForgotLoadingBeginState) {
            isLoading = true;
          }
          if (state is ForgotLoadingEndState) {
            isLoading = false;
          }
          if (state is OtpForForgotPasswordState) {
            if (state.responseModel.forgotOtpData!.first == 1) {
              Navigator.pushNamed(
                context,
                Routes.otpScreen,
                arguments: OtpScreenParam(
                  isFromForgot: true,
                  mobileNumber: mobileNumberController.text,
                ),
              );
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
                      loginSignupBar(Strings.forgot),
                      verticalSpace(36),
                      CustomTextField(
                        maxLength: 10,
                        controller: mobileNumberController,
                        focusNode: mobileNumberFocusNode,
                        validator: Validator.phoneValidationMsg,
                        labelText: Strings.mobileNumber,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                      ),
                      verticalSpace(34),
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
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (!isLoading) {
                                    if (formKey!.currentState!.validate()) {
                                      forgotBloc.add(
                                        OtpForForgotPasswordEvent(
                                            mobileNumber:
                                                mobileNumberController.text),
                                      );
                                    }
                                  }
                                },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: SizeUtils().hp(2),
                              bottom: SizeUtils().hp(2),
                            ),
                            child: Text(
                              Strings.resetPassword.toUpperCase(),
                              style: size15PNregular(textColor: colorWhite),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: Strings.goToLoginPage,
                                style: size14PNregular(),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        Routes.loginScreen, (route) => false);
                                  },
                              ),
                              TextSpan(
                                text: IconStrings.nextArrow,
                                style: size14PNregular(textColor: primaryColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        Routes.loginScreen, (route) => false);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpace(20)
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
}
