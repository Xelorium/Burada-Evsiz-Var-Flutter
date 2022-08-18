import 'package:burada_evsiz_var/objects/map_info.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
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
                child: Image.network(
                  widget.photoId,
                  fit: BoxFit.contain,
                ),
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
