import 'package:buypartsonline/Screen/forgotScreen/forgot_screen.dart';
import 'package:buypartsonline/Screen/homeScreen/home_screen.dart';
import 'package:buypartsonline/Screen/loginScreen/presentation/login_screen.dart';
import 'package:buypartsonline/Screen/signupScreen/presentation/signup_screen.dart';
import 'package:buypartsonline/Screen/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'routes_key.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.signupScreen:
        return MaterialPageRoute(builder: (context) => const SignupScreen());
      case Routes.forgotScreen:
        return MaterialPageRoute(builder: (context) => const ForgotScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Error"),
          ),
          body: const Center(
            child: Text("Page not found!"),
          ),
        );
      },
    );
  }
}
