import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarPhronesis extends StatefulWidget {
  const BottomNavigationBarPhronesis({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarPhronesis> createState() => _BottomNavigationBarPhronesisState();
}

class _BottomNavigationBarPhronesisState extends State<BottomNavigationBarPhronesis> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30.0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/location.png'),),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_sharp),
          label: '',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color.fromRGBO(251, 74, 89, 1),
      onTap: _onItemTapped,
    );
  }
}

