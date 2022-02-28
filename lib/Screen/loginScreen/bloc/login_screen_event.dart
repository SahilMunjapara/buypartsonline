import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginPerformLoginEvent extends LoginScreenEvent {
  final String phoneNumber;
  final String password;

  LoginPerformLoginEvent({required this.phoneNumber, required this.password});

  @override
  List<Object?> get props => [phoneNumber, password];
}
