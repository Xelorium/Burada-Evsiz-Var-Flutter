import 'package:burada_evsiz_var/pages/contents/content_evsizekleme.dart';
import 'package:burada_evsiz_var/pages/contents/content_evsizlisteleme.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:burada_evsiz_var/utils/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainsContent extends StatefulWidget {
  const MainsContent({Key? key}) : super(key: key);

  @override
  State<MainsContent> createState() => _MainsContentState();
}
class _MainsContentState extends State<MainsContent> {
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
        title: Image.asset('assets/images/BevLogo_ico.png', fit: BoxFit.cover, scale: 8.5,),
      ),

      body: Center(
        child: _pageOptions.elementAt(_selectedIndex),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
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
          CreatePostCard(gonderiAciklamasi: 'ÇATIR ÇUTUR',),
          CreatePostCard(gonderiAciklamasi: 'SİKERLER',)
        ],
      ),
    );
  }
}

