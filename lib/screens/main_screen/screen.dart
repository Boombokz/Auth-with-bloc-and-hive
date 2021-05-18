import 'package:flutter/material.dart';
import 'package:loyalty_app_flutter/screens/cabinet_screen/screen.dart';
import 'package:loyalty_app_flutter/screens/profile_screen/screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  static const String kImageURL =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/1200px-QR_code_for_mobile_English_Wikipedia.svg.png';

  final List<Widget> _tabs = [
    CabinetScreen(),
    ProfileScreen(),
  ];

  void changeTab(int index) {
    setState(() {
      currentTab = index;
    });
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Image.network(kImageURL),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        children: _tabs,
        index: currentTab,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: changeTab,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_rounded),
              label: 'Кабинет'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded), label: 'Профиль'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Text(
          'QR',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          _showMaterialDialog();
        },
      ),
    );
  }
}
