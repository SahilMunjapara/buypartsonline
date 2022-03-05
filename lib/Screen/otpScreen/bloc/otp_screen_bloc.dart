import 'package:buypartsonline/Screen/otpScreen/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpBloc extends Bloc<OtpScreenEvent, OtpScreenState> {
  OtpBloc() : super(OtpInitialState());

  @override
  Stream<OtpScreenState> mapEventToState(OtpScreenEvent event) async* {}
  
}
