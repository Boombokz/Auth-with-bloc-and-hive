import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app_flutter/constants/router/router.dart';
import 'package:loyalty_app_flutter/screens/auth_screen/blocs/login_bloc/login_bloc.dart';
import 'package:loyalty_app_flutter/themes/text_theme.dart';

class AuthScreen extends StatelessWidget {
  final TextEditingController loginController = TextEditingController(text: 'Boombokz');
  final TextEditingController passwordController = TextEditingController(text: '1234');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                controller: passwordController,
                textAlign: TextAlign.left,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  labelText: 'Пароль',
                  hintText: 'Введите пароль',
                ),
              ),
              SizedBox(height: 30),
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginCompletedState) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteGenerator.mainScreen,
                          (Route<dynamic> route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoginInitialState) {
                    return ElevatedButton(
                      onPressed: () {
                        if (loginController.text != '' &&
                            passwordController.text != '') {
                          BlocProvider.of<LoginBloc>(context)
                            ..add(LoginStartEvent(
                                login: loginController.text,
                                password: passwordController.text));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Введите логин и пароль')));
                        }
                      },
                      child: Text('Войти'),
                    );
                  } else if (state is LoginLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoginFailedState) {
                    return ElevatedButton(
                    child: Text('${state.errorMessage}'),
                        onPressed: () {
                      if (loginController.text != '' &&
                          passwordController.text != '') {
                        BlocProvider.of<LoginBloc>(context)
                          ..add(LoginStartEvent(
                              login: loginController.text,
                              password: passwordController.text));
                      }
                    });
                  } else {
                    return Offstage();
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteGenerator.registerScreen);
                },
                child: Text('Зарегистрироваться'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
