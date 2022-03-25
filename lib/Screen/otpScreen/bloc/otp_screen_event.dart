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
