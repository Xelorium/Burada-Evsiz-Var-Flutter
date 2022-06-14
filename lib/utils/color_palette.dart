import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor appColor = const MaterialColor(
    0xfff83545, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffdf303e),//10%
      100: const Color(0xffc62a37),//20%
      200: const Color(0xffae2530),//30%
      300: const Color(0xff952029),//40%
      400: const Color(0xff7c1b23),//50%
      500: const Color(0xff63151c),//60%
      600: const Color(0xff4a1015),//70%
      700: const Color(0xff320b0e),//80%
      800: const Color(0xff190507),//90%
      900: const Color(0xff000000),//100% 
    },
  );
}