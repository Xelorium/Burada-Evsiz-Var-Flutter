import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CreatePostCard extends StatelessWidget {
  final String uId;
  final String gonderiAciklamasi;
  final String gonderiSaati;
  final String gonderiSahibi;
  final String photoId;

  CreatePostCard(
      {super.key,
      required this.gonderiAciklamasi,
      required this.gonderiSaati,
      required this.gonderiSahibi,
      required this.uId,
      required this.photoId});

  var uniqueId = "";
  var name = "";
  var surName = "";
  var userName = "";
  var mail = "";
  var userType = "";
  var pUrl = "";

  late var date =
      DateTime.fromMillisecondsSinceEpoch(int.parse(gonderiSaati), isUtc: true);

  Future getDataFromDatabase(String uID) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        uniqueId = snapshot.data()!["uid"];
        name = snapshot.data()!["name"];
        surName = snapshot.data()!["surName"];
        mail = snapshot.data()!["email"];
        userName = snapshot.data()!["userName"];
        userType = snapshot.data()!["userType"];
        pUrl = snapshot.data()!["pUrl"];
      }
    });
  }

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
            onTap: () {},
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
                    child: FutureBuilder(
                        future: getDataFromDatabase(uId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return CircularProgressIndicator();
                          } else {
                            return Image(
                              frameBuilder: (BuildContext context, Widget child,
                                  int? frame, bool wasSynchronouslyLoaded) {
                                if (wasSynchronouslyLoaded) {
                                  return child;
                                }
                                return AnimatedOpacity(
                                  opacity: frame == null ? 0 : 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeOut,
                                  child: child,
                                );
                              },
                              image: FirebaseImage(
                                "gs://burada-evsiz-var-20ef6.appspot.com/homelessses/${photoId}/file",
                                shouldCache: true,
                              ),
                            );
                          }
                        }),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${date}",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      FutureBuilder(
                        future: getDataFromDatabase(uId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return Text("Yükleniyor");
                          } else {
                            return Text(
                              "${name} ${surName}",
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            );
                          }
                        },
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
