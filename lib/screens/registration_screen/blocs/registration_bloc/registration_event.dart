part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class RegistrationStartEvent extends RegistrationEvent {
  final User newUser;

  RegistrationStartEvent({required this.newUser});
}


