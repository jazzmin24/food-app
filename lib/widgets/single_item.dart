import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/provider/review_cart_provider.dart';
import 'package:food_app/widgets/count.dart';
import 'package:provider/provider.dart';

class SingleItem extends StatefulWidget {
  bool isBool = false;
  bool? wishlist = false;
  String productImage;
  String productName;
  String productPrice;
  String productId;
  int productQuantity;
  Function()? onDelete;

  SingleItem(
      {required this.isBool,
      this.wishlist,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      this.onDelete,
      required this.productId,
      required this.productQuantity});

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  late int count;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    log("/-------------$count");
    // log("check cart Quantity ${widget.productQuantity}");
    ReviewCartProvider reviewCartProvider =
        Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 120.h,
                child: Center(
                  child: Image.network(widget.productImage!),
                ),
              )),
              SizedBox(width: 13.w),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      height: 110.h,
                      child: Column(
                        mainAxisAlignment: widget.isBool == false
                            ? MainAxisAlignment.spaceAround
                            : MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5.h),
                          Text(widget.productName!,
                              style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 5.h),
                          Text('${widget.productPrice}\$/50 Gram',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 10.h),
                          widget.isBool == false
                              ? InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              ListTile(
                                                title: new Text('250 Gram'),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ListTile(
                                                title: new Text('500 Gram'),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ListTile(
                                                title: new Text('1 Kg'),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: Container(
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
                      padding: widget.isBool == false
                          ? EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 35.h)
                          : EdgeInsets.only(left: 15.w, right: 15.w),
                      child: widget.isBool == false
                          ? Count(
                              productImage: widget.productImage,
                              productName: widget.productName,
                              productPrice: widget.productPrice,
                              productId: widget.productId,
                            )
                          // Container(
                          //     //  height: 20.h,
                          //     decoration: BoxDecoration(
                          //       border: Border.all(color: Colors.grey),
                          //       borderRadius: BorderRadius.circular(30),
                          //     ),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Icon(
                          //           Icons.add,
                          //           size: 20.sp,
                          //           color: primaryColor,
                          //         ),
                          //         Text(
                          //           'ADD',
                          //           style: TextStyle(
                          //               color: Colors.grey, fontSize: 14.sp),
                          //         ),
                          //       ],
                          //     ),
                          //   )

                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: widget.onDelete,
                                  child: Icon(Icons.delete,
                                      size: 30.sp, color: Colors.black54),
                                ),
                                //wishlist == false?
                                Container(
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (count == 1) {
                                            log('message');
                                            // Fluttertoast.showToast(
                                            //     msg:
                                            //         "You reach the maximum limit");
                                          } else {
                                            setState(() {
                                              count--;
                                            });
                                            reviewCartProvider
                                                .updateReviewCartData(
                                                    cartId: widget.productId,
                                                    cartName:
                                                        widget.productName,
                                                    cartImage:
                                                        widget.productImage,
                                                    cartPrice:
                                                        widget.productPrice,
                                                    cartQuantity: count);
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          size: 20.sp,
                                          color: primaryColor,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.h),
                                        child: Text(
                                          "$count",
                                          // '1',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16.sp),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (count < 5) {
                                            setState(() {
                                              count++;
                                            });
                                            reviewCartProvider
                                                .updateReviewCartData(
                                                    cartId: widget.productId,
                                                    cartName:
                                                        widget.productName,
                                                    cartImage:
                                                        widget.productImage,
                                                    cartPrice:
                                                        widget.productPrice,
                                                    cartQuantity: count);
                                          }
                                        },
                                        child: Icon(
                                          Icons.add,
                                          size: 20.sp,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                //   : Container()
                              ],
                            ))),
            ],
          ),
        ),
        // isBool == false
        //     ? Container()
        //     :
        Divider(
          height: 1.h,
          color: Colors.black12,
        )
      ],
    );
  }
}
