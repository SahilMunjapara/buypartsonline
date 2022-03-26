import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/otpScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/otpScreen/data/model/otp_screen_param_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/app_preferences/app_preferences.dart';
import 'package:buypartsonline/Utils/app_preferences/prefrences_key.dart';
import 'package:buypartsonline/Utils/log_utils/log_util.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/Utils/validation/validation.dart';
import 'package:buypartsonline/common_widget/appbar.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/otp_field/otp_field.dart';
import 'package:buypartsonline/common_widget/otp_field/style.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/common_widget/toast_msg.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({this.otpScreenParam, Key? key}) : super(key: key);
  final OtpScreenParam? otpScreenParam;

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  OtpBloc otpBloc = OtpBloc();
  bool isLoading = false;
  String otpValue = '';

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorWhiteBackground,
      body: BlocListener(
        bloc: otpBloc,
        listener: (context, state) async {
          if (state is OtpLoadingBeginState) {
            isLoading = true;
          }
          if (state is OtpLoadingEndState) {
            isLoading = false;
          }
          if (state is OtpVerfiedState) {
            if (state.responseModel.otpData!.first == 1) {
              await AppPreference().setBoolData(PreferencesKey.isLogin, true);
              await AppPreference().setStringData(
                  PreferencesKey.userId, widget.otpScreenParam!.customerId);
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.homeScreen, (route) => false);
            } else {
              ShowToast.toastMsg(state.responseModel.message!);
            }
          }
          if (state is ForgotOtpVerifyState) {
            if (state.responseModel.forgotOtpVerifyData!.first == 1) {
              Navigator.pushNamed(
                context,
                Routes.changePasswordScreen,
                arguments: widget.otpScreenParam!.mobileNumber,
              );
            } else {
              ShowToast.toastMsg(state.responseModel.message!);
            }
          }
          if (state is OtpErrorState) {
            AppException exception = state.exception;
            ShowToast.toastMsg(exception.message);
          }
        },
        child: BlocBuilder(
          bloc: otpBloc,
          builder: (context, state) {
            return Stack(
              children: [
                const BottomDesignBox(),
                Column(
                  children: [
                    loginSignupBar(Strings.otpTitle),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          verticalSpace(50),
                          Text(
                            Strings.otpVerification,
                            style: size25PNregular(textColor: primaryColor),
                            textAlign: TextAlign.center,
                          ),
                          verticalSpace(15),
                          Text(
                            Strings.otpVerificationDetail,
                            style: size16PNregular(textColor: colorGrey),
                            textAlign: TextAlign.center,
                          ),
                          verticalSpace(50),
                          OTPTextField(
                            length: 4,
                            width: MediaQuery.of(context).size.width,
                            fieldWidth: SizeUtils().wp(20),
                            style: size18PNregular(),
                            textFieldAlignment: MainAxisAlignment.spaceBetween,
                            fieldStyle: FieldStyle.box,
                            onChanged: (code) {
                              LogUtils.showLogs(message: code, tag: 'Code');
                            },
                            onCompleted: (pin) {
                              LogUtils.showLogs(message: pin, tag: 'Completed');
                              otpValue = pin;
                            },
                          ),
                          verticalSpace(50),
                          ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
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
                                    if (Validator.validOtp.hasMatch(otpValue)) {
                                      if (widget.otpScreenParam!.isFromForgot) {
                                        otpBloc.add(
                                          ForgotOtpVerifyEvent(
                                            mobileNumber: widget
                                                .otpScreenParam!.mobileNumber,
                                            otp: otpValue,
                                          ),
                                        );
                                      } else {
                                        otpBloc.add(
                                          OtpVerifyEvent(
                                            customerId: widget
                                                .otpScreenParam!.customerId,
                                            otp: otpValue,
                                          ),
                                        );
                                      }
                                    } else {
                                      ShowToast.toastMsg(
                                          ToastString.enterValidOtp);
                                    }
                                  },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: SizeUtils().hp(2),
                                bottom: SizeUtils().hp(2),
                              ),
                              child: Text(
                                Strings.verifyOtp,
                                style: size15PNregular(textColor: colorWhite),
                              ),
                            ),
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
}
