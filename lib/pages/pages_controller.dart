import 'package:burada_evsiz_var/pages/contents/content_about_us.dart';
import 'package:burada_evsiz_var/pages/contents/content_begin.dart';
import 'package:burada_evsiz_var/pages/contents/content_login.dart';
import 'package:burada_evsiz_var/pages/contents/content_splash.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashContent(),

    );
  }
}

class BeginScreen extends StatefulWidget {
  const BeginScreen({Key? key}) : super(key: key);

  @override
  State<BeginScreen> createState() => _BeginScreenState();
}

class _BeginScreenState extends State<BeginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BeginContent(),
    );
  }
}

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AboutUsContent(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginContent(),
    );
  }
}

