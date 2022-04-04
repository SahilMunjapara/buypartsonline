import 'package:equatable/equatable.dart';

abstract class MyOrderScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetMyOrderStatusEvent extends MyOrderScreenEvent {
  final String? customerId;

  GetMyOrderStatusEvent({this.customerId});

  @override
  List<Object?> get props => [customerId];
}

class GetMyOrderPartDetailEvent extends MyOrderScreenEvent {
  final String? orderId;

  GetMyOrderPartDetailEvent({this.orderId});

  @override
  List<Object?> get props => [orderId];
}

class GetMyOrderAddressEvent extends MyOrderScreenEvent {
  final String? customerId;

  GetMyOrderAddressEvent({this.customerId});

  @override
  List<Object?> get props => [customerId];
}

class GetMyOrderBrandEvent extends MyOrderScreenEvent {}

class CancelMyOrderEvent extends MyOrderScreenEvent {
  final String? orderId;
  final String? customerId;

  CancelMyOrderEvent({this.orderId, this.customerId});

  @override
  List<Object?> get props => [orderId, customerId];
}
