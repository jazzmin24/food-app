import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/review_cart_model.dart';
import 'package:food_app/provider/review_cart_provider.dart';
import 'package:food_app/screens/check%20out/delivery%20details/delivery_details.dart';
import 'package:food_app/widgets/single_item.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({super.key});

  showAlertDialog(BuildContext context, ReviewCartModel delete) {
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
        Provider.of<ReviewCartProvider>(context, listen: false)
            .reviewCartDataDelete(delete.cartId);
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("Do you want to delete cartProduct?"),
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

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider =
        Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          '\$${reviewCartProvider.getTotalPrice()}',
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
        trailing: Container(
          width: 160.w,
          child: MaterialButton(
            child: Text("Submit"),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {
              if (reviewCartProvider.reviewCartDataList.isEmpty) {
               // return Fluttertoast.showToast(msg: 'No cart Data Found');
              }
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DeliveryDetails(),
                ),
              );
            },
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Review Cart",
          style: TextStyle(color: textColor, fontSize: 18.sp),
        ),
      ),
      body: reviewCartProvider.reviewCartDataList.isEmpty
          ? Center(
              child: Text("NO DATA"),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.reviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.reviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                        isBool: true,
                        //wishList: false,
                        productImage: data.cartImage,
                        productName: data.cartName,
                        productPrice: data.cartPrice,
                        productId: data.cartId,
                        productQuantity: data.cartQuantity,
                        productUnit: data.cartUnit,
                        onDelete: () {
                          showAlertDialog(context, data);
                        }),
                  ],
                );
              },
            ),
      // Column(
      //   children: [
      //     SizedBox(height: 10.h),
      //     SingleItem(
      //       isBool: true,
      //       productImage: '',
      //       productName: 'hinjh',
      //       productPrice: '345',
      //     ),
      //     SingleItem(),
      //     SizedBox(height: 10.h),
    );
  }
}