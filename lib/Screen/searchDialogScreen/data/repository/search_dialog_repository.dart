import 'package:buypartsonline/Screen/searchDialogScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/searchDialogScreen/data/model/model_category_response_model.dart';
import 'package:buypartsonline/Screen/searchDialogScreen/data/model/model_line_response_model.dart';
import 'package:buypartsonline/Screen/searchDialogScreen/data/model/model_year_and_modification_response_model.dart';
import 'package:buypartsonline/Screen/searchDialogScreen/data/model/search_by_vehicle_response_model.dart';
import 'package:buypartsonline/Screen/searchDialogScreen/data/model/vehicle_maker_response_model.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:buypartsonline/service/network/network.dart';
import 'package:buypartsonline/service/network/network_string.dart';

class SearchDialogRepository {
  static final SearchDialogRepository _searchDialogRepository =
      SearchDialogRepository._init();

  factory SearchDialogRepository() {
    return _searchDialogRepository;
  }

  SearchDialogRepository._init();

  Future getSearchByVehicleData() async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      var result = await NetworkAPICall().post(getSearchVehicleURL, body);
      SearchByVehicleResponseModel responseData =
          SearchByVehicleResponseModel.fromJson(result);
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

  Future getMakerData(VehicleMakerEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      var result =
          await NetworkAPICall().post(getVehicleMakerURL + event.makerId, body);
      VehicleMakerResponseModel responseData =
          VehicleMakerResponseModel.fromJson(result);
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

  Future getModelLineData(ModelLineEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      var result =
          await NetworkAPICall().post(getModelURL + event.modelId, body);
      ModelLineResponseModel responseData =
          ModelLineResponseModel.fromJson(result);
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

  Future getModelModification(ModelModificationEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      var result = await NetworkAPICall()
          .post(getModelModificationURL + event.modelLineId, body);
      ModelYearAndModificationResponseModel responseData =
          ModelYearAndModificationResponseModel.fromJson(result);
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

  Future getModelYear(ModelYearEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      var result = await NetworkAPICall()
          .post(getModelYearURL + event.modelLineId, body);
      ModelYearAndModificationResponseModel responseData =
          ModelYearAndModificationResponseModel.fromJson(result);
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

  Future getModelCategory(ModelCategoryEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      var result = await NetworkAPICall()
          .post(getModelCategoryURL + event.modelLineName, body);
      ModelCategoryResponseModel responseData =
          ModelCategoryResponseModel.fromJson(result);
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
