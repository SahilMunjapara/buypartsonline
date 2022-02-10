import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/log_utils/log_util.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/Utils/validation/validation.dart';
import 'package:buypartsonline/common_widget/appbar.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/custom_textfield_widget.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailIdController;
  late TextEditingController passwordController;

  late FocusNode emailIdFocusNode;
  late FocusNode passwordFocusNode;
  GlobalKey<FormState>? formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    emailIdController = TextEditingController();
    passwordController = TextEditingController();

    emailIdFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    formKey = null;
    emailIdController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorWhiteBackground,
      body: Stack(
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
                  maxLength: 45,
                  controller: emailIdController,
                  focusNode: emailIdFocusNode,
                  validator: Validator.emailValidationMsg,
                  labelText: Strings.email,
                  textInputType: TextInputType.emailAddress,
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
                      if (formKey!.currentState!.validate()) {}
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
                            Navigator.pushNamedAndRemoveUntil(
                                context, Routes.signupScreen, (route) => false);
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
        ],
      ),
    );
  }
}
