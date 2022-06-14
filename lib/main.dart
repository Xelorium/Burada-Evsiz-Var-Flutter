import 'package:burada_evsiz_var/pages/pages_controller.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash',
    routes: {
      'splash': (context) => const SplashScreen(),
    },
    title: 'Burada Evsiz Var',
    theme: ThemeData(
      primarySwatch: Palette.appColor,
      fontFamily: GoogleFonts.inter().fontFamily,
    ),
  ));

}
