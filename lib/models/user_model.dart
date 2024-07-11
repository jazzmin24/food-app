class UserModel {
  String userName;
  String userEmail;
  String userImage;
  String userUid;

  UserModel({
    required this.userName,
    required this.userEmail,
    required this.userImage,
    required this.userUid,
  });

  // Method to convert object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userImage': userImage,
      'userUid': userUid,
    };
  }

  // Static method to create object from JSON map
  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'] ?? '',
      userEmail: json['userEmail'] ?? '',
      userImage: json['userImage'] ?? '',
      userUid: json['userUid'] ?? '',
    );
  }
}
