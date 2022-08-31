import 'package:burada_evsiz_var/pages/pages_controller.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Palette.appColor, //or set color with: Color(0xFF0000FF)
  ));
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const BuradaEvsizVar());
}

final navigatorKey = GlobalKey<NavigatorState>();

class BuradaEvsizVar extends StatelessWidget {
  const BuradaEvsizVar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          initialRoute: 'splash',
          routes: {
            'splash': (context) => const SplashScreen(),
            'begin': (context) => const BeginScreen(),
            'login': (context) => const LoginScreen(),
          },
          title: 'Burada Evsiz Var',
          theme: ThemeData(
            primarySwatch: Palette.appColor,
            fontFamily: GoogleFonts.openSans().fontFamily,
          ),
        );
      },
    );
  }
}
