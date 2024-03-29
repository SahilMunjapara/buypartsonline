import 'package:buypartsonline/Screen/otpScreen/data/model/forgot_otp_verify_respose_model.dart';
import 'package:buypartsonline/Screen/otpScreen/data/model/otp_response_model.dart';
import 'package:buypartsonline/service/exception/exception.dart';

abstract class OtpScreenState {}

class OtpInitialState extends OtpScreenState {}

class OtpLoadingBeginState extends OtpScreenState {}

class OtpLoadingEndState extends OtpScreenState {}

class OtpVerfiedState extends OtpScreenState {
  OtpResponseModel responseModel;
  OtpVerfiedState(this.responseModel);
}

class ForgotOtpVerifyState extends OtpScreenState {
  ForgotOtpVerifyResponseModel responseModel;
  ForgotOtpVerifyState(this.responseModel);
}

class OtpErrorState extends OtpScreenState {
  AppException exception;
  OtpErrorState(this.exception);
}
