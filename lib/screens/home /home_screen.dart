import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/home%20/drawer_side.dart';
import 'package:food_app/screens/home%20/single_product.dart';
import 'package:food_app/screens/product%20overview/product_overview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerSide(
      //   userProvider: userProvider,
      // ),
      drawer: DrawerSide(),
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
            _buildFreshProduct(context),
            _buildRootProduct(context),
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
            Text(
              'Herbs Seasonings',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SingleProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productImage:
                                'https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
                            productName: 'Fresh Basil',
                          )));
                },
                productImage:
                    'https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
                productName: 'Fresh Basil'),
            SingleProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                          productImage:
                              'https://pngimg.com/uploads/mint/small/mint_PNG36.png',
                          productName: 'Fresh Mint')));
                },
                productImage:
                    'https://pngimg.com/uploads/mint/small/mint_PNG36.png',
                productName: 'Fresh Mint'),
            SingleProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                          productImage:
                              'https://www.pngarts.com/files/5/Rosemary-Transparent-Image.png',
                          productName: 'Rose Merry')));
                },
                productImage:
                    'https://www.pngarts.com/files/5/Rosemary-Transparent-Image.png',
                productName: 'Rose Merry'),
          ],
          // children: productProvider.getHerbsProductDataList.map(
          //   (herbsProductData) {
          //     return SingleProduct(
          //       onTap: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) => ProductOverview(
          //               productId: herbsProductData.productId,
          //               productPrice: herbsProductData.productPrice,
          //               productName: herbsProductData.productName,
          //               productImage: herbsProductData.productImage,
          //             ),
          //           ),
          //         );
          //       },
          //       productId: herbsProductData.productId,
          //       productPrice: herbsProductData.productPrice,
          //       productImage: herbsProductData.productImage,
          //       productName: herbsProductData.productName,
          //       productUnit: herbsProductData,
          //     );
          //   },
          // ).toList(),
        ),
      ),
    ],
  );
}

Widget _buildFreshProduct(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Fresh Fruits',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SingleProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                          productImage:
                              'https://www.pngmart.com/files/3/Watermelon-PNG-Photos.png',
                          productName: 'Watermelon')));
                },
                productImage:
                    'https://www.pngmart.com/files/3/Watermelon-PNG-Photos.png',
                productName: 'Watermelon'),
            SingleProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                          productImage:
                              'https://www.pngall.com/wp-content/uploads/2016/04/Grape-Transparent.png',
                          productName: 'Grapes')));
                },
                productImage:
                    'https://www.pngall.com/wp-content/uploads/2016/04/Grape-Transparent.png',
                productName: 'Grapes'),
            SingleProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                          productImage:
                              'https://pluspng.com/img-png/mango-hd-png-mango-transparent-png-image-1000.png',
                          productName: 'Mango')));
                },
                productImage:
                    'https://pluspng.com/img-png/mango-hd-png-mango-transparent-png-image-1000.png',
                productName: 'Mango'),
          ],
          // children: productProvider.getHerbsProductDataList.map(
          //   (herbsProductData) {
          //     return SingleProduct(
          //       onTap: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) => ProductOverview(
          //               productId: herbsProductData.productId,
          //               productPrice: herbsProductData.productPrice,
          //               productName: herbsProductData.productName,
          //               productImage: herbsProductData.productImage,
          //             ),
          //           ),
          //         );
          //       },
          //       productId: herbsProductData.productId,
          //       productPrice: herbsProductData.productPrice,
          //       productImage: herbsProductData.productImage,
          //       productName: herbsProductData.productName,
          //       productUnit: herbsProductData,
          //     );
          //   },
          // ).toList(),
        ),
      ),
    ],
  );
}

Widget _buildRootProduct(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Root Vegetable',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SingleProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                          productImage:
                              'https://pngimg.com/uploads/beet/small/beet_PNG44.png',
                          productName: 'Beetroot')));
                },
                productImage:
                    'https://pngimg.com/uploads/beet/small/beet_PNG44.png',
                productName: 'Beetroot'),
            SingleProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                          productImage:
                              'https://pngimg.com/uploads/celery/small/celery_PNG29.png',
                          productName: 'Celery')));
                },
                productImage:
                    'https://pngimg.com/uploads/celery/small/celery_PNG29.png',
                productName: 'Celery'),
            SingleProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                          productImage:
                              'https://pluspng.com/img-png/carrot-hd-png-havuc-png-resmi-carrot-png-600.png',
                          productName: 'Carrot')));
                },
                productImage:
                    'https://pluspng.com/img-png/carrot-hd-png-havuc-png-resmi-carrot-png-600.png',
                productName: 'Carrot'),
          ],
          // children: productProvider.getHerbsProductDataList.map(
          //   (herbsProductData) {
          //     return SingleProduct(
          //       onTap: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) => ProductOverview(
          //               productId: herbsProductData.productId,
          //               productPrice: herbsProductData.productPrice,
          //               productName: herbsProductData.productName,
          //               productImage: herbsProductData.productImage,
          //             ),
          //           ),
          //         );
          //       },
          //       productId: herbsProductData.productId,
          //       productPrice: herbsProductData.productPrice,
          //       productImage: herbsProductData.productImage,
          //       productName: herbsProductData.productName,
          //       productUnit: herbsProductData,
          //     );
          //   },
          // ).toList(),
        ),
      ),
    ],
  );
}
