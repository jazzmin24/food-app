import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/auth/sign_in.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/firebase_options.dart';
import 'package:food_app/screens/home%20/home_screen.dart';
import 'package:food_app/screens/my_profile/my_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(400, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor),
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      ),
    );
  }
}
