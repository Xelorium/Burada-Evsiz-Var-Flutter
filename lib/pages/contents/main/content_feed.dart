import 'package:burada_evsiz_var/pages/contents/main/content_homeless_add.dart';
import 'package:burada_evsiz_var/pages/contents/main/content_homeless_list.dart';
import 'package:burada_evsiz_var/pages/visualitems/post_card.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FeedContent extends StatefulWidget {
  const FeedContent({Key? key}) : super(key: key);

  @override
  State<FeedContent> createState() => _FeedContentState();
}

class _FeedContentState extends State<FeedContent> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pageOptions = <Widget>[
    MainBodyContent(),
    AddHomelessContent(),
    EvsizlistContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: Image.asset(
          'assets/bev_logo.png',
          fit: BoxFit.cover,
          scale: 1.h,
        ),
      ),
      body: Center(
        child: _pageOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 3.7.h,
        unselectedLabelStyle: TextStyle(fontSize: 9.sp),
        selectedLabelStyle: TextStyle(fontSize: 9.sp),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.add_location_alt),
            icon: Icon(Icons.add_location_alt_outlined),
            label: 'Ekle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
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
      child: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          children: const [
            CreatePostCard(
                gonderiAciklamasi:
                    'BÖASFALSKFHASLKFJASLKFJASLKFJLASKJFLKASJLKFASJLKYLE'),
            CreatePostCard(
              gonderiAciklamasi: 'deneme',
            ),
            CreatePostCard(
              gonderiAciklamasi:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
            )
          ],
        ),
      ),
    );
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 0));
  }
}
