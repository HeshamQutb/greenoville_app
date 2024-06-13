class UserModel {
  final String userName;
  final String userPhone;
  final String userEmail;
  final String uId;
  final String bio;
  final String userImage;
  final String coverImage;
  final String userRole;
  final bool isVerified;
  final bool hasFarm;
  final bool hasTips;
  UserModel({
    required this.userName,
    required this.userPhone,
    required this.userEmail,
    required this.uId,
    required this.bio,
    required this.userImage,
    required this.coverImage,
    required this.userRole,
    required this.isVerified,
    required this.hasFarm,
    required this.hasTips,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    return UserModel(
      userName: json?['userName'],
      userPhone: json?['userPhone'],
      userEmail: json?['userEmail'],
      uId: json?['uId'],
      bio: json?['bio'],
      userImage: json?['userImage'] ??
          'https://firebasestorage.googleapis.com/v0/b/greenoville-8f9c1.appspot.com/o/users%2Funknown%20user.png?alt=media&token=3f02443f-1b9b-4c79-9d7d-e65cd4479f04',
     coverImage: json?['coverImage'] ??
          'https://firebasestorage.googleapis.com/v0/b/greenoville-8f9c1.appspot.com/o/noImage.jpg?alt=media&token=a6f9a0db-ab6f-417f-b813-a33acdc5d045',
      userRole: json?['userRole'],
      isVerified: json?['isVerified'],
      hasFarm: json?['hasFarm'],
      hasTips: json?['hasTips'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userPhone': userPhone,
      'userEmail': userEmail,
      'uId': uId,
      'bio': bio,
      'userImage': userImage,
      'coverImage': coverImage,
      'userRole': userRole,
      'isVerified': isVerified,
      'hasFarm': hasFarm,
      'hasTips': hasTips,
    };
  }
}
