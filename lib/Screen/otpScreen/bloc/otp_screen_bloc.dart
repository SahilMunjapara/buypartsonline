import 'package:buypartsonline/Screen/otpScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/otpScreen/data/repository/otp_screen_repository.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpBloc extends Bloc<OtpScreenEvent, OtpScreenState> {
  OtpScreenRepository otpScreenRepository = OtpScreenRepository();
  OtpBloc() : super(OtpInitialState());

  @override
  Stream<OtpScreenState> mapEventToState(OtpScreenEvent event) async* {
    if (event is OtpVerifyEvent) {
      yield OtpLoadingBeginState();
      Resource resource = await otpScreenRepository.verifyOtp(event);
      if (resource.data != null) {
        yield OtpVerfiedState(resource.data);
      } else {
        yield OtpErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield OtpLoadingEndState();
    }
    if (event is ForgotOtpVerifyEvent) {
      yield OtpLoadingBeginState();
      Resource resource = await otpScreenRepository.verifyForgotOtp(event);
      if (resource.data != null) {
        yield ForgotOtpVerifyState(resource.data);
      } else {
        yield OtpErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield OtpLoadingEndState();
    }
  }
}
