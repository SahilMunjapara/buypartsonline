import 'package:buypartsonline/Screen/signupScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/signupScreen/data/signup_repository.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupScreenEvent, SignupScreenState> {
  SignupBloc() : super(SignupInitialState());

  @override
  Stream<SignupScreenState> mapEventToState(SignupScreenEvent event) async* {
    if (event is SignupPerformSignupEvent) {
      yield SignupLoadingBeginState();
      Resource resource = await SignupRepository().performSignup(event);
      if (resource.statusCode == null) {
        yield SignupFormSubmitted(resource.data);
      } else {
        yield SignupErrorState(
            AppException.decodeExceptionData(jsonString: resource.error ?? ''));
      }
      yield SignupLoadingEndState();
    }
  }
}
