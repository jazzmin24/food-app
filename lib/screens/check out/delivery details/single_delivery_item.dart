import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String title;
  final String address;
  final String number;
  final String addressType;
  SingleDeliveryItem(
      {required this.title,
      required this.addressType,
      required this.address,
      required this.number});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              Container(
                // width: 60.w,
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                // height: 20.h,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    addressType,
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 8.sp,
            backgroundColor: primaryColor,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address),
              SizedBox(
                height: 5.h,
              ),
              Text(number),
            ],
          ),
        ),
        Divider(height: 35.h),
      ],
    );
  }
}