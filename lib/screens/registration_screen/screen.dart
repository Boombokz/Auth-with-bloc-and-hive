import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app_flutter/constants/router/router.dart';
import 'package:loyalty_app_flutter/data/models/user.dart';
import 'package:loyalty_app_flutter/screens/auth_screen/blocs/login_bloc/login_bloc.dart';
import 'package:loyalty_app_flutter/screens/registration_screen/blocs/registration_bloc/registration_bloc.dart';
import 'package:loyalty_app_flutter/themes/text_theme.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController checkPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: LoginBloc(),
      listener: (context, state) {
        if (state is LoginCompletedState) {
          print('state');
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteGenerator.mainScreen,
            (Route<dynamic> route) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Зарегистрироваться'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Loyalty HD',
                    style: TextThemes.header1,
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: loginController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(),
                      labelText: 'Логин',
                      hintText: 'Введите логин',
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: firstNameController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(),
                      labelText: 'Имя',
                      hintText: 'Введите имя',
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: lastNameController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(),
                      labelText: 'Фамилия',
                      hintText: 'Введите фамилию',
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: fatherNameController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      labelText: 'Отчество',
                      hintText: 'Введите отчество',
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: telephoneController,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      labelText: 'Номер телефона',
                      hintText: 'Введите номер телефона',
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: passwordController,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.phone,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      labelText: 'Пароль',
                      hintText: 'Введите пароль',
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: checkPasswordController,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.phone,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      labelText: 'Подтверждение пароля',
                      hintText: 'Подтвердите пароль',
                    ),
                  ),
                  SizedBox(height: 30),
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      if (state is RegistrationInitialState) {
                        return ElevatedButton(
                          onPressed: () {
                            if (passwordController.text ==
                                checkPasswordController.text) {
                              BlocProvider.of<RegistrationBloc>(context)
                                ..add(RegistrationStartEvent(
                                    newUser: User(
                                  login: loginController.text,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  password: passwordController.text,
                                  telephone: telephoneController.text,
                                  dateOfBirth: '',
                                  cardNumber: Random().nextInt(999999) + 100000,
                                  fatherName: fatherNameController.text,
                                  programName: 'Первая программа лояльности',
                                )));
                            }
                          },
                          child: Text('Зарегистрироваться'),
                        );
                      } else if (state is RegistrationFailedState) {
                        return ElevatedButton(
                          onPressed: () {
                            if (passwordController.text ==
                                checkPasswordController.text) {
                              BlocProvider.of<RegistrationBloc>(context)
                                ..add(RegistrationStartEvent(
                                    newUser: User(
                                  login: loginController.text,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  password: passwordController.text,
                                  telephone: telephoneController.text,
                                  dateOfBirth: '',
                                  cardNumber: Random().nextInt(999999) + 100000,
                                  fatherName: fatherNameController.text,
                                  programName: 'Первая программа лояльности',
                                )));
                            }
                          },
                          child: Text('${state.errorMessage}'),
                        );
                      } else {
                        return Offstage();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
