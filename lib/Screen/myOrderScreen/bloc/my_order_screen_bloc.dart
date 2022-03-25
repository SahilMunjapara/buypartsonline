import 'package:buypartsonline/Screen/myOrderScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/myOrderScreen/data/repository/my_order_repository.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderBloc extends Bloc<MyOrderScreenEvent, MyOrderScreenState> {
  MyOrderBloc() : super(MyOrderInitialState());

  final MyOrderRepository _myOrderRepository = MyOrderRepository();

  @override
  Stream<MyOrderScreenState> mapEventToState(MyOrderScreenEvent event) async* {
    if (event is GetMyOrderStatusEvent) {
      yield MyOrderLoadingBeginState();
      Resource resource = await _myOrderRepository.getOrderStatus(event);
      if (resource.data != null) {
        yield GetMyOrderStatusState(resource.data);
      } else {
        yield MyOrderErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield MyOrderLoadingEndState();
    }

    if (event is GetMyOrderPartDetailEvent) {
      yield MyOrderLoadingBeginState();
      Resource resource = await _myOrderRepository.getOrderPartDetail(event);
      if (resource.data != null) {
        yield GetMyOrderPartDetailState(resource.data);
      } else {
        yield MyOrderErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield MyOrderLoadingEndState();
    }
    if (event is GetMyOrderAddressEvent) {
      yield MyOrderLoadingBeginState();
      Resource resource = await _myOrderRepository.getOrderAddress(event);
      if (resource.data != null) {
        yield GetMyOrderAddressState(resource.data);
      } else {
        yield MyOrderErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield MyOrderLoadingEndState();
    }
    if (event is GetMyOrderBrandEvent) {
      yield MyOrderLoadingBeginState();
      Resource resource = await _myOrderRepository.getOrderBrand(event);
      if (resource.data != null) {
        yield GetMyOrderBrandState(resource.data);
      } else {
        yield MyOrderErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield MyOrderLoadingEndState();
    }
  }
}
