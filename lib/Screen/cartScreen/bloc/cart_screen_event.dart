import 'package:equatable/equatable.dart';

abstract class CartScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartTotalItemEvent extends CartScreenEvent {
  final String? userId;

  CartTotalItemEvent({this.userId});
  @override
  List<Object?> get props => [userId];
}

class CartItemUpdateQtyEvent extends CartScreenEvent {
  final String? cartId;
  final String? cartQuantity;

  CartItemUpdateQtyEvent({this.cartId, this.cartQuantity});
  @override
  List<Object?> get props => [cartId, cartQuantity];
}

class CartItemRemoveEvent extends CartScreenEvent {
  final String? cartId;

  CartItemRemoveEvent({this.cartId});
  @override
  List<Object?> get props => [cartId];
}

class CartAddressEvent extends CartScreenEvent {
  final String? customerId;

  CartAddressEvent({this.customerId});
  @override
  List<Object?> get props => [customerId];
}

class CartDefaultSAddressEvent extends CartScreenEvent {
  final String? customerId;
  final String? addressId;

  CartDefaultSAddressEvent({this.customerId, this.addressId});
  @override
  List<Object?> get props => [customerId, addressId];
}

class AddCartAddressEvent extends CartScreenEvent {
  final String? customerId;
  final String? customerName;
  final String? customerPhone;
  final String? customerAddress;
  final String? addressPincode;
  final String? addressState;

  AddCartAddressEvent({
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
