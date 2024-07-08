import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';

class SingleItem extends StatelessWidget {
  bool? isBool = false;
  SingleItem({this.isBool});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 110.h,
                child: Center(
                  child: Image.network(
                      'https://pngimg.com/uploads/beet/small/beet_PNG44.png'),
                ),
              )),
              SizedBox(width: 13.w),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      height: 110.h,
                      child: Column(
                        mainAxisAlignment: isBool == false
                            ? MainAxisAlignment.spaceAround
                            : MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5.h),
                          Text('productname',
                              style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 5.h),
                          Text('50\$/50 Gram',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 10.h),
                          isBool == false
                              ? Container(
                                  margin: EdgeInsets.only(right: 15.w),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        '50 Gram',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.sp),
                                      )),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        size: 20.sp,
                                        color: primaryColor,
                                      )
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: Text(
                                    '50 Gram',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.sp),
                                  ),
                                )
                        ],
                      ))),
              Expanded(
                  child: Container(
                      height: 110.h,
                      padding: isBool == false
                          ? EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 35.h)
                          : EdgeInsets.only(left: 15.w, right: 15.w),
                      child: isBool == false
                          ? Container(
                              //  height: 20.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 20.sp,
                                    color: primaryColor,
                                  ),
                                  Text(
                                    'ADD',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.delete,
                                    size: 30.sp, color: Colors.black54),
                                Container(
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 20.sp,
                                        color: primaryColor,
                                      ),
                                      Text(
                                        'ADD',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ))),
            ],
          ),
        ),
        isBool == false
            ? Container()
            : Divider(
                height: 1.h,
                color: Colors.black12,
              )
      ],
    );
  }
}
