import 'package:buypartsonline/Screen/addressScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/addressScreen/data/repository/address_repository.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressBloc extends Bloc<AddressScreenEvent, AddressScreenState> {
  AddressBloc() : super(AddressInitialState());

  AddressRepository addressRepository = AddressRepository();

  @override
  Stream<AddressScreenState> mapEventToState(AddressScreenEvent event) async* {
    if (event is AddAddressEvent) {
      yield AddressLoadingBeginState();
      Resource resource = await addressRepository.addAddress(event);
      if (resource.data != null) {
        yield AddAddressState(resource.data);
      } else {
        yield AddressErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield AddressLoadingEndState();
    }
    if (event is GetAddressEvent) {
      yield AddressLoadingBeginState();
      Resource resource = await addressRepository.getAddressList(event);
      if (resource.data != null) {
        yield GetAddressState(resource.data);
      } else {
        yield AddressErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield AddressLoadingEndState();
    }
    if (event is SetDefaultAddressEvent) {
      yield AddressLoadingBeginState();
      Resource resource = await addressRepository.setDefaultAddress(event);
      if (resource.data != null) {
        yield SetDefaultAddressState(resource.data);
      } else {
        yield AddressErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield AddressLoadingEndState();
    }
    if (event is UpdateAddressEvent) {
      yield AddressLoadingBeginState();
      Resource resource = await addressRepository.updateAddress(event);
      if (resource.data != null) {
        yield UpdateAddressState(resource.data);
      } else {
        yield AddressErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield AddressLoadingEndState();
    }
    if (event is DeleteAddressEvent) {
      yield AddressLoadingBeginState();
      Resource resource = await addressRepository.deleteAddress(event);
      if (resource.data != null) {
        yield DeleteAddressState(resource.data);
      } else {
        yield AddressErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield AddressLoadingEndState();
    }
  }
}
