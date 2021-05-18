part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitialState extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationFailedState extends RegistrationState {
  final String errorMessage;

  RegistrationFailedState({required this.errorMessage});
}
