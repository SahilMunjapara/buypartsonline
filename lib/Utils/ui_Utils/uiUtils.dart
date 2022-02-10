import 'package:flutter/cupertino.dart';

class UiUtils {
  static void unfocus(BuildContext context) {
    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}