import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MyRazorpay extends StatefulWidget {
 
  const MyRazorpay({super.key,});

  @override
  State<MyRazorpay> createState() => _MyRazorpayState();
}

class _MyRazorpayState extends State<MyRazorpay> {
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

  @override
  Widget build(BuildContext context) {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    return Scaffold(
      body: Center(
        child: OutlinedButton(
            onPressed: () {
              var options = {
                'key': 'rzp_test_GcZZFDPP0jHtC4',
                'amount': 10000,
                //"${widget.total}",
                'name': 'Acme Corp.',
                'description': 'Fine T-Shirt',
                'prefill': {
                  'contact': '8888888888',
                  'email': 'test@razorpay.com'
                }
              };
              razorpay.open(options);
            },
            child: Text('10')
            ),
      ),
    );
  }
}
