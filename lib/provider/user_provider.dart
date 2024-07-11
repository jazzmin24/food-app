import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/user_model.dart';

//Encapsulation: The method addUserData is designed to be reusable and
//self-contained. By making its requirements explicit, it becomes easier
//to use and understand in different contexts, beyond just the current scenario.

class UserProvider with ChangeNotifier {
  Future<void> addUserData({
    required User currentUser,
    required String userName,
    required String userImage,
    required String userEmail,
  }) async {
    await FirebaseFirestore.instance
        .collection("usersData")
        .doc(currentUser.uid)
        .set(
      {
        "userName": userName,
        "userEmail": userEmail,
        "userImage": userImage,
        "userUid": currentUser.uid,
      },
    );
  }

  //=============to get data
  UserModel? currentUserData;
  getUserData() async {
    var value = await FirebaseFirestore.instance
        .collection("usersData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
     //log('User data fetched: ${value.data()}');
      UserModel userModel = UserModel.fromJson(value.data()!);
      currentUserData = userModel;
      notifyListeners();
    }
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class UserProvider with ChangeNotifier {

// void addUserData({
//       User currentUser,
//       String userName,
//       String userImage,
//       String userEmail,
//   }) async {
//     await FirebaseFirestore.instance
//         .collection("usersData")
//         .doc(currentUser.uid)
//         .set(
//       {
//         "userName": userName,
//         "userEmail": userEmail,
//         "userImage": userImage,
//         "userUid": currentUser.uid,
//       },
//     );
//   }

// }
