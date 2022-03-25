import 'package:buypartsonline/Screen/searchDialogScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/searchDialogScreen/data/repository/search_dialog_repository.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDialogBloc extends Bloc<SearchDialogEvent, SearchDialogState> {
  SearchDialogBloc() : super(SearchDialogInitialState());
  final SearchDialogRepository _searchDialogRepository =
      SearchDialogRepository();

  @override
  Stream<SearchDialogState> mapEventToState(SearchDialogEvent event) async* {
    if (event is SearchByVehicleEvent) {
      yield SearchDataIsLoadingState();
      Resource resource =
          await _searchDialogRepository.getSearchByVehicleData();
      if (resource.data != null) {
        yield SearchByVehicleState(resource.data);
      } else {
        yield SearchDialogErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield SearchDataIsLoadingEndState();
    }
    if (event is VehicleMakerEvent) {
      yield SearchDataIsLoadingState();
      Resource resource = await _searchDialogRepository.getMakerData(event);
      if (resource.data != null) {
        yield VehicleMakerState(resource.data);
      } else {
        yield SearchDialogErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield SearchDataIsLoadingEndState();
    }
    if (event is ModelLineEvent) {
      yield SearchDataIsLoadingState();
      Resource resource = await _searchDialogRepository.getModelLineData(event);
      if (resource.data != null) {
        yield ModelLineState(resource.data);
      } else {
        yield SearchDialogErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield SearchDataIsLoadingEndState();
    }
    if (event is ModelModificationEvent) {
      yield SearchDataIsLoadingState();
      Resource resource =
          await _searchDialogRepository.getModelModification(event);
      if (resource.data != null) {
        yield ModelModificationState(resource.data);
      } else {
        yield SearchDialogErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield SearchDataIsLoadingEndState();
    }
    if (event is ModelYearEvent) {
      yield SearchDataIsLoadingState();
      Resource resource = await _searchDialogRepository.getModelYear(event);
      if (resource.data != null) {
        yield ModelYearState(resource.data);
      } else {
        yield SearchDialogErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield SearchDataIsLoadingEndState();
    }
    if (event is ModelCategoryEvent) {
      yield SearchDataIsLoadingState();
      Resource resource = await _searchDialogRepository.getModelCategory(event);
      if (resource.data != null) {
        yield ModelCategoryState(resource.data);
      } else {
        yield SearchDialogErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield SearchDataIsLoadingEndState();
    }
  }
}
