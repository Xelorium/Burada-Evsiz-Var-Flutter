import 'package:burada_evsiz_var/utils/curved_shape.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MainCurvedShape(),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 32.h,
                    height: 32.h,
                    child: Image.asset(
                      "assets/bev_logo.png",
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  height: 15.h,
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    labelText: 'E-Posta',
                    labelStyle: TextStyle(fontSize: 15.sp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextField(
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    labelText: 'Şifre',
                    labelStyle: TextStyle(fontSize: 15.sp),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                SizedBox(
                  height: 2.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // <-- Radius
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                      width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: 3.h, horizontal: 10.w),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Giriş Yap",
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ))),
              ],
            ),
          ),
        )
      ],
    );
  }
}
