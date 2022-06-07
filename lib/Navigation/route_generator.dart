import 'package:buypartsonline/Screen/ReturnPolicyScreen/return_policy_screen.dart';
import 'package:buypartsonline/Screen/aboutUsScreen/aboutUs_screen.dart';
import 'package:buypartsonline/Screen/addressScreen/presentation/address_screen.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_payout_screen_param.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/cart_address_screen.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/cart_checkout_screen.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/cart_payout_screen.dart';
import 'package:buypartsonline/Screen/cartScreen/presentation/cart_screen.dart';
import 'package:buypartsonline/Screen/forgotScreen/presentation/change_password_screen.dart';
import 'package:buypartsonline/Screen/forgotScreen/presentation/forgot_screen.dart';
import 'package:buypartsonline/Screen/homeScreen/presentation/page/home_screen.dart';
import 'package:buypartsonline/Screen/legalAndOtherScreen/legal_and_other_screen.dart';
import 'package:buypartsonline/Screen/loginScreen/presentation/login_screen.dart';
import 'package:buypartsonline/Screen/modelDetailView/presentation/model_detail_view.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_response_model.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_screen_param.dart';
import 'package:buypartsonline/Screen/modelViewScreen/presentation/model_view_screen.dart';
import 'package:buypartsonline/Screen/modificationScreen/data/model/modification_screen_param.dart';
import 'package:buypartsonline/Screen/modificationScreen/presentation/modification_screen.dart';
import 'package:buypartsonline/Screen/myOrderScreen/presentation/my_orders_part_detail_screen.dart';
import 'package:buypartsonline/Screen/myOrderScreen/presentation/my_orders_screen.dart';
import 'package:buypartsonline/Screen/notificationScreen/presentation/notification_screen.dart';
import 'package:buypartsonline/Screen/otpScreen/data/model/otp_screen_param_model.dart';
import 'package:buypartsonline/Screen/otpScreen/presentation/otp_screen.dart';
import 'package:buypartsonline/Screen/profileScreen/presentation/profile_screen.dart';
import 'package:buypartsonline/Screen/signupScreen/presentation/signup_screen.dart';
import 'package:buypartsonline/Screen/splashScreen/splash_screen.dart';
import 'package:buypartsonline/Screen/trackOrderScreen/track_order_screen.dart';
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
        return MaterialPageRoute(
          builder: (context) => OtpScreen(
            otpScreenParam: args as OtpScreenParam,
          ),
        );
      case Routes.forgotScreen:
        return MaterialPageRoute(builder: (context) => const ForgotScreen());
      case Routes.changePasswordScreen:
        return MaterialPageRoute(
          builder: (context) => ChangePasswordScreen(
            mobileNumber: args as String,
          ),
        );
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
          pageBuilder: (context, animation1, animation2) => CartPayoutScreen(
            cartPayoutScreenParam: args as CartPayoutScreenParam,
          ),
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
      case Routes.orderPartDetailScreen:
        return MaterialPageRoute(
          builder: (context) => MyOrdersPartDetailScreen(
            orderId: args as String,
          ),
        );
      case Routes.aboutUsScreen:
        return MaterialPageRoute(builder: (context) => const AboutUsScreen());
      case Routes.legalAndOtherScreen:
        return MaterialPageRoute(
            builder: (context) => const LegalAndOtherScreen());
      case Routes.returnPolicyScreen:
        return MaterialPageRoute(
            builder: (context) => const ReturnPolicyScreen());
      case Routes.trackOrderScreen:
        return MaterialPageRoute(
          builder: (context) => TrackOrderScreen(trackOrderUrl: args as String),
        );
      case Routes.modificationScreen:
        return MaterialPageRoute(
          builder: (context) => ModificationScreen(
              modificationScreenParam: args as ModificationScreenParam),
        );
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
