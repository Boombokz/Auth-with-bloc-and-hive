part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginStartEvent extends LoginEvent {
  final String login;
  final String password;
  LoginStartEvent({required this.login, required this.password});
}

class LogOutEvent extends LoginEvent {

}