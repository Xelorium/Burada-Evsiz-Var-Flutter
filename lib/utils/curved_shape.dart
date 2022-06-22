import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainCurvedShape extends StatelessWidget {
  const MainCurvedShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100.h,
          color: Colors.grey.shade100,
        ),
        ClipPath(
          clipper: MainWaveClipper(),
          child: Container(
            color: Theme.of(context).primaryColor,
            height: 34.h,
          ),
        ),
      ],
    );
  }
}

class MainWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 10, size.height);
    //1. nokta
    var firstEnd = Offset(size.width / 2.25, size.height - 25.0);
    //2. nokta

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.20), size.height - 50);
    //3. nokta
    var secondEnd = Offset(size.width, size.height);
    //4. nokta

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class AccentCurvedShape extends StatelessWidget {
  const AccentCurvedShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100.h,
          color: Colors.grey.shade100,
        ),
        ClipPath(
          clipper: AccentWaveClipper(),
          child: Container(
            color: Palette.appColor.shade700,
            height: 34.h,
          ),
        )
      ],
    );
  }
}

class AccentWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 10, size.height);
    //1. nokta
    var firstEnd = Offset(size.width / 2.25, size.height - 25.0);
    //2. nokta

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.20), size.height - 50);
    //3. nokta
    var secondEnd = Offset(size.width, size.height);
    //4. nokta

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
