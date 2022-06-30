import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CreatePostCard extends StatelessWidget {
  final String gonderiAciklamasi;

  const CreatePostCard({super.key, required this.gonderiAciklamasi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 0.5.w),
      child: Material(
        elevation: 1.5,
        child: Container(
          padding: EdgeInsets.all(5.w),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: InkWell(
            onTap: (){},
            splashColor: const Color.fromRGBO(239, 230, 230, 1),
            focusColor: const Color.fromRGBO(239, 230, 230, 1),
            hoverColor: const Color.fromRGBO(239, 230, 230, 1),
            highlightColor: const Color.fromRGBO(239, 230, 230, 1),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: ExpandableText(gonderiAciklamasi,
                            maxLines: 4,
                            collapseOnTextTap: true,
                            expandOnTextTap: true,
                            expandText: "Daha fazla göster"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30.h,
                    decoration: const BoxDecoration(),
                    child: Image(
                      frameBuilder:
                          (BuildContext context,
                          Widget child,
                          int? frame,
                          bool wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) {
                          return child;
                        }
                        return AnimatedOpacity(
                          opacity: frame == null ? 0 : 1,
                          duration:
                          const Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                          child: child,
                        );
                      },
                      image: const NetworkImage('https://i.pinimg.com/originals/d8/45/84/d84584e64ab8d30cbcbcd19269bd98c7.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("5 Saat Önce", style: TextStyle(decoration: TextDecoration.underline),),
                      Text("Mehmet Öztürk", style: TextStyle(decoration: TextDecoration.underline),)
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
