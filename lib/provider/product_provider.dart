import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  ProductModel? productModel;

  
List<ProductModel> search = [];

  void productModels(QueryDocumentSnapshot<Object?> element) {
    final data = element.data() as Map<String, dynamic>;
    final productModel = ProductModel.fromJson(data);
    search.add(productModel);
  }

  List<ProductModel> get getAllProductsSearch {
    return [...herbsProductList, ...freshProductList, ...rootProductList];
  }

  //=============herbsProductList
  List<ProductModel> herbsProductList = [];
  fetchHerbsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot<Map<String, dynamic>> value =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();
    value.docs.forEach((element) {
      //print(element.data());
      ProductModel productModel = ProductModel.fromJson(element.data());
      newList.add(productModel);
    });
    //log(newList[0].toString());
    herbsProductList = newList;
    // log(herbsProductList[0].productImage);
    // log(herbsProductList[0].productName);
    // log(herbsProductList[0].productPrice);
    notifyListeners();
  }

  //=============freshProductList
  List<ProductModel> freshProductList = [];
  fetchFreshProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot<Map<String, dynamic>> value =
        await FirebaseFirestore.instance.collection("FreshProduct").get();
    value.docs.forEach((element) {
      // print(element.data());
      ProductModel productModel = ProductModel.fromJson(element.data());
      newList.add(productModel);
    });
    freshProductList = newList;
    notifyListeners();
  }

//=============rootProductList
  List<ProductModel> rootProductList = [];
  fetchRootProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot<Map<String, dynamic>> value =
        await FirebaseFirestore.instance.collection("RootProduct").get();
    value.docs.forEach((element) {
      // print(element.data());
      ProductModel productModel = ProductModel.fromJson(element.data());
      newList.add(productModel);
    });
    rootProductList = newList;
    notifyListeners();
  }
}




// Immutable Operation: When fetching data asynchronously (as in
// fetchFreshProductData), it's generally safer to modify a local
// list (newList) before assigning it to the class-level list 
// (freshProductList). This approach ensures that any changes to the
// list are atomic and do not introduce unexpected behavior during
// iteration or modification.