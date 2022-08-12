import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileTile extends StatefulWidget {
  const ProfileTile(
      {Key? key,
      required this.tileType,
      required this.tileTitle,
      required this.tileDesc})
      : super(key: key);

  final int tileType;
  final String tileTitle;
  final String tileDesc;

  @override
  State<ProfileTile> createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 10.h,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor: widget.tileType == 0
                      ? Colors.blue
                      : widget.tileType == 1
                          ? Colors.orangeAccent
                          : Colors.redAccent,
                  child: Icon(widget.tileType == 0
                      ? Icons.person
                      : widget.tileType == 1
                          ? Icons.mail
                          : Icons.supervised_user_circle_outlined),
                )),
            Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.tileTitle),
                    Text(
                      widget.tileDesc,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
