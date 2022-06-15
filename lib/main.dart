import 'package:burada_evsiz_var/pages/pages_controller.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const BuradaEvsizVar());

}

class BuradaEvsizVar extends StatelessWidget {
  const BuradaEvsizVar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'splash',
          routes: {
            'splash': (context) => const SplashScreen(),
            'begin': (context) => const BeginScreen(),
            'about_us': (context) => const AboutUsScreen(),
            'login': (context) => const LoginScreen(),
          },
          title: 'Burada Evsiz Var',
          theme: ThemeData(
            primarySwatch: Palette.appColor,
            fontFamily: GoogleFonts.righteous().fontFamily,
          ),
        );
      },
    );
  }
}

