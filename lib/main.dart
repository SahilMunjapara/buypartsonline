import 'dart:async';

import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter_bloc.dart';
import 'package:buypartsonline/Navigation/route_generator.dart';
import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/Utils/app_preferences/app_preferences.dart';
import 'package:buypartsonline/Utils/log_utils/log_util.dart';
import 'package:buypartsonline/Global/Observer/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference().initialAppPreference();
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runZonedGuarded(() {
      runApp(const Application());
    }, (error, stackTrace) {
      LogUtils.showErrorLogs(
        error: error.toString(),
        message: stackTrace.toString(),
        tag: 'RUN APP ERROR',
      );
    });
  });
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCounterBloc>(
          create: (BuildContext context) => CartCounterBloc(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: colorCustom,
          brightness: Brightness.light,
          fontFamily: poppins,
          canvasColor: colorWhite,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
