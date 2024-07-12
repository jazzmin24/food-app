import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/widgets/count.dart';
import 'package:food_app/widgets/product_unit.dart';

class SingleProduct extends StatefulWidget {
  final VoidCallback? onTap;
  final String productImage;
  final String productName;
  final String productPrice;
  final String productId;
  //final productUnit;
  List<String> productUnit;
  SingleProduct({
    required this.onTap,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
    required this.productUnit,
  });

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {
    widget.productUnit.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      log("Product Units: ${widget.productUnit.toString()}");
      return true;
    });
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10.w),
            height: 237.h,
            width: 165.w,
            decoration: BoxDecoration(
              color: Color(0xffd9dad9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    height: 150.h,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      widget.productImage,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.productPrice}\$/${unitData ?? firstValue}',
                          //  '${widget.productPrice}\$/${unitData == null ? firstValue : unitData}',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Expanded(
                                child: ProductUnit(
                                    onTap: () {
                                      showModalBottomSheet(
                                          backgroundColor:
                                              scaffoldBackgroundColor,
                                          context: context,
                                          builder: (context) {
                                            return FractionallySizedBox(
                                              widthFactor: 0.97,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: widget
                                                    .productUnit
                                                    .map<Widget>((data) {
                                                  return Column(
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          vertical: 10.h,
                                                        ),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            setState(() {
                                                              unitData = data;
                                                            });
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Center(
                                                            child: Text(
                                                              data,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  // fontWeight:
                                                                  //     FontWeight
                                                                  //         .w600,
                                                                  fontSize:
                                                                      18.sp),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        color: Colors.black26,
                                                      ),
                                                    ],
                                                  );
                                                }).toList(),
                                              ),
                                            );
                                          });
                                    },
                                    title: unitData ?? firstValue)
                                // title: unitData==null?firstValue:unitData
                                //Use the '??' operator rather than '?:' when testing for 'null'.
                                // InkWell(
                                //   onTap: () {
                                //     showModalBottomSheet(
                                //         context: context,
                                //         builder: (context) {
                                //           return Column(
                                //             mainAxisSize: MainAxisSize.min,
                                //             children: <Widget>[
                                //               ListTile(
                                //                 title: new Text('250 Gram'),
                                //                 onTap: () {
                                //                   Navigator.pop(context);
                                //                 },
                                //               ),
                                //               ListTile(
                                //                 title: new Text('500 Gram'),
                                //                 onTap: () {
                                //                   Navigator.pop(context);
                                //                 },
                                //               ),
                                //               ListTile(
                                //                 title: new Text('1 Kg'),
                                //                 onTap: () {
                                //                   Navigator.pop(context);
                                //                 },
                                //               ),
                                //             ],
                                //           );
                                //         });
                                //   },
                                //   child: Container(
                                //     padding: EdgeInsets.only(left: 5.w),
                                //     height: 25.h,
                                //     decoration: BoxDecoration(
                                //         border: Border.all(color: Colors.grey),
                                //         borderRadius: BorderRadius.circular(8)),
                                //     child: Row(
                                //       children: [
                                //         Expanded(
                                //             child: Text(
                                //           '50 gram',
                                //           style: TextStyle(fontSize: 11.sp),
                                //         )),
                                //         Center(
                                //           child: Icon(Icons.arrow_drop_down,
                                //               size: 20.sp, color: primaryColor),
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // )
                                //

                                ),
                            SizedBox(width: 5.w),

                            Count(
                              productImage: widget.productImage,
                              productName: widget.productName,
                              productPrice: widget.productPrice,
                              productId: widget.productId,
                            )

                            // Count(
                            //   productId: widget.productId,
                            //   productImage: widget.productImage,
                            //   productName: widget.productName,
                            //   productPrice: widget.productPrice,
                            //   productUnit:
                            //       unitData == null ? firstValue : unitData,
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
