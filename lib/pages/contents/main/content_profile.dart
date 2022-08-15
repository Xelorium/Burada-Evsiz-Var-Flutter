import 'package:burada_evsiz_var/pages/visualitems/profile_tile.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
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
                    Text("Muhammed Bayraktar",
                        style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              flex: 6,
              child: Container(
                  child: ListView(
                children: [
                  ProfileTile(
                      tileType: 0,
                      tileTitle: "Kullanıcı Adı",
                      tileDesc: "noxivirtus"),
                  ProfileTile(
                      tileType: 1,
                      tileTitle: "E Posta",
                      tileDesc: "mhmmd.bayraktar@gmail.com"),
                  ProfileTile(
                      tileType: 2,
                      tileTitle: "Kullanıcı Türü",
                      tileDesc: "Standart")
                ],
              )))
        ],
      ),
    );
  }
}
