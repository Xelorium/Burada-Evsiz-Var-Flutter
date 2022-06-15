import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:burada_evsiz_var/utils/curved_shape.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutUsContent extends StatefulWidget {
  const AboutUsContent({Key? key}) : super(key: key);

  @override
  State<AboutUsContent> createState() => _AboutUsContentState();
}

class _AboutUsContentState extends State<AboutUsContent> {
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
              Text("Biz kimiz?", style: TextStyle(fontSize: 20.sp, color: Palette.appColor),),
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
