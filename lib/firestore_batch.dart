// import 'package:cloud_firestore/cloud_firestore.dart';

// Future<void> addHerbsProductsBatch() async {
//   // List of herbs products
//   List<Map<String, dynamic>> herbsProductList = [
//     {
//       "productImage": 'https://pngimg.com/uploads/beet/small/beet_PNG44.png',
//       "productName": 'Beetroot',
//       "productPrice": '95',
//     },
//     {
//       "productImage": 'https://pngimg.com/uploads/celery/small/celery_PNG29.png',
//       "productName": 'Celery',
//       "productPrice": '105',
//     },
//     {
//       "productImage": 'https://pluspng.com/img-png/carrot-hd-png-havuc-png-resmi-carrot-png-600.png',
//       "productName": 'Carrot',
//       "productPrice": '60',
//     },
//   ];

//   // Get Firestore instance
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   // Start a batch
//   WriteBatch batch = firestore.batch();

//   // Add each item to the batch
//   for (Map<String, dynamic> product in herbsProductList) {
//     DocumentReference docRef = firestore.collection('RootProduct').doc();
//     batch.set(docRef, product);
//   }

//   // Commit the batch
//   await batch.commit();
// }
// // used for sending data to firebase and even if u delete this batch data persists in firebase