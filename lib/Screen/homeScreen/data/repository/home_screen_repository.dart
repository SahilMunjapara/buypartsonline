import 'package:buypartsonline/Screen/cartScreen/data/model/cart_detail_response_model.dart';
import 'package:buypartsonline/Screen/homeScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/homeScreen/data/model/home_banner_response_model.dart';
import 'package:buypartsonline/Screen/homeScreen/data/model/home_category_response_model.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:buypartsonline/service/network/network.dart';
import 'package:buypartsonline/service/network/network_string.dart';

class HomeRepository {
  static final HomeRepository _homeRepository = HomeRepository._init();

  factory HomeRepository() {
    return _homeRepository;
  }
  HomeRepository._init();

  Future fetchBannerData() async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};

      var result = await NetworkAPICall().post(getBannerData, body);
      HomeBannerResponseModel responseData =
          HomeBannerResponseModel.fromJson(result);
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

  Future fetchCategoryData() async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};

      var result = await NetworkAPICall().post(getCategoryData, body);
      HomeCategoryResponseModel responseData =
          HomeCategoryResponseModel.fromJson(result);
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

  Future fetchCartCount(HomeCartCountEvent event) async {
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
}
