import 'package:burada_evsiz_var/objects/map_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomelessTwo {
  final String uID;
  final bool isApproved;
  final MapInfo address;
  final String postOwner;
  final int date;
  final String photoId;
  final String desc;

  const HomelessTwo(this.address, this.postOwner, this.date, this.photoId,
      this.desc, this.uID, this.isApproved);

  Map<String, dynamic> toMap() {
    return {
      "uId": uID,
      "address": address,
      "description": desc,
      "isApproved": isApproved,
      "postDate": date,
      "postOwner": postOwner,
      "photoId": photoId
    };
  }

  factory HomelessTwo.fromDocumentSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> doc}) {
    return HomelessTwo(
        MapInfo(
            doc.data()!["address"]["placeId"],
            doc.data()!["address"]["addressName"],
            doc.data()!["address"]["latitude"],
            doc.data()!["address"]["longitude"]),
        doc.data()!["postOwner"],
        doc.data()!["postDate"],
        doc.data()!["photoId"],
        doc.data()!["description"],
        doc.data()!["uId"],
        doc.data()!["isApproved"]);
  }
}
