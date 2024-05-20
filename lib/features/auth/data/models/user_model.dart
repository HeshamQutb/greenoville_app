class UserModel {
  final String userName;
  final String userPhone;
  final String userEmail;
  final String uId;
  final String? userImage;
  final String userRole;
  final bool isVerified;
  UserModel({
    required this.userName,
    required this.userPhone,
    required this.userEmail,
    required this.uId,
    required this.userImage,
    required this.userRole,
    required this.isVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    return UserModel(
      userName: json?['userName'],
      userPhone: json?['userPhone'],
      userEmail: json?['userEmail'],
      uId: json?['uId'],
      userImage: json?['userImage'] ??
          'https://firebasestorage.googleapis.com/v0/b/greenoville-8f9c1.appspot.com/o/users%2Funknown%20user.png?alt=media&token=3f02443f-1b9b-4c79-9d7d-e65cd4479f04',
      userRole: json?['userRole'],
      isVerified: json?['isVerified'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userPhone': userPhone,
      'userEmail': userEmail,
      'uId': uId,
      'userImage': userImage,
      'userRole': userRole,
      'isVerified': isVerified,
    };
  }
}
