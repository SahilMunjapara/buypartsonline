import 'package:buypartsonline/Navigation/route_generator.dart';
import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:flutter/material.dart';

void main() {
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
