class ReviewCartModel {
  String cartId;
  String cartName;
  String cartImage;
  String cartPrice;
  int cartQuantity;
  // var cartUnit;

  ReviewCartModel({
    required this.cartId,
    required this.cartName,
    required this.cartImage,
    required this.cartPrice,
    required this.cartQuantity,
    // this.cartUnit,
  });

  // Method to convert object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'cartId': cartId,
      'cartName': cartName,
      'cartImage': cartImage,
      'cartPrice': cartPrice,
      'cartQuantity': cartQuantity,
      // 'cartUnit': cartUnit,
    };
  }

  // Static method to create object from JSON map
  static ReviewCartModel fromJson(Map<String, dynamic> json) {
    return ReviewCartModel(
      cartId: json['cartId'],
      cartName: json['cartName'],
      cartImage: json['cartImage'],
      cartPrice: json['cartPrice'],
      cartQuantity: json['cartQuantity'],
      // cartUnit: json['cartUnit'],
    );
  }
}




// class ReviewCartModel {
//   String cartId;
//   String cartName;
//   String cartImage;
//   String cartPrice;
//   int cartQuantity;
//   // var cartUnit;
//   ReviewCartModel({
//     required this.cartId,
//     required this.cartName,
//     required this.cartImage,
//     required this.cartPrice,
//     required this.cartQuantity,
//     // this.cartUnit,
//   });
// }
