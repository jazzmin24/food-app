import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/widgets/count.dart';

class SingleProduct extends StatefulWidget {
  final VoidCallback? onTap;
  final String productImage;
  final String productName;
  final String productPrice;
  // final String productId;
  // final ProductModel productUnit;
  SingleProduct(
      {required this.onTap,
      required this.productImage,
      required this.productName,
      required this.productPrice

      //this.productId,
      //this.productUnit,

      });

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  // var unitData;
  // var firstValue;
  @override
  Widget build(BuildContext context) {
    // widget.productUnit.productUnit.firstWhere((element) {
    //   setState(() {
    //     firstValue = element;
    //   });
    //   return true;
    // });
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
                          '${widget.productPrice}\$/50 Gram',
                          //  '${widget.productPrice}\$/${unitData == null ? firstValue : unitData}',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Expanded(
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
                                    '50 gram',
                                    style: TextStyle(fontSize: 11.sp),
                                  )),
                                  Center(
                                    child: Icon(Icons.arrow_drop_down,
                                        size: 20.sp, color: primaryColor),
                                  )
                                ],
                              ),
                            )
                                //  ProductUnit(
                                //   onTap: () {
                                //     showModalBottomSheet(
                                //         context: context,
                                //         builder: (context) {
                                //           return Column(
                                //             mainAxisSize: MainAxisSize.min,
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             children: widget
                                //                 .productUnit.productUnit
                                //                 .map<Widget>((data) {
                                //               return Column(
                                //                 children: [
                                //                   Padding(
                                //                     padding: const EdgeInsets
                                //                         .symmetric(
                                //                         vertical: 10,
                                //                         horizontal: 10),
                                //                     child: InkWell(
                                //                       onTap: () async {
                                //                         setState(() {
                                //                           unitData = data;
                                //                         });
                                //                         Navigator.of(context)
                                //                             .pop();
                                //                       },
                                //                       child: Text(
                                //                         data,
                                //                         style: TextStyle(
                                //                             color: primaryColor,
                                //                             fontSize: 18),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 ],
                                //               );
                                //             }).toList(),
                                //           );
                                //         });
                                //   },
                                //   title: unitData == null ? firstValue : unitData,
                                // ),
                                ),
                            SizedBox(width: 5.w),

                            Count()

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
