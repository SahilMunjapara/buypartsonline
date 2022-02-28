import 'package:buypartsonline/Screen/loginScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/loginScreen/data/repository/login_repository.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginBloc() : super(LoginInitialState());

  @override
  Stream<LoginScreenState> mapEventToState(LoginScreenEvent event) async* {
    if (event is LoginPerformLoginEvent) {
      yield LoginLoadingBeginState();
      Resource resource = await LoginRepository().performLogin(event);
      if (resource.data != null) {
        yield LoginFormSubmitted(resource.data);
      } else {
        yield LoginErrorState(
            AppException.decodeExceptionData(jsonString: resource.error ?? ''));
      }
      yield LoginLoadingEndState();
    }
  }
}
