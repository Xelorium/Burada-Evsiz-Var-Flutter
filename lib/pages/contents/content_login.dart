import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:burada_evsiz_var/utils/curved_shape.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  late bool _passwordVisible;

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MainCurvedShape(),
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(
            left: 8.w,
            right: 8.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                      width: 32.h,
                      height: 32.h,
                      child: Image.asset(
                        "assets/bev_logo.png",
                        fit: BoxFit.contain,
                      )),
                ),
                TextField(
                  controller: mailController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: Palette.appColor.shade800,
                    filled: true,
                    labelText: 'E-Posta',
                    labelStyle: TextStyle(fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextField(
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                      fillColor: Palette.appColor.shade800,
                      filled: true,
                      labelText: 'Şifre',
                      labelStyle: TextStyle(fontSize: 12.sp),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // <-- Radius
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Giriş Yap",
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ))),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Kayıt Ol",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Şifremi Unuttum",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontSize: 12.sp,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
    //   Stack(
    //   children: [
    //     const MainCurvedShape(),
    //     Container(
    //       padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Hero(
    //             tag: 'logo',
    //             child: SizedBox(
    //                 width: 32.h,
    //                 height: 32.h,
    //                 child: Image.asset(
    //                   "assets/bev_logo.png",
    //                   fit: BoxFit.contain,
    //                 )),
    //           ),
    //           TextField(
    //             textInputAction: TextInputAction.next,
    //             decoration: InputDecoration(
    //               fillColor: Colors.grey.shade100,
    //               filled: true,
    //               labelText: 'E-Posta',
    //               labelStyle: TextStyle(fontSize: 15.sp),
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(8),
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 2.h,
    //           ),
    //           TextField(
    //             textInputAction: TextInputAction.done,
    //             obscureText: true,
    //             decoration: InputDecoration(
    //               fillColor: Colors.grey.shade100,
    //               filled: true,
    //               labelText: 'Şifre',
    //               labelStyle: TextStyle(fontSize: 15.sp),
    //               border: OutlineInputBorder(
    //                 borderSide: const BorderSide(width: 0),
    //                 borderRadius: BorderRadius.circular(8),
    //               ),
    //             ),
    //           ),
    //
    //           SizedBox(
    //             height: 2.h,
    //           ),
    //           ElevatedButton(
    //               style: ElevatedButton.styleFrom(
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(0), // <-- Radius
    //                 ),
    //               ),
    //               onPressed: () {},
    //               child: Container(
    //                 width: double.infinity,
    //                   padding: EdgeInsets.symmetric(
    //                       vertical: 3.h, horizontal: 10.w),
    //                   child: Text(
    //                     textAlign: TextAlign.center,
    //                     "Giriş Yap",
    //                     style: TextStyle(
    //                       fontSize: 15.sp,
    //                     ),
    //                   ))),
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}
