import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class MyGooglePay extends StatefulWidget {
  final total;
  MyGooglePay({this.total});

  @override
  State<MyGooglePay> createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {


  // In your Stateless Widget class or State
  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server or PSP
  }

  @override
  Widget build(BuildContext context) {
    final Future<PaymentConfiguration> _googlePayConfigFuture =
        PaymentConfiguration.fromAsset('sample_payment_configuration.json');

    return FutureBuilder<PaymentConfiguration>(
        future: _googlePayConfigFuture,
        builder: (context, snapshot) => snapshot.hasData
            ? Center(
                child: GooglePayButton(
                  paymentConfiguration: snapshot.data!,
                  paymentItems: [PaymentItem(
      label: 'Total',
      amount: '${widget.total}',
      status: PaymentItemStatus.final_price,
    ),],
                  type: GooglePayButtonType.buy,
                  margin: const EdgeInsets.only(top: 15.0),
                  onPaymentResult: onGooglePayResult,
                  loadingIndicator: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            : const SizedBox.shrink());
  }
}
