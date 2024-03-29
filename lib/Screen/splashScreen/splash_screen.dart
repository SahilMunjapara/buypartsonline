import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/Utils/app_preferences/app_preferences.dart';
import 'package:buypartsonline/Utils/app_preferences/prefrences_key.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    timer(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset(AssetStrings.splashLogo),
        ),
      ),
    );
  }

  timer(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (AppPreference().getBoolData(PreferencesKey.isLogin) ?? false) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.homeScreen, (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.loginScreen, (Route<dynamic> route) => false);
        }
      },
    );
  }
}
