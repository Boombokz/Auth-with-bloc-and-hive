import 'package:flutter/material.dart';
import 'package:loyalty_app_flutter/data/models/user.dart';
import 'package:loyalty_app_flutter/screens/auth_screen/screen.dart';
import 'package:loyalty_app_flutter/screens/main_screen/screen.dart';
import 'package:loyalty_app_flutter/screens/program_screen/screen.dart';
import 'package:loyalty_app_flutter/screens/registration_screen/screen.dart';

class RouteGenerator {
  static const String authScreen = '/';
  static const String registerScreen = 'RegistrationScreen';
  static const String mainScreen = 'MainScreen';
  static const String programScreen = 'ProgramScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authScreen:
        return MaterialPageRoute(builder: (_) => AuthScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case programScreen:
        return MaterialPageRoute(
            builder: (_) => ProgramScreen(
                  currentUser: settings.arguments as User,
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Страница не существует'),
            ),
          ),
        );
    }
  }
}
