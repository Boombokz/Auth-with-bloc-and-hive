import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:loyalty_app_flutter/data/models/user.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());

  var usersBox = Hive.box('users');
  var currentUserBox = Hive.box('currentUser');

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginStartEvent) {
      yield LoginLoadingState();
      try {
        if (usersBox.containsKey(event.login)) {
          User user = usersBox.get(event.login);
          if (user.password == event.password) {
            currentUserBox.put('currentUser', usersBox.get(event.login));
            yield LoginCompletedState();
          } else {
            yield LoginFailedState(errorMessage: 'Неверный пароль');
          }
        } else {
          yield LoginFailedState(errorMessage: 'Пользователь не найден');
        }
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        yield LoginFailedState(errorMessage: 'Error');
      }
    }
    if (event is LogOutEvent) {
      currentUserBox.clear();
      yield LoginInitialState();
    }
  }
}
