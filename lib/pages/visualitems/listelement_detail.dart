import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ListElementDetail_Creator extends StatefulWidget {
  final String konumDetay;
  final String aciklama;

  const ListElementDetail_Creator(
      {super.key, required this.aciklama, required this.konumDetay});

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
                onTap: (){},
                child: Image.network(
                  "https://i.pinimg.com/originals/d8/45/84/d84584e64ab8d30cbcbcd19269bd98c7.jpg",
                  fit: BoxFit.contain,
                ),
              )),
          SizedBox(
            height: 1.h,
          ),
          TextButton(
              onPressed: () {},
              child: Text(widget.konumDetay,
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
