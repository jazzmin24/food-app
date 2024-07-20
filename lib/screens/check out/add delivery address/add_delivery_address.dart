import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/provider/checkout_provider.dart';
import 'package:food_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddDeliveryAddress extends StatefulWidget {
  @override
  _AddDeliveryAddressState createState() => _AddDeliveryAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider =
        Provider.of<CheckoutProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Add Delivery Address",
          style: TextStyle(color: textColor, fontSize: 18.sp),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        height: 48.h,
        child: checkoutProvider.isloadding == false
            ? MaterialButton(
                onPressed: () {
                  checkoutProvider.validator(context, myType);
                },
                child: Text(
                  "Add Address",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            CustomTextField(
              labelText: "First name",
              controller: checkoutProvider.firstName,
            ),
            CustomTextField(
              labelText: "Last name",
              controller: checkoutProvider.lastName,
            ),
            CustomTextField(
              labelText: "Mobile No",
              controller: checkoutProvider.mobileNo,
            ),
            CustomTextField(
              labelText: "Alternate Mobile No",
              controller: checkoutProvider.alternateMobileNo,
            ),
            CustomTextField(
              labelText: "Society",
              controller: checkoutProvider.society,
            ),
            CustomTextField(
              labelText: "Street",
              controller: checkoutProvider.street,
            ),
            CustomTextField(
              labelText: "Landmark",
              controller: checkoutProvider.landmark,
            ),
            CustomTextField(
              labelText: "City",
              controller: checkoutProvider.city,
            ),
            CustomTextField(
              labelText: "Area",
              controller: checkoutProvider.area,
            ),
            CustomTextField(
              labelText: "Pincode",
              controller: checkoutProvider.pincode,
            ),
            InkWell(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => CustomGoogleMap(),
                //   ),
                // );
              },
              child: Container(
                height: 47.h,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // checkoutProvider.setLoaction == null
                    //     ?
                    Text("Set Loaction")
                    // : Text("Done!"),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.black),
            ListTile(
              title: Text("Address Type*"),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myType,
              title: Text("Home"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.home,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myType,
              title: Text("Work"),
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
              value: AddressTypes.Other,
              groupValue: myType,
              title: Text("Other"),
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
        ),
      ),
    );
  }
}