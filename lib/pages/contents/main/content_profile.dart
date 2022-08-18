import 'package:burada_evsiz_var/pages/visualitems/profile_tile.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  final kullanici = FirebaseAuth.instance.currentUser!;

  var uId = "";
  var name = "";
  var surName = "";
  var userName = "";
  var mail = "";
  var userType = "";
  var pUrl = "";

  Future getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        uId = snapshot.data()!["uid"];
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
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: Palette.appColor.shade100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                      radius: 63,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            "https://www.resimupload.org/images/2022/08/08/74e15825-cb45-45ae-b2ee-a632cc0f05d6.jpg"),
                      ),
                    ),
                    Text("$name $surName",
                        style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              flex: 6,
              child: Container(
                  child: FutureBuilder(
                      future: getDataFromDatabase(),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState != ConnectionState.done){
                          return Text("");
                        }
                        else{
                          return ListView(
                            children: [
                              ProfileTile(
                                  tileType: 0,
                                  tileTitle: "Kullanıcı Adı",
                                  tileDesc: userName!),
                              ProfileTile(
                                  tileType: 1,
                                  tileTitle: "E Posta",
                                  tileDesc: mail!),
                              ProfileTile(
                                  tileType: 2,
                                  tileTitle: "Kullanıcı Türü",
                                  tileDesc: userType),
                              ElevatedButton(
                                onPressed: () => FirebaseAuth.instance.signOut(),
                                child: Text('BU HESAPTAN ÇIKIŞ YAP'),
                              ),
                            ],
                          );
                        }

                      },
                  )))
        ],
      ),
    );
  }
}
