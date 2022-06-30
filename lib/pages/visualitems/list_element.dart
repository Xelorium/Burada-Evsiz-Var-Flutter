import 'package:burada_evsiz_var/pages/visualitems/listelement_detail.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
        padding: EdgeInsets.all(1.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          height: 15.h,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.konumVerisi,
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mehmet Okuyan", style: TextStyle(decoration: TextDecoration.underline),),
                        Text("10 saat önce", style: TextStyle(decoration: TextDecoration.underline),),
                      ],
                    ),

                  ],
                ),
              ),
              InkWell(
                onTap: (){},
                child: SizedBox (
                  height: 8.h,
                  child: const Image(
                    fit: BoxFit.contain,
                    image: const AssetImage('assets/location.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
