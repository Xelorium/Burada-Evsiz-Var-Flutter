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
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [Icon(Icons.close)],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Image.file(widget.image),
        ],
      ),
    );
  }
}
