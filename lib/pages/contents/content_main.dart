import 'package:burada_evsiz_var/utils/bottom_navigation_bar.dart';
import 'package:burada_evsiz_var/utils/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainsContent extends StatefulWidget {
  const MainsContent({Key? key}) : super(key: key);

  @override
  State<MainsContent> createState() => _MainsContentState();
}
int _selectedIndex = 0;
class _MainsContentState extends State<MainsContent> {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _pageOptions = <Widget>[

    MainBodyContent(),

    Text(
      'Evsiz Ekleme Ekranı',
      style: optionStyle,
    ),
    Text(
      'Evsiz Listeleme Ekranı',
      style: optionStyle,
    ),
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
      
      bottomNavigationBar: BottomNavigationBarPhronesis(),
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
    return Scaffold(
      body: ListView(
        children: [
          CreatePostCard(gonderiAciklamasi: 'ADAMI BÖYLE'),
          CreatePostCard(gonderiAciklamasi: 'ÇATIR ÇUTUR',),
          CreatePostCard(gonderiAciklamasi: 'SİKERLER',)
        ],
      ),
    );
  }
}
