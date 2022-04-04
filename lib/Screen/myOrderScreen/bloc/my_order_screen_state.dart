import 'package:buypartsonline/Screen/cartScreen/data/model/cart_address_response_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/brand_response_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/cancel_order_response_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/order_part_detail_response_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/order_status_response_model.dart';
import 'package:buypartsonline/service/exception/exception.dart';

abstract class MyOrderScreenState {}

class MyOrderInitialState extends MyOrderScreenState {}

class MyOrderLoadingBeginState extends MyOrderScreenState {}

class MyOrderLoadingEndState extends MyOrderScreenState {}

class GetMyOrderStatusState extends MyOrderScreenState {
  OrderStatusResponseModel responseModel;

  GetMyOrderStatusState(this.responseModel);
}

class GetMyOrderPartDetailState extends MyOrderScreenState {
  OrderPartDetailResponseModel responseModel;

  GetMyOrderPartDetailState(this.responseModel);
}

class GetMyOrderAddressState extends MyOrderScreenState {
  CartAddressResponseModel responseModel;
  GetMyOrderAddressState(this.responseModel);
}

class GetMyOrderBrandState extends MyOrderScreenState {
  BrandResponseModel responseModel;
  GetMyOrderBrandState(this.responseModel);
}

class CancelMyOrderState extends MyOrderScreenState {
  CancelOrderResponseModel? responseModel;
  CancelMyOrderState(this.responseModel);
}

class MyOrderErrorState extends MyOrderScreenState {
  AppException exception;
  MyOrderErrorState(this.exception);
}
