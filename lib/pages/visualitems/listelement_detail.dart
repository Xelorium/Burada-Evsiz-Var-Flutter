import 'package:flutter/material.dart';

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
          Container(
            width: 250,
            height: 250,
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: const Text(
              'HARİTA',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(widget.konumDetay),
          const SizedBox(
            height: 25,
          ),
          Text(widget.aciklama),
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
