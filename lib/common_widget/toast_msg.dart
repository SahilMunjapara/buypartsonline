import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  static toastMsg(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: colorGreyText,
      textColor: colorWhite,
      fontSize: 16.0,
    );
  }

  static cancleToast() {
    Fluttertoast.cancel();
  }
}
