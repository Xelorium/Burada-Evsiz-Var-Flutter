import 'package:burada_evsiz_var/pages/contents/content_about_us.dart';
import 'package:burada_evsiz_var/pages/contents/content_begin.dart';
import 'package:burada_evsiz_var/pages/contents/content_login.dart';
import 'package:burada_evsiz_var/pages/contents/content_purpose.dart';
import 'package:burada_evsiz_var/pages/contents/content_splash.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

  @override
  void dispose() {
    pvController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.only(bottom: 8.h),
              child: PageView(
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 2);
                },
                controller: pvController,
                children: const [
                  BeginContent(),
                  AboutUsContent(),
                  PurposeContent(),
                ],
              ))),
      bottomSheet: isLastPage
          ? Container(
              color: Palette.appColor,
              height: 8.h,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "BAŞLAYIN",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ],
              ),
            )
          : Container(
              color: Palette.appColor.shade700,
              height: 8.h,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        pvController.animateToPage(3,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        "Geç",
                        style:
                            TextStyle(color: Colors.black54, fontSize: 12.sp),
                      )),
                  Center(
                    child: SmoothPageIndicator(
                      onDotClicked: (index) {
                        pvController.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      controller: pvController,
                      count: 3,
                      effect: const WormEffect(activeDotColor: Palette.appColor, dotColor: Colors.black26),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        pvController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
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

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AboutUsContent()),
    );
  }
}

class PurposeScreen extends StatefulWidget {
  const PurposeScreen({Key? key}) : super(key: key);

  @override
  State<PurposeScreen> createState() => _PurposeScreenState();
}

class _PurposeScreenState extends State<PurposeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: const PurposeContent());
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
