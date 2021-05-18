import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:loyalty_app_flutter/constants/router/router.dart';
import 'package:loyalty_app_flutter/data/models/user.dart';
import 'package:loyalty_app_flutter/themes/text_theme.dart';

class CabinetScreen extends StatelessWidget {
  final User currentUser = Hive.box('currentUser').get('currentUser');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Кабинет'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 30),
              Center(
                child: Text(
                  'Активные бонусы: 5000',
                  style: TextThemes.header1,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Таблица покупок',
                style: TextThemes.header1,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.shopping_basket),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    contentPadding: EdgeInsets.zero,
                    title: Text('Строка покупки'),
                    trailing: Text('${index + 1}'),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
