import 'package:flutter/material.dart';

class ListElementCreator extends StatefulWidget {
  final String konumVerisi;

  const ListElementCreator({super.key, required this.konumVerisi});

  @override
  State<ListElementCreator> createState() => _ListElementCreatorState();
}

class _ListElementCreatorState extends State<ListElementCreator> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(239, 230, 230, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          height: 50,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                width: 40,
                height: 40,
                child: Image(
                  image: AssetImage('assets/images/location.png'),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 280,
                child: Text(
                  widget.konumVerisi,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      splashColor: Color.fromRGBO(239, 230, 230, 1),
      focusColor: Color.fromRGBO(239, 230, 230, 1),
      hoverColor: Color.fromRGBO(239, 230, 230, 1),
      highlightColor: Color.fromRGBO(239, 230, 230, 1),
    );
  }
}
