import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/review_cart_model.dart';

class ReviewCartProvider extends ChangeNotifier {
  //================for sending data
  Future<void> addReviewCartData(
      {required String cartId,
      required String cartName,
      required String cartImage,
      required String cartPrice,
      required int cartQuantity,
      required var cartUnit}) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .set(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdd": true,
        "cartUnit": cartUnit
      },
    );
  }

//============for updating data
  Future<void> updateReviewCartData({
    required String cartId,
    required String cartName,
    required String cartImage,
    required String cartPrice,
    required int cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .update(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdd": true,
      },
    );
  }

  //================== for fetching data
  List<ReviewCartModel> reviewCartDataList = [];
  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];
    QuerySnapshot<Map<String, dynamic>> value = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .get();
    value.docs.forEach((element) {
      ReviewCartModel reviewCartModel =
          ReviewCartModel.fromJson(element.data());
      newList.add(reviewCartModel);
    });
    reviewCartDataList = newList;
    notifyListeners();
  }

  //================= total price
  getTotalPrice() {
    double total = 0.0;
    for (var element in reviewCartDataList) { 
     // double price = double.tryParse(element.cartPrice)?? 00;
      total += (double.tryParse(element.cartPrice)! * element.cartQuantity);
    }
    return total;
  }

  //================== deleting data from firebase
  reviewCartDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}