import 'package:buypartsonline/Screen/addressScreen/data/model/add_address_response_model.dart';
import 'package:buypartsonline/Screen/addressScreen/data/model/delete_address_response_model.dart';
import 'package:buypartsonline/Screen/addressScreen/data/model/update_address_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_address_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_default_address_response_model.dart';
import 'package:buypartsonline/service/exception/exception.dart';

abstract class AddressScreenState {}

class AddressInitialState extends AddressScreenState {}

class AddressLoadingBeginState extends AddressScreenState {}

class AddressLoadingEndState extends AddressScreenState {}

class AddAddressState extends AddressScreenState {
  AddAddressResponseModel? responseModel;
  AddAddressState(this.responseModel);
}

class GetAddressState extends AddressScreenState {
  CartAddressResponseModel? responseModel;
  GetAddressState(this.responseModel);
}

class SetDefaultAddressState extends AddressScreenState {
  CartDefaultAddressResponseModel? responseModel;
  SetDefaultAddressState(this.responseModel);
}

class UpdateAddressState extends AddressScreenState {
  UpdateAddressResponseModel? responseModel;
  UpdateAddressState(this.responseModel);
}

class DeleteAddressState extends AddressScreenState {
  DeleteAddressResponseModel? responseModel;
  DeleteAddressState(this.responseModel);
}

class AddressErrorState extends AddressScreenState {
  AppException exception;
  AddressErrorState(this.exception);
}
