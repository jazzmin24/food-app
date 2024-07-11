import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/provider/wishlist_provider.dart';

import 'package:food_app/widgets/single_item.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  // WishListProvider wishListProvider;

  showAlertDialog(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = ElevatedButton(
      child: Text("Yes"),
      onPressed: () {
        Provider.of<WishListProvider>(context, listen: false)
            .deleteWishtList(delete.productId);
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Wishlist Product"),
      content: Text("Do you want to delete?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<WishListProvider>(context, listen: false).getWishlistData();
  // }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider =
        Provider.of<WishListProvider>(context, listen: false);
    wishListProvider.getWishlistData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "WishList",
          style: TextStyle(color: textColor, fontSize: 18.sp),
        ),
      ),
      body: ListView(
        children: wishListProvider.wishlist.map((data) {
          return Column(
            children: [
              SizedBox(height: 10.h),
              SingleItem(
                isBool: true,
                //wishList: true,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                productQuantity: data.productQuantity,
                onDelete: () {
                  showAlertDialog(context, data);
                },
              ),
            ],
          );
        }).toList(),
      ),

      // ListView.builder(
      //   itemCount: wishListProvider.wishlist.length,
      //   itemBuilder: (context, index) {
      //     ProductModel data = wishListProvider.wishlist[index];
      //     log("Image URL: ${data.productImage}");
      //     return Column(
      //       children: [
      //         SizedBox(height: 10.h),
      //         SingleItem(
      //           isBool: true,
      //           wishList: true,
      //           productImage: data.productImage,
      //           productName: data.productName,
      //           productPrice: data.productPrice,
      //           productId: data.productId,
      //           productQuantity: data.productQuantity,
      //           onDelete: () {
      //             showAlertDialog(context,data);
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // ),
    );
  }
}
