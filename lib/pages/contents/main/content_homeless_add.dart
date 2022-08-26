import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:burada_evsiz_var/objects/map_info.dart';
import 'package:burada_evsiz_var/pages/visualitems/show_image.dart';
import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:sizer/sizer.dart';

import '../../../objects/homelesses.dart';

class AddHomelessContent extends StatefulWidget {
  const AddHomelessContent({Key? key}) : super(key: key);

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  State<AddHomelessContent> createState() => _AddHomelessContentState();
}

class _AddHomelessContentState extends State<AddHomelessContent> {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  late PickResult selectedPlace;

  bool _locationController = false;
  bool _descriptionController = false;

  TextEditingController descriptionController = TextEditingController();

  String address = "Konumu belirleyiniz...";

  late MapInfo sendingLocation;

  void _getFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if (!mounted) return;

    if (pickedFile == null) {
      if (imageFile == null) {
        Navigator.pop(this.context);
      }
    } else {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  final doc = FirebaseFirestore.instance.collection("homelesses").doc();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  void initState() {
    _getFromCamera();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    descriptionController.dispose();
    super.dispose();
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
                                    frameBuilder: (BuildContext context,
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
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PlacePicker(
                          apiKey: "AIzaSyBn4WLuW17Src7iqWOEkuWPCIS2-d717qA",
                          initialPosition: AddHomelessContent.kInitialPosition,
                          useCurrentLocation: true,
                          selectInitialPosition: true,
                          onPlacePicked: (result) {
                            selectedPlace = result;
                            Navigator.of(context).pop();
                            setState(() {
                              address = selectedPlace.formattedAddress!;
                              sendingLocation = MapInfo(
                                  selectedPlace.placeId.toString(),
                                  selectedPlace.formattedAddress.toString(),
                                  selectedPlace.geometry!.location.lat,
                                  selectedPlace.geometry!.location.lng);
                              _locationController = true;
                            });
                          },
                        );
                      }));
                    },
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.asset(
                            'assets/location.png',
                            height: 8.h,
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: AutoSizeText(
                            address,
                            style: TextStyle(fontSize: 10.sp),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormField(
                  onChanged: (text) {
                    setState(() {
                      if (text.length > 3 && text.isNotEmpty) {
                        _descriptionController = true;
                      } else {
                        _descriptionController = false;
                      }
                    });
                  },
                  controller: descriptionController,
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
                    onPressed: _locationController && _descriptionController
                        ? () async {
                            try {
                              await addHomeless();
                              Navigator.pop(this.context);
                              await _showMyDialog();
                              Navigator.pop(this.context);
                            } catch (e) {
                              print("${e} hatası");
                            }

                            // BU OBJEYİ GÖNDER
                            //sendingLocation
                          }
                        : null,
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

  Future<void> addHomeless() async {
    showLoaderDialog(this.context);

    final kullanici = FirebaseAuth.instance.currentUser!;

    // UploadTask? uploadTask;
    //
    // final path = "${useruID}/${postuID}.jpg";
    // final ref = FirebaseStorage.instance.ref().child(path);
    // uploadTask = ref.putFile(imageFile!);
    // final snapshot =  uploadTask!.whenComplete(() => {});

    HomelessThree homeless = HomelessThree(
        MapInfo(
                selectedPlace.placeId.toString(),
                selectedPlace.formattedAddress.toString(),
                selectedPlace.geometry!.location.lat,
                selectedPlace.geometry!.location.lng)
            .toMap(),
        kullanici.uid,
        DateTime.now().millisecondsSinceEpoch,
        doc.id,
        descriptionController.text,
        doc.id,
        true);

    await uploadFile();

    return doc.set(homeless.toMap());

    // doc.doc("ZUo2T6dncBbmgXqliEt18G5rNMD3").collection("Homelesses")
    //
    //   .add(homeless.toMap())
    //   .then((value) => print("added"))
    //   .catchError((error) => print(error));
  }

  Future uploadFile() async {
    if (imageFile == null) return;
    final fileName = basename(imageFile!.path);
    final destination = 'homelessses/${doc.id}';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(imageFile!);
    } catch (e) {
      print('error occured ${e}');
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Gönderiliyor...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: this.context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Gönderildi'),
          content: SingleChildScrollView(
              child: Icon(
            Icons.done,
            color: Colors.green,
            size: 15.h,
          )),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
