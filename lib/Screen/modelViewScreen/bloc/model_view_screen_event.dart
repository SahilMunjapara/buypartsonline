import 'package:equatable/equatable.dart';

abstract class ModelViewScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ModelViewDetailFetchEvent extends ModelViewScreenEvent {
  final String? customerId;
  final String? modelLineId;
  final String? categoryId;
  final String? pageNo;

  ModelViewDetailFetchEvent(
      {this.customerId, this.modelLineId, this.categoryId, this.pageNo});

  @override
  List<Object?> get props => [customerId, modelLineId, categoryId];
}
