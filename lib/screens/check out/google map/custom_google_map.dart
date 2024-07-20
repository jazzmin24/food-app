// // import 'package:flutter/material.dart';
// // import 'package:flutter/rendering.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:food_app/config/colors.dart';
// // import 'package:food_app/provider/checkout_provider.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:location/location.dart';
// // import 'package:provider/provider.dart';

// // class CustomGoogleMap extends StatefulWidget {
// //   @override
// //   _CustomGoogleMapState createState() => _CustomGoogleMapState();
// // }

// // class _CustomGoogleMapState extends State<CustomGoogleMap> {
// //   LatLng _initialcameraposition =
// //       LatLng(20.5937, 78.9629); //initial display of map
// //   late GoogleMap controller;
// //   Location _location = Location(); // current location
// //   void _onMapCreated(GoogleMap _value) {
// //     controller = _value;
// //     _location.onLocationChanged.listen((event) {
// //       controller.animateCamera(
// //         CameraUpdate.newCameraPosition(
// //           CameraPosition(
// //               target: LatLng(event.latitude!, event.longitude!), zoom: 15),
// //         ),
// //       );
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     CheckoutProvider checkoutProvider = Provider.of(context);
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Container(
// //           height: MediaQuery.of(context).size.height,
// //           width: MediaQuery.of(context).size.width,
// //           child: Stack(
// //             children: [
// //               GoogleMap(
// //                 initialCameraPosition: CameraPosition(
// //                   target: _initialcameraposition,
// //                 ),
// //                 mapType: MapType.normal,
// //                 onMapCreated: _onMapCreated,
// //                 mapToolbarEnabled: true,
// //               ),
// //               Positioned(
// //                 bottom: 0,
// //                 left: 0,
// //                 right: 0,
// //                 child: Container(
// //                   height: 50.h,
// //                   width: double.infinity,
// //                   margin: EdgeInsets.only(
// //                       right: 60.w, left: 10.w, bottom: 40.h, top: 40.h),
// //                   child: MaterialButton(
// //                     onPressed: () async {
// //                       // await _location.getLocation().then((value) {
// //                       //   setState(() {
// //                       //     checkoutProvider.setLoaction = value;
// //                       //   });
// //                       // });
// //                       Navigator.of(context).pop();
// //                     },
// //                     color: primaryColor,
// //                     child: Text("Set Location"),
// //                     shape: StadiumBorder(),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:food_app/config/colors.dart';
// import 'package:food_app/provider/checkout_provider.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';

// class CustomGoogleMap extends StatefulWidget {
//   const CustomGoogleMap({super.key});

//   @override
//   State<CustomGoogleMap> createState() => _CustomGoogleMapState();
// }

// class _CustomGoogleMapState extends State<CustomGoogleMap> {
//   LatLng _initialcameraposition =
//       LatLng(20.5937, 78.9629); //initial display of map

//   late GoogleMap controller;
//   // Location _location = Location(); // current location
//   // void _onMapCreated(GoogleMap _value) {
//   //   controller = _value;
//   //   _location.onLocationChanged.listen((event) {
//   //     controller.animateCamera(
//   //       CameraUpdate.newCameraPosition(
//   //         CameraPosition(
//   //             target: LatLng(event.latitude!, event.longitude!), zoom: 15),
//   //       ),
//   //     );
//   //   });
//   // }
//   @override
//   Widget build(BuildContext context) {
//     CheckoutProvider checkoutProvider = Provider.of(context);
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: Stack(
//             children: [
//               GoogleMap(
//                 initialCameraPosition: CameraPosition(
//                   target: _initialcameraposition,
//                 ),
//                 mapType: MapType.normal,
//                 onMapCreated: _onMapCreated,
//                 mapToolbarEnabled: true,
//               ),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   height: 50.h,
//                   width: double.infinity,
//                   margin: EdgeInsets.only(
//                       right: 60.w, left: 10.w, bottom: 40.h, top: 40.h),
//                   child: MaterialButton(
//                     onPressed: () async {
//                       // await _location.getLocation().then((value) {
//                       //   setState(() {
//                       //     checkoutProvider.setLoaction = value;
//                       //   });
//                       // });
//                       Navigator.of(context).pop();
//                     },
//                     color: primaryColor,
//                     child: Text("Set Location"),
//                     shape: StadiumBorder(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }