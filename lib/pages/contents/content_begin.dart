import 'package:burada_evsiz_var/pages/pages_controller.dart';
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
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
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
              Column(
                children: [
                  Text("B.E.V",
                      style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: const Offset(3, 5),
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                          )
                        ],
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w900,
                      )),
                  Text("Burada Evsiz Var",
                      style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: const Offset(3, 5),
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                          )
                        ],
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w900,
                      )),
                ],
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    FunctionalTimer().pageGoTo(
                        context: context, screen: const AboutUsScreen());
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                      child: Text(
                        "Başlayın",
                        style: TextStyle(
                          fontSize: 19.sp,
                        ),
                      ))),

            ],
          ),
        ),
      ],
    );
  }
}
