import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:loyalty_app_flutter/constants/router/router.dart';
import 'package:loyalty_app_flutter/data/models/user.dart';
import 'package:loyalty_app_flutter/screens/auth_screen/blocs/login_bloc/login_bloc.dart';
import 'package:loyalty_app_flutter/themes/text_theme.dart';
import 'package:loyalty_app_flutter/screens/registration_screen/blocs/registration_bloc/registration_bloc.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var usersBox = Hive.box('users');

  var currentUserBox = Hive.box('currentUser');

  late User currentUser;

  TextEditingController lastNameController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController fatherNameController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController telephoneController = TextEditingController();

  @override
  void initState() {
    currentUser = currentUserBox.get('currentUser');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Профиль'),
        centerTitle: true,
        actions: [
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
            onPressed: () {
              BlocProvider.of<LoginBloc>(context).add(LogOutEvent());

              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteGenerator.authScreen,
                (Route<dynamic> route) => false,
              );
            },
            child: Text(
              'Log out',
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: Text(
              '${currentUser.login}',
              style: TextThemes.header1,
            )),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteGenerator.programScreen,
                    arguments: currentUser);
              },
              child: Text(
                '${currentUser.programName}',
                style: TextThemes.header1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    'Фамилия: ',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Expanded(
                    child: TextField(
                      controller: lastNameController
                        ..text = currentUser.lastName,
                      onSubmitted: (newValue) {
                        if (newValue != '') {
                          lastNameController..text = newValue;
                          currentUser.lastName = newValue;
                          currentUserBox.put(
                              'currentUser', currentUser..lastName = newValue);
                          usersBox.put(currentUser.login,
                              currentUser..lastName = newValue);
                        }
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        isDense: true,
                        suffixIcon: Icon(Icons.backpack_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    'Имя: ',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Expanded(
                    child: TextField(
                      controller: firstNameController
                        ..text = currentUser.firstName,
                      onSubmitted: (newValue) {
                        if (newValue != '') {
                          firstNameController..text = newValue;
                          currentUser.firstName = newValue;
                          currentUserBox.put(
                              'currentUser', currentUser..firstName = newValue);
                          usersBox.put(currentUser.login,
                              currentUser..firstName = newValue);
                        }
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        isDense: true,
                        suffixIcon: Icon(Icons.backpack_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    'Отчество: ',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Expanded(
                    child: TextField(
                      controller: fatherNameController
                        ..text = currentUser.fatherName,
                      onSubmitted: (newValue) {
                        if (newValue != '') {
                          fatherNameController..text = newValue;
                          currentUser.fatherName = newValue;
                          currentUserBox.put('currentUser',
                              currentUser..fatherName = newValue);
                          usersBox.put(currentUser.login,
                              currentUser..fatherName = newValue);
                        }
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        isDense: true,
                        suffixIcon: Icon(Icons.backpack_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    'Дата рождения: ',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Expanded(
                    child: TextField(
                      controller: dateOfBirthController
                        ..text = currentUser.dateOfBirth,
                      onSubmitted: (newValue) {
                        if (newValue != '') {
                          dateOfBirthController..text = newValue;
                          currentUser.dateOfBirth = newValue;
                          currentUserBox.put('currentUser',
                              currentUser..dateOfBirth = newValue);
                          usersBox.put(currentUser.login,
                              currentUser..dateOfBirth = newValue);
                        }
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: currentUser.dateOfBirth == ''
                            ? 'укажите дату рождения'
                            : '',
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        isDense: true,
                        suffixIcon: Icon(Icons.backpack_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    'Номер телефона: ',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Expanded(
                    child: TextField(
                      controller: telephoneController
                        ..text = currentUser.telephone,
                      onSubmitted: (newValue) {
                        if (newValue != '') {
                          telephoneController..text = newValue;
                          currentUser.telephone = newValue;
                          currentUserBox.put(
                              'currentUser', currentUser..telephone = newValue);
                          usersBox.put(currentUser.login,
                              currentUser..telephone = newValue);
                        }
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        isDense: true,
                        suffixIcon: Icon(Icons.backpack_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Номер карты лояльности: ${currentUser.cardNumber}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              'Описание уровня: Уровни и размеры начислений за покупки',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
