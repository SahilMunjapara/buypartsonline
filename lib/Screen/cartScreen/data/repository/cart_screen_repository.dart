import 'package:buypartsonline/Screen/addressScreen/data/model/add_address_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_address_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_call_back_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_default_address_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_detail_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_remove_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_update_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/default_address_detail_response_model.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:buypartsonline/service/network/network.dart';
import 'package:buypartsonline/service/network/network_string.dart';

class CartReposiory {
  static final CartReposiory _cartReposiory = CartReposiory._init();

  factory CartReposiory() {
    return _cartReposiory;
  }

  CartReposiory._init();

  Future getCartDetail(CartTotalItemEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['CustomerId'] = event.userId;

      var result = await NetworkAPICall().post(getCartDetailsURL, body);
      CartDetailResponseModel responseData =
          CartDetailResponseModel.fromJson(result);
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

  Future updateCartDetail(CartItemUpdateQtyEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['CartId'] = event.cartId;
      body['CartQuantity'] = event.cartQuantity;

      var result = await NetworkAPICall().post(updateCartQty, body);
      CartUpdateResponseModel responseData =
          CartUpdateResponseModel.fromJson(result);
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

  Future removeCartItem(CartItemRemoveEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['CartId'] = event.cartId;

      var result = await NetworkAPICall().post(removeCart, body);
      CartRemoveResponseModel responseData =
          CartRemoveResponseModel.fromJson(result);
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

  Future getCartAddress(CartAddressEvent event) async {
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

  Future setCartDefaultAddress(CartDefaultSAddressEvent event) async {
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

  Future getCartDefaultAddress(GetDefaultAddresEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['CustomerId'] = event.customerId;

      var result = await NetworkAPICall().post(getDefaultAddressURL, body);
      DefaultAddressDetailResponseModel responseData =
          DefaultAddressDetailResponseModel.fromJson(result);
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

  Future callBackURL(CartCallBackEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['order_id'] = '';
      body['razorpay_payment_id'] = event.razorPayId ?? '';
      body['error'] = '';
      String endURL = getCallBackEndUrl(
        defaultAddressId: event.defaultAddressId,
        customerId: event.customerId,
        deliveryCharge: event.deliveryCharge,
        courierId: event.courierId,
        paymentType: event.paymentType,
      );

      var result =
          await NetworkAPICall().post(endURL, body, isCallBackUrl: true);
      CallBackResponseModel responseModel =
          CallBackResponseModel.fromJson(result);
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

  Future addCartAddress(AddCartAddressEvent event) async {
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
