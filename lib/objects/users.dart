
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var uId = "";
  var name = "";
  var surName = "";
  var userName = "";
  var mail = "";
  var password = "";
  var userType = "";


   User(this.uId, this.name, this.surName, this.userName, this.mail,
      this.password, this.userType);
}

