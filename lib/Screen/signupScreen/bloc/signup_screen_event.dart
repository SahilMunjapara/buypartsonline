import 'package:equatable/equatable.dart';

abstract class SignupScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupPerformSignupEvent extends SignupScreenEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  SignupPerformSignupEvent({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, phoneNumber, password];
}
