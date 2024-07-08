class ProductModel {
  String productName;
  String productImage;
  String productPrice;
  // String productId;
  // int productQuantity;
  // List<dynamic> productUnit;

  ProductModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    // this.productQuantity,
    // this.productId,
    // this.productUnit,
  });

  // Method to convert object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
      // Add other fields if needed
      // 'productId': productId,
      // 'productQuantity': productQuantity,
      // 'productUnit': productUnit,
    };
  }

  // Static method to create object from JSON map
  static ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      productImage: json['productImage'],
      productPrice: json['productPrice'].toString(),
      // Add other fields if needed
      // productId: json['productId'],
      // productQuantity: json['productQuantity'],
      // productUnit: json['productUnit'],
    );
  }
}




// class ProductModel {
//   String productName;
//   String productImage;
//   int productPrice;
//   // String productId;
//   // int productQuantity;
//   // List<dynamic>productUnit;
//   ProductModel(
//       {required this.productName,
//       required this.productImage,
//       required this.productPrice
//       // this.productQuantity,
//       // this.productId,
//       // this.productUnit,
//       });
// }
