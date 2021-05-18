import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:loyalty_app_flutter/data/models/user.dart';
import 'package:loyalty_app_flutter/screens/auth_screen/blocs/login_bloc/login_bloc.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({required this.loginBloc})
      : super(RegistrationInitialState());

  LoginBloc loginBloc;

  var usersBox = Hive.box('users');
  var currentUserBox = Hive.box('currentUser');

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    if (event is RegistrationStartEvent) {
      yield RegistrationLoadingState();
      try {
        if (usersBox.containsKey(event.newUser.login)) {
          yield RegistrationFailedState(errorMessage: 'Такой логин существует');
        } else {
          usersBox.put(event.newUser.login, event.newUser);
          loginBloc..add(LoginStartEvent(
              login: event.newUser.login, password: event.newUser.password));
          yield RegistrationInitialState();
        }
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield RegistrationFailedState(
            errorMessage: 'Произошла ошибка, попробуйте снова');
      }
    }
  }
}
