import 'package:equatable/equatable.dart';

abstract class AddressScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddAddressEvent extends AddressScreenEvent {
  final String? customerId;
  final String? customerName;
  final String? customerPhone;
  final String? customerAddress;
  final String? addressPincode;
  final String? addressState;

  AddAddressEvent({
    this.customerId,
    this.customerName,
    this.customerPhone,
    this.customerAddress,
    this.addressPincode,
    this.addressState,
  });

  @override
  List<Object?> get props => [
        customerId,
        customerName,
        customerPhone,
        customerAddress,
        addressPincode,
        addressState
      ];
}
