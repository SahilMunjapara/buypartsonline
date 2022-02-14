import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/Utils/validation/validation.dart';
import 'package:buypartsonline/common_widget/appbar.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/custom_textfield_widget.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController nameController;
  late TextEditingController emailIdController;
  late TextEditingController passwordController;

  late FocusNode nameFocusNode;
  late FocusNode emailIdFocusNode;
  late FocusNode passwordFocusNode;

  GlobalKey<FormState>? formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    nameController = TextEditingController();
    emailIdController = TextEditingController();
    passwordController = TextEditingController();

    nameFocusNode = FocusNode();
    emailIdFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    formKey = null;
    nameController.dispose();
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
                loginSignupBar(Strings.signUp),
                verticalSpace(36),
                CustomTextField(
                  maxLength: 30,
                  controller: nameController,
                  focusNode: nameFocusNode,
                  validator: Validator.nameValidationMsg,
                  labelText: Strings.name,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                verticalSpace(20),
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
                    onPressed: () {
                      if (formKey!.currentState!.validate()) {}
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: SizeUtils().hp(2),
                        bottom: SizeUtils().hp(2),
                      ),
                      child: Text(
                        Strings.signUp.toUpperCase(),
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
                        text: Strings.alreadyHaveAccount + ' ',
                        style: size14PNregular(),
                      ),
                      TextSpan(
                        text: Strings.login + ' ',
                        style: size14PNregular(textColor: primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, Routes.loginScreen, (route) => false);
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