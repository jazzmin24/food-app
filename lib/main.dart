import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/firebase_options.dart';
import 'package:food_app/provider/product_provider.dart';
import 'package:food_app/provider/review_cart_provider.dart';
import 'package:food_app/provider/user_provider.dart';
import 'package:food_app/provider/wishlist_provider.dart';
import 'package:food_app/screens/home%20/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //await addProductUnitFieldToHerbsProducts();
  //  await addHerbsProductsBatch();
  //await updateProductIds();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ProductProvider>(
              create: (_) => ProductProvider()),
          ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
          ChangeNotifierProvider<ReviewCartProvider>(
              create: (_) => ReviewCartProvider()),
          ChangeNotifierProvider<WishListProvider>(
              create: (_) => WishListProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(
              primaryColor: primaryColor,
              scaffoldBackgroundColor: scaffoldBackgroundColor),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
