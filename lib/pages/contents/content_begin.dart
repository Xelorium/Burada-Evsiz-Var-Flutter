import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:burada_evsiz_var/utils/curved_shape.dart';
import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
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
              Crab(
                tag: 'logo',
                child: SizedBox(
                    width: 32.h,
                    height: 32.h,
                    child: Image.asset(
                      "assets/bev_logo.png",
                      fit: BoxFit.contain,
                    )),
              ),
              Text("Burada Evsiz Var",
                  style: TextStyle(
                    color: Palette.appColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                  )),
              const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
