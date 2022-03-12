import 'package:buypartsonline/Global/CartCounter/data/model/cart_total_response_model.dart';

abstract class CartCounterState {}

class CartCounterInitialState extends CartCounterState {}

class CartCounterTotalState extends CartCounterState {
  CartTotalResponseModel? responseModel;
  CartCounterTotalState(this.responseModel);
}
