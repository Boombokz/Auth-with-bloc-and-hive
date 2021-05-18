part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginCompletedState extends LoginState {

}

class LoginFailedState extends LoginState {
  final String errorMessage;

  LoginFailedState({required this.errorMessage});
}
