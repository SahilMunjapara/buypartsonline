import 'package:buypartsonline/Screen/addressScreen/data/model/add_address_response_model.dart';
import 'package:buypartsonline/service/exception/exception.dart';

abstract class AddressScreenState {}

class AddressInitialState extends AddressScreenState {}

class AddAddressLoadingBeginState extends AddressScreenState {}

class AddAddressLoadingEndState extends AddressScreenState {}

class AddAddressState extends AddressScreenState {
  AddAddressResponseModel? responseModel;
  AddAddressState(this.responseModel);
}

class AddressErrorState extends AddressScreenState {
  AppException exception;
  AddressErrorState(this.exception);
}
