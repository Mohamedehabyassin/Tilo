import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseService extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("User");
  dynamic userData = null;

  DatabaseService() {
     pushData();
  }

  Future<void> addUser(String name) async {
    final User user = auth.currentUser;
    return await userCollection
        .doc(user.uid)
        .set({
      'userName': '',
      'fullName': name,
      'eMail': '',
      'phone': '',
      'address': ''
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  pushData() async {
     await getUserData().then((value) {
     userData =  value;
     notifyListeners();
    });

  }

  getUserData() async {
    final User user = auth.currentUser;
    if(user!= null){
      return userCollection.doc(user.uid).get();
    }
    return null;

  }

  Future updateUserData(String userName, String fullName, String eMail,
      String phone, String address) async {
    final User user = auth.currentUser;
    final userId = user.uid;
     return await userCollection.doc(userId).update({
      'userName': userName,
      'fullName': fullName,
      'eMail': eMail,
      'phone': phone,
      'address': address,

    });

  }
}
