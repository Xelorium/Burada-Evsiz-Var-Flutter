import 'package:burada_evsiz_var/pages/visualitems/listelement_detail.dart';
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
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => const ListElementDetail_Creator(
                  aciklama: 'Burada evsiz gördüm çorba verdim',
                  konumDetay: "Küplüce mah",
                ));
      },
      borderRadius: BorderRadius.circular(8),
      splashColor: const Color.fromRGBO(239, 230, 230, 1),
      focusColor: const Color.fromRGBO(239, 230, 230, 1),
      hoverColor: const Color.fromRGBO(239, 230, 230, 1),
      highlightColor: const Color.fromRGBO(239, 230, 230, 1),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(239, 230, 230, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          height: 50,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                width: 40,
                height: 40,
                child: const Image(
                  image: const AssetImage('assets/location.png'),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
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
    );
  }
}
