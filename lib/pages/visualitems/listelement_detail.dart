import 'package:flutter/material.dart';

class ListElementDetail_Creator extends StatefulWidget {
  final String konumdetay;
  final String aciklama;

  const ListElementDetail_Creator(
      {super.key, required this.aciklama, required this.konumdetay});

  @override
  State<ListElementDetail_Creator> createState() =>
      _ListElementDetail_CreatorState();
}

class _ListElementDetail_CreatorState extends State<ListElementDetail_Creator> {
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: const Text('Evsiz Bilgisi'),
      content: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'HARİTA',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(widget.konumdetay),
          SizedBox(
            height: 25,
          ),
          Text(widget.aciklama),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Kapat'),
        )
      ],
    );
  }
}
