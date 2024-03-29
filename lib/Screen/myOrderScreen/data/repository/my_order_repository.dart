import 'package:buypartsonline/Screen/cartScreen/data/model/cart_address_response_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/bloc/my_order_screen_event.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/brand_response_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/cancel_order_response_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/order_part_detail_response_model.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/model/order_status_response_model.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:buypartsonline/service/network/network.dart';
import 'package:buypartsonline/service/network/network_string.dart';

abstract class IMyOrderRepository {
  Future getOrderStatus(GetMyOrderStatusEvent event);

  Future getOrderPartDetail(GetMyOrderPartDetailEvent event);

  Future getOrderAddress(GetMyOrderAddressEvent event);

  Future getOrderBrand(GetMyOrderBrandEvent event);

  Future cancelOrder(CancelMyOrderEvent event);
}

class MyOrderRepository implements IMyOrderRepository {
  static final MyOrderRepository _myOrderRepository = MyOrderRepository._init();

  factory MyOrderRepository() {
    return _myOrderRepository;
  }

  MyOrderRepository._init();

  @override
  Future getOrderStatus(GetMyOrderStatusEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['CustomerId'] = event.customerId;
      var result = await NetworkAPICall().post(getOrderStatusURL, body);
      OrderStatusResponseModel responseData =
          OrderStatusResponseModel.fromJson(result);
      resource = Resource(
        data: responseData,
        error: null,
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

  @override
  Future getOrderPartDetail(GetMyOrderPartDetailEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['OrderId'] = event.orderId;
      var result = await NetworkAPICall().post(getOrderPartDetailURL, body);
      OrderPartDetailResponseModel responseData =
          OrderPartDetailResponseModel.fromJson(result);
      resource = Resource(
        data: responseData,
        error: null,
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

  @override
  Future getOrderAddress(GetMyOrderAddressEvent event) async {
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

  @override
  Future getOrderBrand(GetMyOrderBrandEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      var result = await NetworkAPICall().post(getBrandURL, body);
      BrandResponseModel responseData = BrandResponseModel.fromJson(result);
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

  @override
  Future cancelOrder(CancelMyOrderEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['OrderId'] = event.orderId;
      body['CustomerId'] = event.customerId;

      var result = await NetworkAPICall().post(cancelOrderURL, body);
      CancelOrderResponseModel responseData =
          CancelOrderResponseModel.fromJson(result);
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
