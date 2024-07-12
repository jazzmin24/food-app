class ProductModel {
  String productName;
  String productImage;
  String productPrice;
  String productId;
  int productQuantity;
  List<String> productUnit;

  ProductModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
    required this.productId,
    required this.productUnit,
  });

  // Method to convert object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
      'productId': productId,
      'productQuantity': productQuantity,
      'productUnit': productUnit,
    };
  }

  // Static method to create object from JSON map
  static ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'] ?? '',
      productImage: json['productImage'] ?? '',
      productPrice: json['productPrice']?.toString() ?? '0',
      productId: json['productId'] ?? '',
      productQuantity: json['productQuantity'] ?? 0,
      //productUnit: json['productUnit'],
      productUnit: List<String>.from(json['productUnit'] ?? [])
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
