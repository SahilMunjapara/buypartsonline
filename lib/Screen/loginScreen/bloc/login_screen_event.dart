abstract class LoginScreenEvent {}

class LoginPerformLoginEvent extends LoginScreenEvent {
  final String username;
  final String password;

  LoginPerformLoginEvent(this.username, this.password);
}
