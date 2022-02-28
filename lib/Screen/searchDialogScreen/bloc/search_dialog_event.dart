import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SearchDialogEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchByVehicleEvent extends SearchDialogEvent {}

class VehicleMakerEvent extends SearchDialogEvent {
  final String makerId;
  VehicleMakerEvent({required this.makerId});
  @override
  List<Object?> get props => [makerId];
}

class ModelLineEvent extends SearchDialogEvent {
  final String modelId;
  ModelLineEvent({required this.modelId});
  @override
  List<Object?> get props => [modelId];
}

class ModelYearAndModificationEvent extends SearchDialogEvent {
  final String modelLineId;
  ModelYearAndModificationEvent({required this.modelLineId});

  @override
  List<Object?> get props => [modelLineId];
}

class ModelCategoryEvent extends SearchDialogEvent {
  final String modelLineName;
  ModelCategoryEvent({required this.modelLineName});

  @override
  List<Object?> get props => [modelLineName];
}
