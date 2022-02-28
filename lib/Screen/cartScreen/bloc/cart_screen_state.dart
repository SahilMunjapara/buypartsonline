import 'package:buypartsonline/Screen/cartScreen/data/model/cart_detail_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_remove_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_update_response_model.dart';
import 'package:buypartsonline/service/exception/exception.dart';

abstract class CartScreenState {}

class CartInitialState extends CartScreenState {}

class CartLoadingBeginState extends CartScreenState {}

class CartLoadingEndState extends CartScreenState {}

class CartTotalItemState extends CartScreenState {
  CartDetailResponseModel? responseModel;

  CartTotalItemState(this.responseModel);
}

class CartItemUpdateQtyState extends CartScreenState {
  CartUpdateResponseModel? responseModel;

  CartItemUpdateQtyState(this.responseModel);
}

class CartItemRemoveState extends CartScreenState {
  CartRemoveResponseModel? responseModel;

  CartItemRemoveState(this.responseModel);
}

class CartErrorState extends CartScreenState {
  AppException exception;

  CartErrorState(this.exception);
}
