import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:burada_evsiz_var/pages/contents/main/content_homeless_add.dart';
import 'package:burada_evsiz_var/pages/contents/main/content_homeless_list.dart';
import 'package:burada_evsiz_var/pages/visualitems/list_element.dart';
import 'package:burada_evsiz_var/pages/visualitems/post_card.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
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
    EvsizlistContent(),
    AddHomelessContent(),
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
      floatingActionButton: SizedBox(
        height: 12.h,
        width: 18.w,
        child: FloatingActionButton(
          hoverColor: Palette.accentAppColor,
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const AddHomelessContent(),
                    type: PageTransitionType.bottomToTop,
                    duration: const Duration(milliseconds: 500)));
          },
          child: Icon(
            Icons.add_a_photo_outlined,
            color: Palette.accentAppColor,
            size: 5.h,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [Icons.home, Icons.person],
        iconSize: 4.h,
        activeColor: Palette.accentAppColor,
        onTap: (index) => setState(() => _selectedIndex = index),
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
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
  int _selectedView = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 8.h,
          color: Palette.accentAppColor.shade800,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() => _selectedView = 0);
                    },
                    child: Container(
                      height: double.infinity,
                      color: _selectedView == 0
                          ? Palette.accentAppColor
                          : Palette.accentAppColor.shade800,
                      child: Icon(
                        Icons.grid_view,
                        size: 4.h,
                      ),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() => _selectedView = 1);
                    },
                    child: Container(
                      height: double.infinity,
                      color: _selectedView == 1
                          ? Palette.accentAppColor
                          : Palette.accentAppColor.shade800,
                      child: Icon(
                        Icons.list_outlined,
                        size: 5.h,
                      ),
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    height: double.infinity,
                    color: Colors.green.shade100,
                    child: Icon(Icons.search, size: 4.h),
                  )),
            ],
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: _selectedView == 0
                ? ListView(
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
                      ),
                    ],
                  )
                : ListView(
                    children: const [
                      ListElementCreator(
                          konumVerisi:
                              'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                      ListElementCreator(
                          konumVerisi:
                              'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                      ListElementCreator(
                          konumVerisi:
                              'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                      ListElementCreator(
                          konumVerisi:
                              'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                      ListElementCreator(
                          konumVerisi:
                              'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                      ListElementCreator(
                          konumVerisi:
                              'Küplüce Mah. Zümrütbahçe Sok. Üsküdar/ İstanbul'),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 0));
  }
}
