import 'package:buypartsonline/Screen/modelViewScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/repository/model_view_repository.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModelViewBloc extends Bloc<ModelViewScreenEvent, ModelViewScreenState> {
  ModelViewBloc() : super(ModelViewInitialState());
  final ModelViewRepository _modelViewRepository = ModelViewRepository();

  @override
  Stream<ModelViewScreenState> mapEventToState(
      ModelViewScreenEvent event) async* {
    if (event is ModelViewDetailFetchEvent) {
      yield ModelViewIsLoadingBeginState();
      Resource resource = await _modelViewRepository.fetchModelView(event);
      if (resource.data != null) {
        yield ModelViewLoadedState(resource.data);
      } else {
        yield ModelViewErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield ModelViewIsLoadingEndState();
    }

    if (event is ModelViewAddCartEvent) {
      yield CartAddIsLoadingBeginState();
      Resource resource = await _modelViewRepository.addCartPart(event);
      if (resource.data != null) {
        yield ModelViewCartAddedState(resource.data);
      } else {
        yield ModelViewErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield CartAddIsLoadingEndState();
    }
  }
}
