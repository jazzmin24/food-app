import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      // drawer: DrawerSide(
      //   userProvider: userProvider,
      // ),
      drawer: Drawer(
        child: Container(
          color: primaryColor,
          child: ListView(
            children: [
              DrawerHeader(
                // child: SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43.sp,
                      backgroundColor: Colors.white54,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        // backgroundImage: NetworkImage(
                        //   userData.userImage ??
                        //       "https://s3.envato.com/files/328957910/vegi_thumb.png",
                        // ),
                        radius: 40.sp,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(userData.userName),
                        Text('Welcome Guest'),
                        SizedBox(height: 7.h),
                        Container(
                          height: 30.h,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text("Login"),
                            style: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                          ),
                        )
                        // Text(
                        //   userData.userEmail,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                      ],
                    )
                  ],
                ),
                // ),
              ),
              // listTile(
              //   iconData: Icons.home_outlined,
              //   title: "Home",
              //   onTap: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => HomeScreen(),
              //       ),
              //     );
              //   },
              // ),
              // listTile(
              //   iconData: Icons.shop_outlined,
              //   title: "Review Cart",
              //   onTap: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => ReviewCart(),
              //       ),
              //     );
              //   },
              // ),
              // listTile(
              //   iconData: Icons.person_outlined,
              //   title: "My Profile",
              //   onTap: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) =>
              //             MyProfile(userProvider: widget.userProvider),
              //       ),
              //     );
              //   },
              // ),
              // listTile(
              //     iconData: Icons.notifications_outlined, title: "Notificatio"),
              // listTile(iconData: Icons.star_outline, title: "Rating & Review"),
              // listTile(
              //     iconData: Icons.favorite_outline,
              //     title: "Wishlist",
              //     onTap: () {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) => WishLsit(),
              //         ),
              //       );
              //     }),
              // listTile(
              //     iconData: Icons.copy_outlined, title: "Raise a Complaint"),
              // listTile(iconData: Icons.format_quote_outlined, title: "FAQs"),
              // Container(
              //   height: 350,
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text("Contact Support"),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       Row(
              //         children: [
              //           Text("Call us:"),
              //           SizedBox(
              //             width: 10,
              //           ),
              //           Text("+923352580282"),
              //         ],
              //       ),
              //       SizedBox(
              //         height: 5,
              //       ),
              //       SingleChildScrollView(
              //         scrollDirection: Axis.horizontal,
              //         child: Row(
              //           children: [
              //             Text("Mail us:"),
              //             SizedBox(
              //               width: 10,
              //             ),
              //             Text(
              //               "assarbaloch5@gmail.com",
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),

      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Home',
          style: TextStyle(color: textColor, fontSize: 17.sp),
        ),
        actions: [
          CircleAvatar(
            radius: 15.sp,
            backgroundColor: Color(0xffd6d382),
            child: IconButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         Search(search: productProvider.gerAllProductSearch),
                //   ),
                // );
              },
              icon: Icon(
                Icons.search,
                size: 17.sp,
                color: textColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => ReviewCart(),
                //   ),
                // );
              },
              child: CircleAvatar(
                backgroundColor: Color(0xffd6d382),
                radius: 15.sp,
                child: Icon(
                  Icons.shop,
                  size: 17.sp,
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: primaryColor,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: ListView(
          children: [
            Container(
              height: 150.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Xg-k622Sbztlrb-L1o1CAla3zCbVc2lUw&usqp=CAU'),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 170.w),
                            child: Container(
                              height: 50.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Color(0xffd1ad17),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Vegi',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                          color: Colors.green,
                                          blurRadius: 10,
                                          offset: Offset(3, 3))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 33.w),
                            child: Text(
                              '30% Off',
                              style: TextStyle(
                                fontSize: 40.sp,
                                color: Colors.green[100],
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.sp,
                                    color: Colors.green.withOpacity(0.7),
                                    offset: Offset(0, 0),
                                  ),
                                  Shadow(
                                    blurRadius: 20.sp,
                                    color: Colors.green.withOpacity(0.5),
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 66.w),
                            child: Text(
                              'On all vegetables products',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            _buildHerbsProduct(context),
            // _buildFreshProduct(context),
            // _buildRootProduct(),
          ],
        ),
      ),
    );
  }
}

Widget _buildHerbsProduct(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Herbs Seasonings'),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => Search(
                //       search: productProvider.getHerbsProductDataList,
                //     ),
                //   ),
                // );
              },
              child: Text(
                'view all',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //     children: productProvider.getHerbsProductDataList.map(
      //       (herbsProductData) {
      //         return SingleProduct(
      //           onTap: () {
      //             Navigator.of(context).push(
      //               MaterialPageRoute(
      //                 builder: (context) => ProductOverview(
      //                   productId: herbsProductData.productId,
      //                   productPrice: herbsProductData.productPrice,
      //                   productName: herbsProductData.productName,
      //                   productImage: herbsProductData.productImage,
      //                 ),
      //               ),
      //             );
      //           },
      //           productId: herbsProductData.productId,
      //           productPrice: herbsProductData.productPrice,
      //           productImage: herbsProductData.productImage,
      //           productName: herbsProductData.productName,
      //           productUnit: herbsProductData,
      //         );
      //       },
      //     ).toList(),
      //     // children: [

      //     // ],
      //   ),
      // ),
    ],
  );
}
