import 'package:buypartsonline/Screen/modelViewScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/cart_add_response_model.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_response_model.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:buypartsonline/service/network/network.dart';
import 'package:buypartsonline/service/network/network_string.dart';

abstract class IModelViewRepository {
  Future fetchModelView(ModelViewDetailFetchEvent event);

  Future addCartPart(ModelViewAddCartEvent event);
}

class ModelViewRepository implements IModelViewRepository {
  static final ModelViewRepository _modelViewRepository =
      ModelViewRepository._init();

  factory ModelViewRepository() {
    return _modelViewRepository;
  }

  ModelViewRepository._init();

  @override
  Future fetchModelView(ModelViewDetailFetchEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};

      String endUrl = getModelDetailEndUrl(
        customerId: event.customerId,
        modelLineId: event.modelLineId,
        categoryId: event.categoryId,
        pageNo: event.pageNo,
      );

      var result = await NetworkAPICall().post(customModelURL + endUrl, body);

      ModelViewResponseModel responseData =
          ModelViewResponseModel.fromJson(result);
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
  Future addCartPart(ModelViewAddCartEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['CustomerId'] = event.customerId;
      body['PartId'] = event.partId;
      body['CartQuantity'] = event.cartQuantity;

      var result = await NetworkAPICall().post(addToCartURL, body);

      CartAddResponseModel responseData = CartAddResponseModel.fromJson(result);
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
}
