import 'package:burada_evsiz_var/objects/map_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomelessThree {
  final String uID;
  final bool isApproved;
  final Map address;
  final String postOwner;
  final int date;
  final String photoId;
  final String desc;

  const HomelessThree(this.address, this.postOwner, this.date, this.photoId,
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

  factory HomelessThree.fromDocumentSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> doc}) {
    return HomelessThree(
        MapInfo(
                doc.data()!["address"]["placeId"],
                doc.data()!["address"]["addressName"],
                doc.data()!["address"]["latitude"],
                doc.data()!["address"]["longitude"])
            .toMap(),
        doc.data()!["postOwner"],
        doc.data()!["postDate"],
        doc.data()!["photoId"],
        doc.data()!["description"],
        doc.data()!["uId"],
        doc.data()!["isApproved"]);
  }
}
