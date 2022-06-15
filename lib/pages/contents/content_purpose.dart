import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/curved_shape.dart';

class PurposeContent extends StatefulWidget {
  const PurposeContent({Key? key}) : super(key: key);

  @override
  State<PurposeContent> createState() => _PurposeContentState();
}

class _PurposeContentState extends State<PurposeContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AccentCurvedShape(),
        Container(
          padding: EdgeInsets.only(left: 7.w, right: 7.w, bottom: 10.h ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  height: 20.h,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Palette.appColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25))),
                        height: 12.h,
                        width: 75.w,
                      ),
                      SizedBox(
                        height: 20.h,
                        width: 75.w,
                        child:
                        Image.asset("assets/bev_logo.png", fit: BoxFit.contain),
                      )
                    ],
                  )),
              Text("Uygulamanın amacı nedir?", style: TextStyle(fontSize: 20.sp, color: Palette.appColor),),
              SingleChildScrollView(
                child: Container(
                    child: const Text("Uzun YAZI")),
              ),
              // ElevatedButton(onPressed: (){}, child: Text("Devam Et"))
            ],
          ),
        ),
      ],
    );
  }
}
