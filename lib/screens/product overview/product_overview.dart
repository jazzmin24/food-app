import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';

enum SigninCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productPrice;
  // final String productId;
  ProductOverview(
      {
      //this.productId,
      required this.productImage,
      required this.productName,
      required this.productPrice});

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SigninCharacter _character = SigninCharacter.fill;

  // bool wishListBool = false;

  // getWishtListBool() {
  //   FirebaseFirestore.instance
  //       .collection("WishList")
  //       .doc(FirebaseAuth.instance.currentUser.uid)
  //       .collection("YourWishList")
  //       .doc(widget.productId)
  //       .get()
  //       .then((value) => {
  //             if (this.mounted)
  //               {
  //                 if (value.exists)
  //                   {
  //                     setState(
  //                       () {
  //                         wishListBool = value.get("wishList");
  //                       },
  //                     ),
  //                   }
  //               }
  //           });
  // }

  @override
  Widget build(BuildContext context) {
    //getWishtListBool();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Product Overview",
          style: TextStyle(color: textColor),
        ),
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: Text("\$${widget.productPrice}"
                    ),
                  ),
                  Container(
                      height: 250,
                      padding: EdgeInsets.all(40),
                      child: Image.network(
                        //  widget.productImage,
                        widget.productImage ?? "",
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Available Options",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              value: SigninCharacter.fill,
                              groupValue: _character,
                              activeColor: Colors.green[700],
                              onChanged: (value) {
                                setState(() {
                                  _character = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        Text('\$50'
                            //"\$${widget.productPrice}"
                            ),
                        // Count(
                        //   productId: widget.productId,
                        //   productImage: widget.productImage,
                        //   productName: widget.productName,
                        //   productPrice: widget.productPrice,
                        //   productUnit: '500 Gram',
                        // ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 17.sp,
                                color: primaryColor,
                              ),
                              Text(
                                "ADD",
                                style: TextStyle(color: primaryColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: ListView(
                children: [
                  Text(
                    "About This Product",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "We are providing fresh fruits and vegetables of a customer. Wikipedi In marketing, a product is an object or system made available for consumer use; it is anything that can be offered to a market to satisfy the desire or need of a customer.",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorBar(
              backgroundColor: textColor,
              color: Colors.white70,
              iconColor: Colors.grey,
              title: "Add To WishList",
              iconData:
                  // wishListBool == false?
                  Icons.favorite_outline
              // : Icons.favorite
              // onTap: () {
              //   setState(() {
              //     wishListBool = !wishListBool;
              //   });

              // }
              ),
          bottomNavigatorBar(
            backgroundColor: primaryColor,
            color: textColor,
            iconColor: Colors.white70,
            title: "Go To Cart",
            iconData: Icons.shop_outlined,
            // onTap: () {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (context) => ReviewCart(),
            //     ),
            //   );
            // }
          ),
        ],
      ),
    );
  }
}

Widget bottomNavigatorBar({
  Color? iconColor,
  Color? backgroundColor,
  Color? color,
  String? title,
  IconData? iconData,
  VoidCallback? onTap,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 20,
              color: iconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title!,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    ),
  );
}
