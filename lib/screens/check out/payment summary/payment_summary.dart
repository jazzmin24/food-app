import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/provider/review_cart_provider.dart';
import 'package:food_app/screens/check%20out/delivery%20details/single_delivery_item.dart';
import 'package:food_app/screens/check%20out/payment%20summary/my_google_pay.dart';
import 'package:food_app/screens/check%20out/payment%20summary/my_razorpay.dart';
import 'package:food_app/screens/check%20out/payment%20summary/order_item.dart';
import 'package:food_app/screens/my_profile/my_profile.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentSummary extends StatefulWidget {
  // final DeliveryAddressModel deliverAddressList;
  // PaymentSummary({
  //  this.deliverAddressList
  //   });

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    double discount = 30;
    double discountValue = 0;
    double shippingCharge = 3.7;
    double totalPrice = reviewCartProvider.getTotalPrice();
    double total;

    if (totalPrice > 300) {
      discountValue = (totalPrice * discount) / 100;
    }
    total = totalPrice - discountValue + shippingCharge;
razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Payment Summary",
          style: TextStyle(color: textColor, fontSize: 18.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                // SingleDeliveryItem(
                //   address:
                //       "area, ${widget.deliverAddressList.aera}, street, ${widget.deliverAddressList.street}, society ${widget.deliverAddressList.scoirty}, pincode ${widget.deliverAddressList.pinCode}",
                //   title:
                //       "${widget.deliverAddressList.firstName} ${widget.deliverAddressList.lastName}",
                //   number: widget.deliverAddressList.mobileNo,
                //   addressType: widget.deliverAddressList.addressType ==
                //           "AddressTypes.Home"
                //       ? "Home"
                //       : widget.deliverAddressList.addressType ==
                //               "AddressTypes.Other"
                //           ? "Other"
                //           : "Work",
                // ),
                ListTile(
                  title: Text(
                    'Marcus',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    '777 Dunsmuir Street, Vancouver',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(),
                ExpansionTile(
                  children: reviewCartProvider.reviewCartDataList.map((e) {
                    return OrderItem(
                      e: e,
                    );
                  }).toList(),
                  title: Text(
                      "Order Items ${reviewCartProvider.reviewCartDataList.length}"),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Sub Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "\$${totalPrice + 5}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Shipping Charge",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "\$$discountValue",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Coupon Discount",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "\$10",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text("Payment Options"),
                ),
                RadioListTile(
                  activeColor: primaryColor,
                  value: AddressTypes.Home,
                  groupValue: myType,
                  title: Text("Home"),
                  onChanged: (AddressTypes? value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.work,
                    color: primaryColor,
                  ),
                ),
                RadioListTile(
                  activeColor: primaryColor,
                  value: AddressTypes.OnlinePayment,
                  groupValue: myType,
                  title: Text("OnlinePayment"),
                  onChanged: (AddressTypes? value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.devices_other,
                    color: primaryColor,
                  ),
                )
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          '$total',
          // "\$${total + 5 ?? totalPrice}",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
          ),
        ),
        trailing: Container(
          width: 160.w,
          child: MaterialButton(
            onPressed: () {
  if (myType == AddressTypes.OnlinePayment) {
    int amountInPaise = ((totalPrice + 5) * 100).toInt();
    var options = {
      'key': 'rzp_test_GcZZFDPP0jHtC4',
      'amount': amountInPaise,// The amount should be in paise
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {
        'contact': '8888888888',
        'email': 'test@razorpay.com'
      }
    };
    razorpay.open(options); // This opens the Razorpay payment interface
  } else {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MyGooglePay(
          total: total,
        ),
      ),
    );
  }
},

            // onPressed: () {
            //   myType == AddressTypes.OnlinePayment
            //       ? 
            //       Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => MyRazorpay(),
            //           ),
            //         )
            //       : Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => MyGooglePay(
            //               total: total,
            //             ),
            //           ),
            //         );
            // },
            child: Text(
              "Place Order",
              style: TextStyle(
                color: textColor,
              ),
            ),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }




  Razorpay razorpay = Razorpay();

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    log('Payment Successful');
    Fluttertoast.showToast(msg: "Payment Successful");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    log('Payment Failed');
    Fluttertoast.showToast(msg: "Payment Failed");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }


}
