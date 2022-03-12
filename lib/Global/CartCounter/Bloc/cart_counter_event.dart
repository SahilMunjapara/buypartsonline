import 'package:equatable/equatable.dart';

abstract class CartCounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartCounterTotalEvent extends CartCounterEvent {
  final String? customerId;
  CartCounterTotalEvent({this.customerId});

  @override
  List<Object?> get props => [customerId];
}
