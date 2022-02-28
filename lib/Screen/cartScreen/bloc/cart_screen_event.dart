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
