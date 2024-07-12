import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/provider/review_cart_provider.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  final String productImage;
  final String productName;
  final String productPrice;
  final String productId;
  List<String>? productUnit;
  // var productUnit;

  Count({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
   // required this.productUnit,
  });

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then(
          (value) => {
            if (this.mounted)
              {
                if (value.exists)
                  {
                    setState(() {
                      count = value.get("cartQuantity");
                      isTrue = value.get("isAdd");
                    })
                  }
              }
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    //log(widget.productId);
    ReviewCartProvider reviewCartProvider =
        Provider.of<ReviewCartProvider>(context);
    return Container(
      height: 25.h,
      width: 50.w,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
      child: isTrue == true
          ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                  onTap: () {
                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                      reviewCartProvider.reviewCartDataDelete(widget.productId);
                    } else if (count > 1) {
                      setState(() {
                        count--;
                      });
                      reviewCartProvider.updateReviewCartData(
                        cartId: widget.productId,
                        cartName: widget.productName,
                        cartImage: widget.productImage,
                        cartPrice: widget.productPrice,
                        cartQuantity: count,
                      );
                    }
                  },
                  child: Icon(Icons.remove, size: 15.sp, color: primaryColor)),
              Text("$count",
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold)),
              InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                    reviewCartProvider.updateReviewCartData(
                      cartId: widget.productId,
                      cartName: widget.productName,
                      cartImage: widget.productImage,
                      cartPrice: widget.productPrice,
                      cartQuantity: count,
                    );
                  },
                  child: Icon(Icons.add, size: 15.sp, color: primaryColor))
            ])
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                  reviewCartProvider.addReviewCartData(
                    cartId: widget.productId,
                    cartName: widget.productName,
                    cartImage: widget.productImage,
                    cartPrice: widget.productPrice,
                    cartQuantity: count,
                    cartUnit: widget.productUnit
                  );
                },
                child: Text(
                  'ADD',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ),
    );
  }
}
