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

class GetAddressEvent extends AddressScreenEvent {
  final String? customerId;

  GetAddressEvent({this.customerId});
  @override
  List<Object?> get props => [customerId];
}

class SetDefaultAddressEvent extends AddressScreenEvent {
  final String? customerId;
  final String? addressId;

  SetDefaultAddressEvent({this.customerId, this.addressId});

  @override
  List<Object?> get props => [customerId, addressId];
}

class UpdateAddressEvent extends AddressScreenEvent {
  final String? addressId;
  final String? customerName;
  final String? customerPhone;
  final String? customerAddress;
  final String? addressPincode;
  final String? addressState;

  UpdateAddressEvent({
    this.addressId,
    this.customerName,
    this.customerPhone,
    this.customerAddress,
    this.addressPincode,
    this.addressState,
  });

  @override
  List<Object?> get props => [
        addressId,
        customerName,
        customerPhone,
        customerAddress,
        addressPincode,
        addressState
      ];
}

class DeleteAddressEvent extends AddressScreenEvent {
  final String? addressId;

  DeleteAddressEvent({this.addressId});

  @override
  List<Object?> get props => [addressId];
}
