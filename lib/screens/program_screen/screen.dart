import 'package:flutter/material.dart';
import 'package:loyalty_app_flutter/data/models/user.dart';
import 'package:loyalty_app_flutter/themes/text_theme.dart';

class ProgramScreen extends StatelessWidget {
  final User currentUser;

  ProgramScreen({required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'О программе лояльности',
                style: TextThemes.header1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            Center(
                child: Text(
              '${currentUser.programName}',
              style: TextThemes.header1,
            )),
            SizedBox(height: 30),
            Text(
              'Описание уровней программы лояльности',
              style: TextThemes.header1,
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 300,
              child: ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.leaderboard),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  contentPadding: EdgeInsets.zero,
                  title: Text('Описание уровня'),
                  trailing: Text('${index + 1}'),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
