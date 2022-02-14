import 'package:buypartsonline/Screen/loginScreen/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginBloc() : super(LoginInitialState());

  @override
  Stream<LoginScreenState> mapEventToState(LoginScreenEvent event) async* {
    if (event is LoginPerformLoginEvent) {
      yield LoginLoadingBeginState();
      yield LoginLoadingEndState();
    }
  }
}
