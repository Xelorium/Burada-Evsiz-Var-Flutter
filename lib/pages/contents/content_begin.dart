import 'package:burada_evsiz_var/pages/pages_controller.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:burada_evsiz_var/utils/curved_shape.dart';
import 'package:burada_evsiz_var/utils/functional_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class BeginContent extends StatefulWidget {
  const BeginContent({Key? key}) : super(key: key);

  @override
  State<BeginContent> createState() => _BeginContentState();
}

class _BeginContentState extends State<BeginContent> {
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

              Text("BURADA EVSİZ VAR",
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

              Text("Hoşgeldin.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w900,
                  )),

              // Container(
              //   alignment: Alignment.bottomCenter,
              //   child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(12), // <-- Radius
              //         ),
              //       ),
              //       onPressed: () {
              //         FunctionalTimer().pageGoTo(
              //             context: context, screen: const AboutUsScreen());
              //       },
              //       child: Container(
              //           padding:
              //               EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
              //           child: Text(
              //             "Başlayın",
              //             style: TextStyle(
              //               fontSize: 19.sp,
              //             ),
              //           ))),
              // ),

            ],
          ),
        ),
      ],
    );
  }
}
