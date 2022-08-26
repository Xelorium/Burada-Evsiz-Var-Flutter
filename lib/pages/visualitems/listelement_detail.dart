import 'package:burada_evsiz_var/objects/map_info.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sizer/sizer.dart';

class ListElementDetail_Creator extends StatefulWidget {
  final String aciklama;
  final String photoId;
  final MapInfo mapInfo;

  const ListElementDetail_Creator(
      {super.key,
      required this.aciklama,
      required this.photoId,
      required this.mapInfo});

  @override
  State<ListElementDetail_Creator> createState() =>
      _ListElementDetail_CreatorState();
}

class _ListElementDetail_CreatorState extends State<ListElementDetail_Creator> {
  var uniqueId = "";
  var name = "";
  var surName = "";
  var userName = "";
  var mail = "";
  var userType = "";
  var pUrl = "";

  Future getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.photoId)
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
    return AlertDialog(
      title: const Text('Evsiz Bilgisi'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
              width: double.infinity,
              height: 50.h,
              child: InkWell(
                onTap: () {},
                child: FutureBuilder(
                    future: getDataFromDatabase(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Center(child: CircularProgressIndicator());
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
                              "gs://burada-evsiz-var-20ef6.appspot.com/homelessses/${widget.photoId}/file"),
                        );
                      }
                    }),
              )),
          SizedBox(
            height: 1.h,
          ),
          TextButton(
              onPressed: () {
                MapsLauncher.launchCoordinates(widget.mapInfo.latitude,
                    widget.mapInfo.longitude, widget.mapInfo.addressName);
              },
              child: Text(widget.mapInfo.addressName,
                  style: TextStyle(
                      color: Palette.accentAppColor,
                      decoration: TextDecoration.underline))),
          SizedBox(
            height: 1.h,
          ),
          Expanded(child: SingleChildScrollView(child: Text(widget.aciklama))),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Kapat'),
        )
      ],
    );
  }
}
