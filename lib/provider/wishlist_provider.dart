import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';

class WishListProvider with ChangeNotifier {
  //================for sending data
  Future<void> addWishlistData({
    required String wishListId,
    required String wishListName,
    required String wishListImage,
    required String wishListPrice,
    required int wishListQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .set(
      {
        "wishListId": wishListId,
        "wishListName": wishListName,
        "wishListImage": wishListImage,
        "wishListPrice": wishListPrice,
        "wishListQuantity": wishListQuantity,
        "wishList": true
      },
    );
  }

  //================== for fetching data
  List<ProductModel> wishlist = [];
  void getWishlistData() async {
    List<ProductModel> newList = [];
    QuerySnapshot<Map<String, dynamic>> value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .get();
    value.docs.forEach((element) {
      ProductModel productModel = ProductModel.fromJson(element.data());
      newList.add(productModel);
    });
    wishlist = newList;
    notifyListeners();
  }

//====================delete data
deleteWishtList(wishListId){
 FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList").doc(wishListId).delete();
}


}
