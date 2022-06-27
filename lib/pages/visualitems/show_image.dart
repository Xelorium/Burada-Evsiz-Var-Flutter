import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({Key? key, required this.image}) : super(key: key);

  final File image;

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Fotoğraf"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.file(widget.image),
          SizedBox(
            height: 1.h,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Kapat'),
          )
        ],
      ),
    );
  }
}
