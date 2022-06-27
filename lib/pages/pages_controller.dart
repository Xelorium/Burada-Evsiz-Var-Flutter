import 'package:burada_evsiz_var/pages/contents/landing/content_about_us.dart';
import 'package:burada_evsiz_var/pages/contents/landing/content_begin.dart';
import 'package:burada_evsiz_var/pages/contents/landing/content_login.dart';
import 'package:burada_evsiz_var/pages/contents/landing/content_purpose.dart';
import 'package:burada_evsiz_var/pages/contents/landing/content_splash.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:burada_evsiz_var/utils/functional_timer.dart';
import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'contents/main/content_feed.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SplashContent()),
    );
  }
}

class BeginScreen extends StatefulWidget {
  const BeginScreen({Key? key}) : super(key: key);

  @override
  State<BeginScreen> createState() => _BeginScreenState();
}

class _BeginScreenState extends State<BeginScreen> {
  final pvController = PageController();
  bool isLastPage = false;
  int currentPage = 0;

  final _beaches = [
    Beach(builder: (context) => const BeginContent()),
    Beach(builder: (context) => const AboutUsContent()),
    Beach(builder: (context) => const PurposeContent()),
  ];

  final _coastController = CoastController();

  @override
  void dispose() {
    _coastController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Coast(
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                    isLastPage = index == 2;
                  });
                },
                beaches: _beaches,
                controller: _coastController,
                observers: [
                  CrabController(),
                ],
              ))),
      bottomSheet: isLastPage
          ? FadeIn(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              child: SizedBox(
                height: 8.h,
                child: Material(
                  color: Palette.appColor,
                  child: InkWell(
                    onTap: () {
                      FunctionalTimer().pagePushTo(
                          context: context, screen: const LoginScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BAŞLAYIN",
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Container(
              height: 8.h,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        _coastController.animateTo(
                            beach: 3,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        "Geç",
                        style:
                            TextStyle(color: Colors.black54, fontSize: 12.sp),
                      )),
                  Center(
                    child: AnimatedSmoothIndicator(
                      onDotClicked: (index) {
                        _coastController.animateTo(
                            beach: index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      count: 3,
                      effect: const WormEffect(
                          activeDotColor: Palette.appColor,
                          dotColor: Colors.black26),
                      activeIndex: currentPage,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        _coastController.animateTo(
                            beach: currentPage + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        "İleri",
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: LoginContent()),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const FeedContent();
  }
}
