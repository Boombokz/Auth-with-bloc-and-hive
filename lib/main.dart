import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loyalty_app_flutter/constants/router/router.dart';
import 'package:loyalty_app_flutter/data/models/user.dart';
import 'package:loyalty_app_flutter/screens/auth_screen/blocs/login_bloc/login_bloc.dart';
import 'package:loyalty_app_flutter/screens/registration_screen/blocs/registration_bloc/registration_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox('users');
  await Hive.openBox('currentUser');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(
            create: (context) => RegistrationBloc(
                loginBloc: BlocProvider.of<LoginBloc>(context))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteGenerator.authScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
