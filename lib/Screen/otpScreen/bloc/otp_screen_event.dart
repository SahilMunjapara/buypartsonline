import 'package:equatable/equatable.dart';

abstract class OtpScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OtpVerifyEvent extends OtpScreenEvent {
  final String? otp;
  final String? customerId;

  OtpVerifyEvent({this.otp, this.customerId});

  @override
  List<Object?> get props => [otp, customerId];
}

class ForgotOtpVerifyEvent extends OtpScreenEvent {
  final String? otp;
  final String? mobileNumber;

  ForgotOtpVerifyEvent({this.otp, this.mobileNumber});

  @override
  List<Object?> get props => [otp, mobileNumber];
}
