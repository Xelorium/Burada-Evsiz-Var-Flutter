import 'package:burada_evsiz_var/pages/contents/content_homeless_add.dart';
import 'package:burada_evsiz_var/pages/contents/content_homeless_list.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:burada_evsiz_var/pages/visualitems/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainContent extends StatefulWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pageOptions = <Widget>[
    MainBodyContent(),
    EvsizeklemeContent(),
    EvsizlistContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0.5,
        centerTitle: true,
        title: Image.asset(
          'assets/bev_logo.png',
          fit: BoxFit.cover,
          scale: 8.5,
        ),
      ),
      body: Center(
        child: _pageOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/location.png'),
            ),
            label: 'Ekle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_sharp),
            label: 'Liste',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Palette.accentAppColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MainBodyContent extends StatefulWidget {
  const MainBodyContent({Key? key}) : super(key: key);

  @override
  State<MainBodyContent> createState() => _MainBodyContentState();
}

class _MainBodyContentState extends State<MainBodyContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          CreatePostCard(gonderiAciklamasi: 'ADAMI BÖYLE'),
          CreatePostCard(
            gonderiAciklamasi: 'ÇATIR ÇUTUR',
          ),
          CreatePostCard(
            gonderiAciklamasi: 'SİKERLER',
          )
        ],
      ),
    );
  }
}
