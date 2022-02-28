import 'package:buypartsonline/Screen/cartScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_detail_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_remove_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/cart_update_response_model.dart';
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

      var result = await NetworkAPICall().post(getCartTotal, body);
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
}
