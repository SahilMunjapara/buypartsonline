import 'package:buypartsonline/Screen/addressScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/addressScreen/data/model/add_address_response_model.dart';
import 'package:buypartsonline/Screen/addressScreen/data/model/delete_address_response_model.dart';
import 'package:buypartsonline/Screen/addressScreen/data/model/update_address_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_address_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_default_address_response_model.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:buypartsonline/service/network/network.dart';
import 'package:buypartsonline/service/network/network_string.dart';

class AddressRepository {
  static final AddressRepository _addressRepository = AddressRepository._init();

  factory AddressRepository() {
    return _addressRepository;
  }

  AddressRepository._init();

  Future addAddress(AddAddressEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['CustomerId'] = event.customerId;
      body['AddressCompanyName'] = '';
      body['AddressForName'] = event.customerName;
      body['AddressPhoneNo'] = event.customerPhone;
      body['AddressEmailId'] = '';
      body['AddressName'] = event.customerAddress;
      body['AddressCityName'] = '';
      body['AddressPincode'] = event.addressPincode;
      body['AddressState'] = event.addressState;
      body['AddressCountry'] = 'india';

      var result = await NetworkAPICall().post(addAddressURL, body);
      AddAddressResponseModel responseModel =
          AddAddressResponseModel.fromJson(result);
      resource = Resource(
        error: null,
        data: responseModel,
      );
    } catch (e, stackTrace) {
      resource = Resource(
        error: e.toString(),
        data: null,
      );
      print('ERROR: $e');
      print('STACKTRACE: $stackTrace');
    }
    return resource;
  }

  Future getAddressList(GetAddressEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['CustomerId'] = event.customerId;

      var result = await NetworkAPICall().post(allAddressURL, body);
      CartAddressResponseModel responseData =
          CartAddressResponseModel.fromJson(result);
      resource = Resource(
        error: null,
        data: responseData,
      );
    } catch (e, stackTrace) {
      resource = Resource(
        error: e.toString(),
        data: null,
      );
      print('ERROR: $e');
      print('STACKTRACE: $stackTrace');
    }
    return resource;
  }

  Future setDefaultAddress(SetDefaultAddressEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['CustomerId'] = event.customerId;
      body['AddressId'] = event.addressId;

      var result = await NetworkAPICall().post(setDefaultAddressURL, body);
      CartDefaultAddressResponseModel responseData =
          CartDefaultAddressResponseModel.fromJson(result);
      resource = Resource(
        error: null,
        data: responseData,
      );
    } catch (e, stackTrace) {
      resource = Resource(
        error: e.toString(),
        data: null,
      );
      print('ERROR: $e');
      print('STACKTRACE: $stackTrace');
    }
    return resource;
  }

  Future updateAddress(UpdateAddressEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['AddressId'] = event.addressId;
      body['AddressCompanyName'] = '';
      body['AddressForName'] = event.customerName;
      body['AddressPhoneNo'] = event.customerPhone;
      body['AddressEmailId'] = '';
      body['AddressName'] = event.customerAddress;
      body['AddressCityName'] = '';
      body['AddressPincode'] = event.addressPincode;
      body['AddressState'] = event.addressState;
      body['AddressCountry'] = 'india';

      var result = await NetworkAPICall().post(updateAddressURL, body);
      UpdateAddressResponseModel responseModel =
          UpdateAddressResponseModel.fromJson(result);
      resource = Resource(
        error: null,
        data: responseModel,
      );
    } catch (e, stackTrace) {
      resource = Resource(
        error: e.toString(),
        data: null,
      );
      print('ERROR: $e');
      print('STACKTRACE: $stackTrace');
    }
    return resource;
  }

  Future deleteAddress(DeleteAddressEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['AddressId'] = event.addressId;

      var result = await NetworkAPICall().post(deleteAddressURL, body);
      DeleteAddressResponseModel responseModel =
          DeleteAddressResponseModel.fromJson(result);
      resource = Resource(
        error: null,
        data: responseModel,
      );
    } catch (e, stackTrace) {
      resource = Resource(
        error: e.toString(),
        data: null,
      );
      print('ERROR: $e');
      print('STACKTRACE: $stackTrace');
    }
    return resource;
  }
}
