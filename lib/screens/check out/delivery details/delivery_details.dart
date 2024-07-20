import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/check%20out/add%20delivery%20address/add_delivery_address.dart';
import 'package:food_app/screens/check%20out/delivery%20details/single_delivery_item.dart';

class DeliveryDetails extends StatefulWidget {
  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  // DeliveryAddressModel value;
  @override
  Widget build(BuildContext context) {
    //  CheckoutProvider deliveryAddressProvider = Provider.of(context);
    // deliveryAddressProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Delivery Details",
          style: TextStyle(color: textColor, fontSize: 18.sp),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliveryAddress(),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        // width: 160,
        height: 48.h,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: MaterialButton(
          child: Text("Add new Address"),
          //deliveryAddressProvider.getDeliveryAddressList.isEmpty?
          //Text("Add new Address")
          //: Text("Payment Summary"),
          onPressed: () {
            // deliveryAddressProvider.getDeliveryAddressList.isEmpty
            //     ?
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddDeliveryAddress(),
              ),
            );
            //     :
            // Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (context) => PaymentSummary(
            //             deliverAddressList: value,
            //           ),
            //         ),
            //       );
          },
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text(
              "Deliver To",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          // deliveryAddressProvider.getDeliveryAddressList.isEmpty
          //     ? Center(
          //         child: Container(
          //           child: Center(
          //             child: Text("No Data"),
          //           ),
          //         ),
          //       )
          //     :
          //      Column(
          //         children: deliveryAddressProvider.getDeliveryAddressList
          //             .map<Widget>((e) {
          //           setState(() {
          //           value  = e;
          //           });
          //           return SingleDeliveryItem(
          //             address:
          //                 "aera, ${e.aera}, street, ${e.street}, society ${e.scoirty}, pincode ${e.pinCode}",
          //             title: "${e.firstName} ${e.lastName}",
          //             number: e.mobileNo,
          //             addressType: e.addressType == "AddressTypes.Home"
          //                 ? "Home"
          //                 : e.addressType == "AddressTypes.Other"
          //                     ? "Other"
          //                     : "Work",
          //           );
          //         }).toList(),
          //       )
          Column(
            children: [
              SingleDeliveryItem(
                  title: 'title',
                  addressType: 'Home',
                  address: 'address',
                  number: '6')
            ],
          )
        ],
      ),
    );
  }
}