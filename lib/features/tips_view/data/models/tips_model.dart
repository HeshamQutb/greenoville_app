class TipsModel {
  final bool isVerified;
  final String userRole;
  final String userName;
  final String uId;
  final String bio;
  final String coverImage;
  final String userImage;
  final String description;
  final String tipsId;

  TipsModel({
    required this.isVerified,
    required this.userRole,
    required this.userName,
    required this.uId,
    required this.bio,
    required this.coverImage,
    required this.userImage,
    required this.description,
    required this.tipsId,
  });

  factory TipsModel.fromJson(Map<String, dynamic>? json) {
    return TipsModel(
      isVerified: json?['isVerified'],
      userRole: json?['userRole'],
      userName: json?['userName'],
      uId: json?['uId'],
      bio: json?['bio'],
      coverImage: json?['coverImage'],
      userImage: json?['userImage'],
      description: json?['description'],
      tipsId: json?['tipsId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isVerified': isVerified,
      'userRole': userRole,
      'userName': userName,
      'uId': uId,
      'bio': bio,
      'coverImage': coverImage,
      'userImage': userImage,
      'description': description,
      'tipsId': tipsId,
    };
  }
}
