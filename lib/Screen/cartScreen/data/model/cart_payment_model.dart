import 'package:buypartsonline/UI_Helper/string.dart';

class CartPaymentMethodModel {
  String? paymentType;
  bool? isSelected;

  CartPaymentMethodModel({this.paymentType, this.isSelected});
}

List<CartPaymentMethodModel> cartPaymentList = [
  CartPaymentMethodModel(paymentType: Strings.cardPayment, isSelected: true),
  CartPaymentMethodModel(paymentType: Strings.upiPayment, isSelected: false),
  CartPaymentMethodModel(paymentType: Strings.walletPayment, isSelected: false),
];
