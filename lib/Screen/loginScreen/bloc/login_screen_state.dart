import 'package:buypartsonline/Screen/loginScreen/data/model/login_response_model.dart';
import 'package:buypartsonline/service/exception/exception.dart';

abstract class LoginScreenState {}

class LoginInitialState extends LoginScreenState {}

class LoginLoadingBeginState extends LoginScreenState {}

class LoginFormSubmitted extends LoginScreenState {
  final LoginResponseModel responseModel;
  LoginFormSubmitted(this.responseModel);
}

class LoginLoadingEndState extends LoginScreenState {}

class LoginErrorState extends LoginScreenState {
  AppException exception;
  LoginErrorState(this.exception);
}
