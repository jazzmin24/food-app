import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/provider/user_provider.dart';
import 'package:food_app/screens/home%20/home_screen.dart';
import 'package:food_app/screens/my_profile/my_profile.dart';
import 'package:food_app/screens/review_cart/review_cart.dart';
import 'package:food_app/screens/wishlist/wishlist.dart';

class DrawerSide extends StatefulWidget {
  UserProvider userProvider;
  DrawerSide({super.key, required this.userProvider});

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget listTile(
      {required String title,
      required IconData iconData,
      VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      visualDensity: VisualDensity(vertical: 2),
      leading: Icon(
        iconData,
        size: 32.sp,
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;

    return Drawer(
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
                      backgroundImage: NetworkImage(
                        userData?.userImage ??
                            "https://s3.envato.com/files/328957910/vegi_thumb.png",
                      ),
                      radius: 40.sp,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userData!.userName,
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        userData.userEmail,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )

                  //   listTile(title: Text(userData.userName), iconData: iconData)
                ],
              ),
              //),
            ),
            listTile(
              iconData: Icons.home_outlined,
              title: "Home",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.shop_outlined,
              title: "Review Cart",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.person_outlined,
              title: "My Profile",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyProfile(userData:userData)),
                );
              },
            ),
            listTile(
                iconData: Icons.notifications_outlined, title: "Notification"),
            listTile(iconData: Icons.star_outline, title: "Rating & Review"),
            listTile(
                iconData: Icons.favorite_outline,
                title: "Wishlist",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WishList(),
                    ),
                  );
                }),
            listTile(iconData: Icons.copy_outlined, title: "Raise a Complaint"),
            listTile(iconData: Icons.format_quote_outlined, title: "FAQs"),
            Container(
              height: 350.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text("Call us:"),
                      SizedBox(width: 10.w),
                      Text("+923352580282"),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail us:"),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "assarbaloch5@gmail.com",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}