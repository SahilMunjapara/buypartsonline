import 'package:buypartsonline/Screen/modelViewScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_response_model.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:buypartsonline/service/network/network.dart';
import 'package:buypartsonline/service/network/network_string.dart';

class ModelViewRepository {
  static final ModelViewRepository _modelViewRepository =
      ModelViewRepository._init();

  factory ModelViewRepository() {
    return _modelViewRepository;
  }

  ModelViewRepository._init();

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
}
