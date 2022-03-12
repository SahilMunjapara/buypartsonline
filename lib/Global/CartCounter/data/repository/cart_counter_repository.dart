import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter_event.dart';
import 'package:buypartsonline/Global/CartCounter/data/model/cart_total_response_model.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:buypartsonline/service/network/network.dart';
import 'package:buypartsonline/service/network/network_string.dart';

class CartCounterRespository {
  static final CartCounterRespository _cartCounterRespository =
      CartCounterRespository._init();

  factory CartCounterRespository() {
    return _cartCounterRespository;
  }

  CartCounterRespository._init();

  Future getCounterTotal(CartCounterTotalEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['CustomerId'] = event.customerId;

      var result = await NetworkAPICall().post(getCartTotalURL, body);

      CartTotalResponseModel responseData =
          CartTotalResponseModel.fromJson(result);

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
