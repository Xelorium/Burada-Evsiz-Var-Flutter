import 'package:burada_evsiz_var/pages/pages_controller.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:burada_evsiz_var/utils/curved_shape.dart';
import 'package:burada_evsiz_var/utils/functional_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({Key? key}) : super(key: key);

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bool isLoggedIn = false;

    if (isLoggedIn) {
      // FunctionalTimer().setTimerAndGo(isLoggedIn: isLoggedIn, context: context, screen: MainScreen());
    } else {
      FunctionalTimer().setTimerAndGo(
          isLoggedIn: isLoggedIn,
          context: context,
          screen: const BeginScreen());
    }

    // final navigator = Navigator.of(context);
    // navigator.pushReplacement(
    //     MaterialPageRoute(builder: (context) => const BeginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MainCurvedShape(),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 32.h,
                  height: 32.h,
                  child: Image.asset(
                    "assets/bev_logo.png",
                    fit: BoxFit.contain,
                  )),
              Text("Burada Evsiz Var",
                  style: TextStyle(
                    color: Palette.appColor,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(2, 4),
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                      )
                    ],
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                  )),
              Text("Phronesis Software",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                      fontFamily: GoogleFonts.grenze().fontFamily)),
              // RichText(
              //     text: TextSpan(children: [
              //       TextSpan(
              //           text: 'Made by \t',
              //           style: TextStyle(fontSize: 11.sp, color: Colors.black)),
              //       TextSpan(
              //           text: 'Phronesis Software',
              //           style: TextStyle(
              //               fontSize: 15.sp,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.brown,
              //               fontFamily: GoogleFonts.grenze().fontFamily)),
              //     ]))
              // Text("Made by Phronesis Software", style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ],
    );
  }
}
