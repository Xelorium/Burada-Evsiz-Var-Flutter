import 'dart:io';

import 'package:burada_evsiz_var/pages/visualitems/show_image.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class AddHomelessContent extends StatefulWidget {
  const AddHomelessContent({Key? key}) : super(key: key);

  @override
  State<AddHomelessContent> createState() => _AddHomelessContentState();
}

class _AddHomelessContentState extends State<AddHomelessContent> {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  void _getFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 5.h, bottom: 2.h),
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: <Widget>[
            IconButton(
              onPressed: () {
                if (imageFile == null) {
                  _getFromCamera();
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          ShowImage(image: imageFile!));
                }
              },
              icon: imageFile == null
                  ? Icon(Icons.add_a_photo_outlined)
                  : Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 12.h,
                        ),
                        Text("Göster")
                      ],
                    ),
              color: Palette.accentAppColor,
              iconSize: 15.h,
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Palette.accentAppColor.shade800,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: Image.asset('assets/location.png'),
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  const Text(
                    'Konumu belirleyin...',
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            TextFormField(
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                hintText: 'Açıklama girin...',
                fillColor: Color.fromRGBO(254, 201, 205, 0.6),
                filled: true,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // <-- Radius
                  ),
                ),
                onPressed: () {},
                child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 9.h,
                    child: Text(
                      "GÖNDER",
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
