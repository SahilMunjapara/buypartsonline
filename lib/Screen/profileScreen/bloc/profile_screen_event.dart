import 'package:equatable/equatable.dart';

abstract class ProfileScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProfileDetailEvent extends ProfileScreenEvent {
  final String? customerId;

  GetProfileDetailEvent({this.customerId});

  @override
  List<Object?> get props => [customerId];
}

class UpdateProfileEvent extends ProfileScreenEvent {
  final String? customerId;
  final String? customerCompanyName;
  final String? customerName;
  final String? customerMobileNumber;
  final String? customerEmail;

  UpdateProfileEvent({
    this.customerId,
    this.customerCompanyName,
    this.customerName,
    this.customerMobileNumber,
    this.customerEmail,
  });

  @override
  List<Object?> get props => [
        customerId,
        customerCompanyName,
        customerName,
        customerMobileNumber,
        customerEmail
      ];
}
