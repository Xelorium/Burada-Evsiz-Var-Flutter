class HomelessTwo {
  final String uID;
  final bool isApproved;
  final Map address;
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
}
