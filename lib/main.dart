import 'package:buypartsonline/Navigation/route_generator.dart';
import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/Utils/app_preferences/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await AppPreference().initialAppPreference();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: colorCustom,
        brightness: Brightness.light,
        fontFamily: poppins,
        canvasColor: colorWhite,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
