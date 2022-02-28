import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/loginScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/loginScreen/data/model/login_response_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/app_preferences/app_preferences.dart';
import 'package:buypartsonline/Utils/app_preferences/prefrences_key.dart';
import 'package:buypartsonline/Utils/log_utils/log_util.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/Utils/validation/validation.dart';
import 'package:buypartsonline/common_widget/appbar.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/custom_textfield_widget.dart';
import 'package:buypartsonline/common_widget/progress_bar_round.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/common_widget/toast_msg.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginBloc = LoginBloc();
  bool isLoading = false;
  late TextEditingController mobileNumberController;
  late TextEditingController passwordController;

  late FocusNode mobileNumberFocusNode;
  late FocusNode passwordFocusNode;
  GlobalKey<FormState>? formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    mobileNumberController = TextEditingController();
    passwordController = TextEditingController();

    mobileNumberFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    formKey = null;
    mobileNumberController.dispose();
    passwordController.dispose();

    mobileNumberFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorWhiteBackground,
      body: BlocListener(
        bloc: loginBloc,
        listener: (context, state) async {
          if (state is LoginLoadingBeginState) {
            isLoading = true;
          }
          if (state is LoginLoadingEndState) {
            isLoading = false;
          }
          if (state is LoginErrorState) {
            AppException exception = state.exception;
            ShowToast.toastMsg(exception.message);
          }
          if (state is LoginFormSubmitted) {
            LoginResponseModel responseModel = state.responseModel;
            if (responseModel.loginData!.isNotEmpty) {
              await AppPreference().setBoolData(PreferencesKey.isLogin, true);
              await AppPreference().setStringData(PreferencesKey.userId,
                  responseModel.loginData!.first.customerId!);
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.homeScreen, (route) => false);
            } else {
              ShowToast.toastMsg(responseModel.message!);
            }
          }
        },
        child: BlocBuilder(
          bloc: loginBloc,
          builder: (context, state) {
            return Stack(
              children: [
                const BottomDesignBox(),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      loginSignupBar(Strings.login),
                      verticalSpace(36),
                      CustomTextField(
                        maxLength: 10,
                        controller: mobileNumberController,
                        focusNode: mobileNumberFocusNode,
                        validator: Validator.phoneValidationMsg,
                        labelText: Strings.mobileNumber,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(20),
                      CustomTextField(
                        obscureText: true,
                        maxLength: 24,
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        validator: Validator.passwordValidationMsg,
                        labelText: Strings.password,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                      ),
                      verticalSpace(22),
                      Center(
                        child: Text.rich(TextSpan(
                          children: [
                            TextSpan(
                              text: Strings.forgotPassword + ' ',
                              style: size14PNregular(),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, Routes.forgotScreen);
                                },
                            ),
                            TextSpan(
                              text: IconStrings.nextArrow,
                              style: size14PNregular(textColor: primaryColor),
                            )
                          ],
                        )),
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
                          onPressed: () {
                            if (formKey!.currentState!.validate()) {
                              loginBloc.add(
                                LoginPerformLoginEvent(
                                  phoneNumber: mobileNumberController.text,
                                  password: passwordController.text,
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
                              Strings.login.toUpperCase(),
                              style: size15PNregular(textColor: colorWhite),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: Text.rich(TextSpan(
                          children: [
                            TextSpan(
                              text: Strings.dontHaveAccount + ' ',
                              style: size14PNregular(),
                            ),
                            TextSpan(
                              text: Strings.signUp + ' ',
                              style: size14PNregular(textColor: primaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      Routes.signupScreen, (route) => false);
                                },
                            ),
                            TextSpan(
                              text: IconStrings.nextArrow,
                              style: size14PNregular(textColor: primaryColor),
                            )
                          ],
                        )),
                      ),
                      verticalSpace(20)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(100),
                  child: ProgressBarRound(isLoading: isLoading),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
