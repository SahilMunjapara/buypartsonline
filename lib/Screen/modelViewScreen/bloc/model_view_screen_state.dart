import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_response_model.dart';
import 'package:buypartsonline/service/exception/exception.dart';

abstract class ModelViewScreenState {}

class ModelViewInitialState extends ModelViewScreenState {}

class ModelViewIsLoadingBeginState extends ModelViewScreenState {}

class ModelViewIsLoadingEndState extends ModelViewScreenState {}

class ModelViewLoadedState extends ModelViewScreenState {
  ModelViewResponseModel responseModel;
  ModelViewLoadedState(this.responseModel);
}

class ModelViewErrorState extends ModelViewScreenState {
  AppException exception;
  ModelViewErrorState(this.exception);
}
