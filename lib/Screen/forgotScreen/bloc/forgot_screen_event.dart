import 'package:equatable/equatable.dart';

abstract class ForgotScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OtpForForgotPasswordEvent extends ForgotScreenEvent {
  final String? mobileNumber;

  OtpForForgotPasswordEvent({this.mobileNumber});

  @override
  List<Object?> get props => [mobileNumber];
}

class UpdatePasswordEvent extends ForgotScreenEvent {
  final String? mobileNumber;
  final String? password;

  UpdatePasswordEvent({this.mobileNumber, this.password});

  @override
  List<Object?> get props => [mobileNumber, password];
}
