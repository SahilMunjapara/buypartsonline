import 'package:buypartsonline/Screen/forgotScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/forgotScreen/data/repository/forgot_repository.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotBloc extends Bloc<ForgotScreenEvent, ForgotScreenState> {
  ForgotBloc() : super(ForgotInitialState());
  final ForgotRepository _forgotRepository = ForgotRepository();

  @override
  Stream<ForgotScreenState> mapEventToState(ForgotScreenEvent event) async* {
    if (event is OtpForForgotPasswordEvent) {
      yield ForgotLoadingBeginState();
      Resource resource = await _forgotRepository.sendOtpForForgot(event);
      if (resource.data != null) {
        yield OtpForForgotPasswordState(resource.data);
      } else {
        yield ForgotErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield ForgotLoadingEndState();
    }
    if (event is UpdatePasswordEvent) {
      yield ForgotLoadingBeginState();
      Resource resource = await _forgotRepository.updatePassword(event);
      if (resource.data != null) {
        yield UpdatePasswordState(resource.data);
      } else {
        yield ForgotErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield ForgotLoadingEndState();
    }
  }
}
