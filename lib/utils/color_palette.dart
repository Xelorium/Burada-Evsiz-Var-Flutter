import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor appColor = MaterialColor(
    0xfff83545,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xfff94958), //10%
      100: Color(0xfff95d6a), //20%
      200: Color(0xfffa727d), //30%
      300: Color(0xfffb868f), //40%
      400: Color(0xfffc9aa2), //50%
      500: Color(0xfffcaeb5), //60%
      600: Color(0xfffdc2c7), //70%
      700: Color(0xfffed7da), //80%
      800: Color(0xfffeebec), //90%
      900: Color(0xffffffff), //100%
    },
  );

  static const MaterialColor accentAppColor = MaterialColor(
    0xfffb4a59,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xfffb4a59), //10%
      100: Color(0xfffb5c6a), //20%
      200: Color(0xfffc6e7a), //30%
      300: Color(0xfffc808b), //40%
      400: Color(0xfffd929b), //50%
      500: Color(0xfffda5ac), //60%
      600: Color(0xfffdb7bd), //70%
      700: Color(0xfffec9cd), //80%
      800: Color(0xfffedbde),
      900: Color(0xffffedee), //90%
    },
  );
}
