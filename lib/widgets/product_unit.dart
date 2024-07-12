import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';

class ProductUnit extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  ProductUnit({required this.onTap, required this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 5.w),
        height: 25.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Expanded(
                child: Text(
              title,
              style: TextStyle(fontSize: 11.sp),
            )),
            Center(
              child:
                  Icon(Icons.arrow_drop_down, size: 20.sp, color: primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
