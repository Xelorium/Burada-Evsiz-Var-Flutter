import 'package:burada_evsiz_var/objects/map_info.dart';
import 'package:burada_evsiz_var/pages/visualitems/listelement_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sizer/sizer.dart';

class ListElementCreator extends StatefulWidget {
  final String uId;
  final String postOwner;
  final String date;
  final String desc;
  final String photoId;
  final MapInfo mapInfo;

  const ListElementCreator(
      {super.key,
      required this.postOwner,
      required this.date,
      required this.desc,
      required this.photoId,
      required this.uId,
      required this.mapInfo});

  @override
  State<ListElementCreator> createState() => _ListElementCreatorState();
}

class _ListElementCreatorState extends State<ListElementCreator> {
  var uniqueId = "";
  var name = "";
  var surName = "";
  var userName = "";
  var mail = "";
  var userType = "";
  var pUrl = "";

  late var date =
      DateTime.fromMillisecondsSinceEpoch(int.parse(widget.date), isUtc: true);

  Future getDataFromDatabase(String uID) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uID)
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
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => ListElementDetail_Creator(
                  aciklama: widget.desc,
                  mapInfo: widget.mapInfo,
                  photoId: widget.photoId,
                ));
      },
      borderRadius: BorderRadius.circular(8),
      splashColor: const Color.fromRGBO(239, 230, 230, 1),
      focusColor: const Color.fromRGBO(239, 230, 230, 1),
      hoverColor: const Color.fromRGBO(239, 230, 230, 1),
      highlightColor: const Color.fromRGBO(239, 230, 230, 1),
      child: Padding(
        padding: EdgeInsets.all(1.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          height: 15.h,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.mapInfo.addressName,
                      textAlign: TextAlign.left,
                    ),
                    FutureBuilder(
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return CircularProgressIndicator();
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "$name $surName",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                              Text(
                                "${date.day}.${date.month}.${date.year}",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          );
                        }
                      },
                      future: getDataFromDatabase(widget.postOwner),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  MapsLauncher.launchCoordinates(widget.mapInfo.latitude,
                      widget.mapInfo.longitude, widget.mapInfo.addressName);
                },
                child: SizedBox(
                  height: 8.h,
                  child: const Image(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/location.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
