import 'package:buypartsonline/Screen/forgotScreen/data/model/otp_for_forgot_password_repository.dart';
import 'package:buypartsonline/Screen/forgotScreen/data/model/update_password_response_model.dart';
import 'package:buypartsonline/service/exception/exception.dart';

abstract class ForgotScreenState {}

class ForgotInitialState extends ForgotScreenState {}

class ForgotLoadingBeginState extends ForgotScreenState {}

class ForgotLoadingEndState extends ForgotScreenState {}

class OtpForForgotPasswordState extends ForgotScreenState {
  OtpForForgotPasswordResponseModel responseModel;
  OtpForForgotPasswordState(this.responseModel);
}

class UpdatePasswordState extends ForgotScreenState {
  UpdatePasswordResponseModel responseModel;
  UpdatePasswordState(this.responseModel);
}

class ForgotErrorState extends ForgotScreenState {
  AppException exception;
  ForgotErrorState(this.exception);
}
