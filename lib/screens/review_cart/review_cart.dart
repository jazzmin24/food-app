import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/widgets/single_item.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({super.key});

  //ReviewCartProvider reviewCartProvider;
  // showAlertDialog(BuildContext context, ReviewCartModel delete) {
  //   // set up the buttons
  //   Widget cancelButton = FlatButton(
  //     child: Text("No"),
  //     onPressed: () {
  //       Navigator.of(context).pop();
  //     },
  //   );
  //   Widget continueButton = FlatButton(
  //     child: Text("Yes"),
  //     onPressed: () {
  //       reviewCartProvider.reviewCartDataDelete(delete.cartId);
  //       Navigator.of(context).pop();
  //     },
  //   );

  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Cart Product"),
  //     content: Text("Are you devete on cartProduct?"),
  //     actions: [
  //       cancelButton,
  //       continueButton,
  //     ],
  //   );

  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    // reviewCartProvider.getReviewCartData();
    return Scaffold(
        bottomNavigationBar: ListTile(
          title: Text("Total Amount"),
          subtitle: Text(
            '\$170.00',
            //  "\$ ${reviewCartProvider.getTotalPrice()}",
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
                // if(reviewCartProvider.getReviewCartDataList.isEmpty){
                //   return Fluttertoast.showToast(msg: "No Cart Data Found");
                // }
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => DeliveryDetails(),
                //   ),
                // );
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
        body:
            // reviewCartProvider.getReviewCartDataList.isEmpty
            //     ? Center(
            //         child: Text("NO DATA"),
            //       )
            //     : ListView.builder(
            //         itemCount: reviewCartProvider.getReviewCartDataList.length,
            //         itemBuilder: (context, index) {
            //           ReviewCartModel data =
            //               reviewCartProvider.getReviewCartDataList[index];
            //           return
            Column(
          children: [
            SizedBox(height: 10.h),
            SingleItem(
              isBool: true,
            ),
            SingleItem(), SingleItem(), SizedBox(height: 10.h),
            // SingleItem(
            //   isBool: true,
            //   wishList: false,
            //   productImage: data.cartImage,
            //   productName: data.cartName,
            //   productPrice: data.cartPrice,
            //   productId: data.cartId,
            //   productQuantity: data.cartQuantity,
            //   productUnit: data.cartUnit,
            //   onDelete: () {
            //     showAlertDialog(context, data);
            //   },
            // ),
          ],
        )
        //},
        );
    //);
  }
}
