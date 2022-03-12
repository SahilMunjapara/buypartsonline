import 'package:buypartsonline/Screen/addressScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/addressScreen/data/model/add_address_response_model.dart';
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
}
