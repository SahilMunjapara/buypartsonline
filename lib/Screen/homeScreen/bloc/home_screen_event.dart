import 'package:equatable/equatable.dart';

abstract class HomeScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeScreenBannerEvent extends HomeScreenEvent {}

class HomeScreenCategoryEvent extends HomeScreenEvent {}

class HomeCartCountEvent extends HomeScreenEvent {
  final String? userId;

  HomeCartCountEvent({this.userId});
  @override
  List<Object?> get props => [userId];
}
