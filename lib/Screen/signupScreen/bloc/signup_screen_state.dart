import 'package:buypartsonline/Screen/signupScreen/data/model/signup_response_model.dart';
import 'package:buypartsonline/service/exception/exception.dart';

abstract class SignupScreenState {}

class SignupInitialState extends SignupScreenState {}

class SignupLoadingBeginState extends SignupScreenState {}

class SignupFormSubmitted extends SignupScreenState {
  final SignupResponseModel responseModel;

  SignupFormSubmitted(this.responseModel);
}

class SignupLoadingEndState extends SignupScreenState {}

class SignupErrorState extends SignupScreenState {
  AppException exception;
  SignupErrorState(this.exception);
}
