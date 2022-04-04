import 'package:buypartsonline/Screen/addressScreen/data/model/add_address_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_address_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_call_back_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_default_address_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_detail_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_remove_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_update_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/default_address_detail_response_model.dart';
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

class CartAddressState extends CartScreenState {
  CartAddressResponseModel? responseModel;

  CartAddressState(this.responseModel);
}

class CartDefaultAddressState extends CartScreenState {
  CartDefaultAddressResponseModel? responseModel;
  CartDefaultAddressState(this.responseModel);
}

class AddcartAddressState extends CartScreenState {
  AddAddressResponseModel? responseModel;
  AddcartAddressState(this.responseModel);
}

class DefaultAddressDetailState extends CartScreenState {
  DefaultAddressDetailResponseModel responseModel;
  DefaultAddressDetailState(this.responseModel);
}

class CartCallBackState extends CartScreenState {
  CallBackResponseModel responseModel;
  CartCallBackState(this.responseModel);
}

class CartErrorState extends CartScreenState {
  AppException exception;

  CartErrorState(this.exception);
}
