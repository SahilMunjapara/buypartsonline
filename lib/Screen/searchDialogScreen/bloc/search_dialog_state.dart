import 'package:buypartsonline/Screen/searchDialogScreen/data/model/model_category_response_model.dart';
import 'package:buypartsonline/Screen/searchDialogScreen/data/model/model_line_response_model.dart';
import 'package:buypartsonline/Screen/searchDialogScreen/data/model/model_year_and_modification_response_model.dart';
import 'package:buypartsonline/Screen/searchDialogScreen/data/model/search_by_vehicle_response_model.dart';
import 'package:buypartsonline/Screen/searchDialogScreen/data/model/vehicle_maker_response_model.dart';
import 'package:buypartsonline/service/exception/exception.dart';

abstract class SearchDialogState {}

class SearchDialogInitialState extends SearchDialogState {}

class SearchDataIsLoadingState extends SearchDialogState {}

class SearchDataIsLoadingEndState extends SearchDialogState {}

class SearchByVehicleState extends SearchDialogState {
  SearchByVehicleResponseModel responseModel;
  SearchByVehicleState(this.responseModel);
}

class VehicleMakerState extends SearchDialogState {
  VehicleMakerResponseModel responseModel;
  VehicleMakerState(this.responseModel);
}

class ModelLineState extends SearchDialogState {
  ModelLineResponseModel responseModel;
  ModelLineState(this.responseModel);
}

class ModelModificationState extends SearchDialogState {
  ModelYearAndModificationResponseModel responseModel;
  ModelModificationState(this.responseModel);
}

class ModelYearState extends SearchDialogState {
  ModelYearAndModificationResponseModel responseModel;
  ModelYearState(this.responseModel);
}

class ModelCategoryState extends SearchDialogState {
  ModelCategoryResponseModel responseModel;
  ModelCategoryState(this.responseModel);
}

class SearchDialogErrorState extends SearchDialogState {
  AppException exception;
  SearchDialogErrorState(this.exception);
}
