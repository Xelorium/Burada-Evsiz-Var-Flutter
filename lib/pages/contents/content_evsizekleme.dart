import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EvsizeklemeContent extends StatefulWidget {
  const EvsizeklemeContent({Key? key}) : super(key: key);

  @override
  State<EvsizeklemeContent> createState() => _EvsizeklemeContentState();
}

class _EvsizeklemeContentState extends State<EvsizeklemeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(45),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.add_a_photo),
              color: Palette.accentAppColor,
              iconSize: 70,
            ),
            SizedBox(
              height: 75,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(239, 230, 230, 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: Image.asset('assets/images/location.png'),
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  Text(
                    'Konumu Belirleyiniz..',
                    style: TextStyle(color: Palette.accentAppColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              minLines: 5,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(239, 230, 230, 1),
                filled: true,
                labelText: 'Açıklama Giriniz..',
                labelStyle: TextStyle(
                  color: Palette.accentAppColor,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // <-- Radius
                  ),
                ),
                onPressed: () {},
                child: Container(
                    width: double.infinity,
                    height: 60,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text(
                      textAlign: TextAlign.center,
                      "GÖNDER",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
