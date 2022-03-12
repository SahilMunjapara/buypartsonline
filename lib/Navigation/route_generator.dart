import 'package:buypartsonline/Screen/addressScreen/presentation/address_screen.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/cart_address_screen.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/cart_checkout_screen.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/cart_payout_screen.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/cart_screen.dart';
import 'package:buypartsonline/Screen/forgotScreen/forgot_screen.dart';
import 'package:buypartsonline/Screen/homeScreen/presentation/page/home_screen.dart';
import 'package:buypartsonline/Screen/loginScreen/presentation/login_screen.dart';
import 'package:buypartsonline/Screen/modelDetailView/presentation/model_detail_view.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_response_model.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_screen_param.dart';
import 'package:buypartsonline/Screen/modelViewScreen/presentation/model_view_screen.dart';
import 'package:buypartsonline/Screen/myOrderScreen/presentation/my_orders_screen.dart';
import 'package:buypartsonline/Screen/notificationScreen/presentation/notification_screen.dart';
import 'package:buypartsonline/Screen/otpScreen/presentation/otp_screen.dart';
import 'package:buypartsonline/Screen/profileScreen/presentation/profile_screen.dart';
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
      case Routes.otpScreen:
        return MaterialPageRoute(builder: (context) => const OtpScreen());
      case Routes.forgotScreen:
        return MaterialPageRoute(builder: (context) => const ForgotScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.modelViewScreen:
        return MaterialPageRoute(
          builder: (context) => ModelViewScreen(
            modelViewScreenParam: args as ModelViewScreenParam,
          ),
        );
      case Routes.modelDetailView:
        return MaterialPageRoute(
          builder: (context) => ModelDetailView(
            modelPart: args as ModelViewData,
          ),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(builder: (context) => const CartScreen());
      case Routes.cartAddressScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const CartAddressScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      case Routes.cartCheckoutScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const CartCheckoutScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      case Routes.cartPayoutScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const CartPayoutScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case Routes.addressScreen:
        return MaterialPageRoute(builder: (context) => const AddressScreen());
      case Routes.notificationScreen:
        return MaterialPageRoute(
            builder: (context) => const NotificationScreen());
      case Routes.myOrdersScreen:
        return MaterialPageRoute(builder: (context) => const MyOrderScreen());
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
