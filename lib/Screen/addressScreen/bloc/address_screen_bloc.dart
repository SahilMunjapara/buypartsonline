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
      yield AddAddressLoadingBeginState();
      Resource resource = await addressRepository.addAddress(event);
      if (resource.data != null) {
        yield AddAddressState(resource.data);
      } else {
        yield AddressErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield AddAddressLoadingEndState();
    }
  }
}
