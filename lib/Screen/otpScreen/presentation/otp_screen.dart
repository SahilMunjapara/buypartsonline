import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/log_utils/log_util.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/appbar.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/otp_field/otp_field.dart';
import 'package:buypartsonline/common_widget/otp_field/style.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorWhiteBackground,
      body: Stack(
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
                      },
                    ),
                    verticalSpace(50),
                    ElevatedButton(
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
                      onPressed: () {},
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
        ],
      ),
    );
  }
}
