import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FunctionalTimer {
  @override
  void setTimerAndGo(
      {required bool isLoggedIn,
      required BuildContext context,
      required StatefulWidget screen}) {
    if (isLoggedIn) {
      Timer(const Duration(seconds: 1), () {
        final navigator = Navigator.of(context);
        navigator.pushReplacement(
          PageTransition(child: screen, type: PageTransitionType.fade),
        );
      });
    } else {
      Timer(const Duration(milliseconds: 500), () {
        final navigator = Navigator.of(context);
        navigator.pushReplacement(
          PageTransition(child: screen, type: PageTransitionType.fade),
        );
      });
    }
  }

  void pageGoTo(
      {required BuildContext context, required StatefulWidget screen}) {
    final navigator = Navigator.of(context);
    
    navigator.push(
      PageTransition(child: screen, type: PageTransitionType.rightToLeft),
    );
  }
}
