import 'package:burada_evsiz_var/pages/pages_controller.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:burada_evsiz_var/utils/functional_timer.dart';
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
      alignment: Alignment.topCenter,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 73.w,
              height: 13.h,
              child: Container(
                decoration: const BoxDecoration(
                    color: Palette.appColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    )),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 40.w,
                  height: 20.h,
                  child: Image.asset(
                    "assets/bev_logo.png",
                    fit: BoxFit.contain,
                  )),
              SingleChildScrollView(
                child: Text(
                  "Biz Kimiz?",
                  style: TextStyle(
                      color: Palette.appColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp),
                ),
              ),
              SizedBox(
                child: const Text("UZUN YAZI"),
                width: double.infinity,
                height: 50.h,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    FunctionalTimer().pageGoTo(context: context, screen: const LoginScreen());
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 2.h, horizontal: 10.w),
                      child: Text(
                        "Giriş Yapın",
                        style: TextStyle(
                          fontSize: 19.sp,
                        ),
                      ))),
              const SizedBox()
            ],
          ),
        )
      ],
    );
  }
}
