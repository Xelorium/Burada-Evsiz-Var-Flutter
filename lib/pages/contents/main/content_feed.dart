import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:burada_evsiz_var/objects/homelesses.dart';
import 'package:burada_evsiz_var/objects/map_info.dart';
import 'package:burada_evsiz_var/objects/users.dart';
import 'package:burada_evsiz_var/pages/contents/main/content_homeless_add.dart';
import 'package:burada_evsiz_var/pages/contents/main/content_profile.dart';
import 'package:burada_evsiz_var/pages/visualitems/list_element.dart';
import 'package:burada_evsiz_var/pages/visualitems/post_card.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
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
    ProfileContent(),
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
  bool searchOpened = false;
  bool _isVisible = false;

  late final TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  List<Homeless> posts = allPosts;
  List<Homeless> homelesses = allHomelesses;
  List<User> users = allUsers;
  List<MapInfo> mapInfos = allLocations;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 9.h,
          color: Palette.accentAppColor.shade800,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedView = 0;
                        _isVisible = false;
                        searchPost("");
                      });
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
                      setState(() {
                        _selectedView = 1;
                        _isVisible = true;
                      });
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
                  child: Visibility(
                      visible: _isVisible,
                      child: FloatingSearchBar(
                        hint: 'Arayın...',
                        transitionDuration: const Duration(milliseconds: 300),
                        transitionCurve: Curves.easeInOut,
                        physics: const BouncingScrollPhysics(),
                        openAxisAlignment: 0.0,
                        debounceDelay: const Duration(milliseconds: 500),
                        onQueryChanged: (query) {
                          searchPost(query);
                        },
                        // Specify a custom transition to be used for
                        // animating between opened and closed stated.
                        transition: CircularFloatingSearchBarTransition(),
                        actions: [
                          FloatingSearchBarAction(
                            showIfOpened: false,
                            child: CircularButton(
                              icon: const Icon(Icons.place),
                              onPressed: () {},
                            ),
                          ),
                          FloatingSearchBarAction.searchToClear(
                            showIfClosed: false,
                          ),
                        ],
                        builder: (context, transition) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Material(
                              color: Colors.white,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: Colors.accents.map((color) {
                                  return Container(color: color);
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      )

                      // SearchBarAnimation(
                      //         isSearchBoxOnRightSide: true,
                      //         textEditingController: _textController,
                      //         isOriginalAnimation: true,
                      //         enableKeyboardFocus: true,
                      //         onEditingComplete: searchPost,
                      //         hintText: "Arayın...",
                      //       ),
                      )),
            ],
          ),
        ),
        Expanded(
          child: RefreshIndicator(
              onRefresh: _refresh,
              child: _selectedView == 0
                  ? ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        final user = users[index];
                        return CreatePostCard(
                            uId: "2",
                            photoId: post.photoId,
                            gonderiAciklamasi: post.desc,
                            gonderiSaati: post.date,
                            gonderiSahibi: "${user.name} ${user.surName}");
                      },
                    )
                  : ListView.builder(
                      itemCount: homelesses.length,
                      itemBuilder: (context, index) {
                        final homeless = homelesses[index];
                        final user = users[index];
                        final mapInfo = mapInfos[index];
                        return ListElementCreator(
                          mapInfo: mapInfo,
                            uId: "1",
                            desc: homeless.desc,
                            photoId: homeless.photoId,
                            postOwner: "${user.name} ${user.surName}",
                            date: homeless.date);
                      })),
        ),
      ],
    );
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 0));
  }

  void searchPost(String query) {
    final results = allHomelesses.where((homeless) {
      final postAddress = homeless.address.toLowerCase();
      final input = query.toLowerCase();

      return postAddress.contains(input);
    }).toList();

    setState(() => homelesses = results);
  }

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
}
