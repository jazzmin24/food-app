import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/home%20/drawer_side.dart';

class MyProfile extends StatefulWidget {
  // UserProvider userProvider;
  // MyProfile({this.userProvider});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    // var userData = widget.userProvider.currentUserData;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 18.sp,
            color: textColor,
          ),
        ),
      ),
      drawer: DrawerSide(
          // userProvider: widget.userProvider,
          ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 110.h,
              ),
              Expanded(
                child: Container(
                  //height: 548.h,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 250.w,
                            height: 100.h,
                            padding: EdgeInsets.only(left: 1.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jasmin',
                                      // userData.userName,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: textColor),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text('jasmin11@gmail.com'
                                        // userData.userEmail
                                        ),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: primaryColor,
                                  child: CircleAvatar(
                                    radius: 12,
                                    child: Icon(
                                      Icons.edit,
                                      color: primaryColor,
                                    ),
                                    backgroundColor: scaffoldBackgroundColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      listTile(icon: Icons.shop_outlined, title: "My Orders"),
                      listTile(
                          icon: Icons.location_on_outlined,
                          title: "My Delivery Address"),
                      listTile(
                          icon: Icons.person_outline, title: "Refer A Friends"),
                      listTile(
                          icon: Icons.file_copy_outlined,
                          title: "Terms & Conditions"),
                      listTile(
                          icon: Icons.policy_outlined, title: "Privacy Policy"),
                      listTile(icon: Icons.add_chart, title: "About"),
                      listTile(
                          icon: Icons.exit_to_app_outlined, title: "Log Out"),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 60.h, left: 30.w),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    //  userData.userImage ??
                    "https://s3.envato.com/files/328957910/vegi_thumb.png",
                  ),
                  radius: 45,
                  backgroundColor: scaffoldBackgroundColor),
            ),
          )
        ],
      ),
    );
  }
}

Widget listTile({required IconData icon, required String title}) {
  return Column(
    children: [
      Divider(height: 1.h),
      ListTile(
        visualDensity: VisualDensity(vertical: 3.5),
        leading: Icon(icon),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    ],
  );
}
