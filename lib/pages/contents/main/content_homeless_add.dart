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

    if (!mounted) return;

    if (pickedFile == null) {

      if(imageFile == null) {
        Navigator.pop(context);
      }

    } else {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    _getFromCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Geri çıkmak istediğinize emin misiniz?'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('İptal'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Evet'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Material(
        child: Container(
          alignment: Alignment.topCenter,
          padding:
              EdgeInsets.only(left: 7.w, right: 7.w, top: 5.h, bottom: 2.h),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    if (imageFile == null) {
                      _getFromCamera();
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              ShowImage(image: imageFile!));
                    }
                  },
                  child: imageFile == null
                      ? const Icon(Icons.add_a_photo_outlined)
                      : Column(
                          children: [
                            SizedBox(
                              height: 40.h,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.file(
                                    frameBuilder:
                                        (BuildContext context,
                                        Widget child,
                                        int? frame,
                                        bool wasSynchronouslyLoaded) {
                                      if (wasSynchronouslyLoaded) {
                                        return child;
                                      }
                                      return AnimatedOpacity(
                                        opacity: frame == null ? 0 : 1,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeOut,
                                        child: child,
                                      );
                                    },
                                    imageFile!,
                                    fit: BoxFit.contain,
                                  )),
                            ),
                            TextButton(
                                onPressed: () {

                                  _getFromCamera();

                                },
                                child: const Text("Değiştir"))
                          ],
                        ),
                ),
                SizedBox(
                  height: 4.h,
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
                        height: 8.h,
                        child: Text(
                          "GÖNDER",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
